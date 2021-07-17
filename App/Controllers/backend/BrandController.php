<?php

namespace App\Controllers\backend;

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
        view('backend.brand.index', $data);
    }

    public function create()
    {
    }

    public function store()
    {
        $params = $this->request->params();

        $files = $this->request->files();
        if (!empty($files['brand_image']['tmp_name'])) {
            $file = new UploadedFile('brand_image');
            $file_url = $file->save();
            if ($file_url) {


                $is_create_brand = $this->brandModel->create_brand([
                    'name'      => $params['brand-name'],
                    'sort'      => $params['brand-sort'],
                ]);
                $is_create_photo = $this->photoModel->create_photo('Brands', $is_create_brand, $file_url, 'brand_image');


                if ($is_create_photo && $is_create_brand) {
                    FlashMessage::add("ایجاد برند موفقیت انجام شد");
                } else {
                    FlashMessage::add(" مشکلی در ایجاد برند رخ داد ", FlashMessage::ERROR);
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

        return view('frontend.brand.show', $data);
    }

    public function edit()
    {
        $id = $this->request->get_param('id');

        $data = array(
            'brands' => $this->brandModel->read_brand($id),
            'photo' => $this->photoModel->read_photo($id),

        );
        view('backend.brand.edit', $data);
    }


    public function update()
    {
        $id = $this->request->get_param('id');
        $params = $this->request->params();

        $files = $this->request->files();
        if (!empty($files['brand_image']['tmp_name'])) {
            $file = new UploadedFile('brand_image');
            $file_url = $file->save();
            if ($file_url) {
                $is_update_photo = $this->photoModel->update_photo('Brand', $id, $file_url, 'brand_image');

                if ($is_update_photo ) {
                    FlashMessage::add("ویرایش برند بندی موفقیت انجام شد");
                } else {
                    FlashMessage::add(" مشکلی در ویرایش برند بندی رخ داد ", FlashMessage::ERROR);
                }
            }
        } else {
            $this->brandModel->update_brand($params, $id);
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
