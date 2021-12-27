<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Brand;
use App\Models\Photo;
use App\Services\Upload\UploadedFile;
use App\Utilities\FlashMessage;

class BrandController extends Controller
{
    private $photoModel;
    private $brandModel;

    public function __construct()
    {
        parent::__construct();
        $this->photoModel = new Photo();
        $this->brandModel = new Brand();
    }

    public function index()
    {
        $data = array(
            'photos' => $this->photoModel->read_photo(),
            'brands' => $this->brandModel->read_brand(),
        );
        view('Backend.brand.index', $data);
    }

    public function create()
    {
    }

    public function store()
    {
        $params = $this->request->params();

        $files = $this->request->files();
        $files_param             = $files['brand_image'];
        $files_param_tmp_name    = $files_param['tmp_name'];
        $check_file_param_exists = !empty($files_param_tmp_name[0]);
        if ($check_file_param_exists) {
            $is_create_brand = $this->brandModel->create_brand([
                'name'      => $params['brand-name'],
                'sort'      => $params['brand-sort'],
            ]);

            $file = new UploadedFile($files_param);
            $file_paths = $file->save();
            if ($file_paths) {

                $is_create_photo = $this->photoModel->create_photo('Brand', $is_create_brand, $file_paths[0], 'brand_image');


                if ($is_create_brand) {
                    FlashMessage::add("ایجاد برند با موفقیت انجام شد");
                } elseif ($is_create_photo) {
                    FlashMessage::add(" ایجاد تصویر موفقیت انجام شد", FlashMessage::ERROR);
                } else {
                    FlashMessage::add(" مشکلی در ایجاد محصول رخ داد ", FlashMessage::ERROR);
                }
                return $this->request->redirect('admin/brand');
            }
        } else {
            $this->brandModel->create_brand([
                'name'      => $params['brand-name'],
                'sort'      => $params['brand-sort'],
            ]);
            FlashMessage::add("مقادیر بدونه ضمیمه عکس با موفقیت در دیتابیس ذخیره شد", FlashMessage::WARNING);
            return $this->request->redirect('admin/brand');
        }
    }

    public function show()
    {
        $id = $this->request->get_param('id');
        $categories = $this->productModel->inner_join_two('categories', 'photos', 'id', 'entity_id', 'categories.parent_id' . '=' . $id);


        $data = array(
            'categories' => $categories,
        );

        return view('Backend.brand.show', $data);
    }

    public function edit()
    {
        $id = $this->request->get_param('id');
        $brandPhoto = $this->photoModel->read_photo_by_id($id, 'Brand');
        if (count($brandPhoto) > 0) $brandPhoto = $brandPhoto[0];

        $data = array(
            'brands' => $this->brandModel->read_brand($id),
            'photo' => $brandPhoto
        );
        view('Backend.brand.edit', $data);
    }


    public function update()
    {
        $id = $this->request->get_param('id');
        $params = $this->request->params();
        $files = $this->request->files();
        $files_param             = $files['brand_image'];
        $files_param_tmp_name    = $files_param['tmp_name'];
        $check_file_param_exists = !empty($files_param_tmp_name[0]);
        if ($check_file_param_exists) {
            $file = new UploadedFile($files_param);
            $file_paths = $file->save();
            if ($file_paths) {
                $is_update_photo = $this->photoModel->update_photo('Brand', $id, $file_paths[0], 'brand_image');

                if ($is_update_photo) {
                    FlashMessage::add("ویرایش برند با موفقیت انجام شد");
                } else {
                    FlashMessage::add(" مشکلی در ویرایش برند رخ داد ", FlashMessage::ERROR);
                }
            }
        } else {
            $this->brandModel->update_brand([
                'name'      => $params['brand-name'],
                'sort'      => $params['brand-sort'],
            ], $id);
            FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
        }
        return $this->request->redirect('admin/brand');
    }


    public function destroy()
    {
        $id = $this->request->get_param('id');
        $is_deleted_brand =   $this->brandModel->delete_brand($id);
        $is_deleted_photo =   $this->photoModel->delete_photo($id);
        if ($is_deleted_brand && $is_deleted_photo) {
            # code...
            FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
            return $this->request->redirect('admin/brand');
        }
        FlashMessage::add(" مشکلی در حذف برند پیش آمده است", FlashMessage::ERROR);
        return $this->request->redirect('admin/brand');
    }
}
