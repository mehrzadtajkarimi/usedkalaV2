<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Category;
use App\Models\Photo;
use App\Services\Upload\UploadedFile;
use App\Utilities\FlashMessage;

class CategoryController extends Controller
{
    private $categoryModel;
    private $photoModel;

    public function __construct()
    {
        parent::__construct();
        $this->categoryModel = new Category;
        $this->photoModel    = new Photo;
    }

    public function index()
    {
        $data = array(
            'categories' => $this->categoryModel->category_tree_for_backend(),
        );
        return view('Backend.category.index', $data);
    }


    public function create()
    {
        $id       = $this->request->get_param('id');
        $category = $this->categoryModel->first(['id' => $id]) ?? 0;
        $data     = array(
            'category' => $category,
        );
        return view('Backend.category.create', $data);
    }


    public function store()
    {
        $params = $this->request->params();

        $id = $this->request->get_param('id');
        $request = array(
            'parent_id'   => $id,
            'slug'        => create_slug($params['slug']),
            'name'        => $params['name'],
            'description' => $params['description'],
            'status'      => $params['status'] ?? '0',
        );
        $files                = $this->request->files();
        $files_param          = $files['image_category'];
        $files_param_tmp_name = $files_param['tmp_name'];
        $file_param_exists    = !empty($files_param_tmp_name[0]);
        if ($file_param_exists) {
            $is_create_category = $this->categoryModel->create_category($request);
            $file               = new UploadedFile($files_param);
            $file_paths         = $file->save();
            if ($file_paths) {

                $is_create_photo = $this->photoModel->create_photo('Category', $is_create_category, $file_paths[0], 'image_category');


                if ($is_create_category) {
                    FlashMessage::add("ایجاد محصول موفقیت انجام شد");
                } elseif ($is_create_photo) {
                    FlashMessage::add(" ایجاد تصویر موفقیت انجام شد", FlashMessage::ERROR);
                } else {
                    FlashMessage::add(" مشکلی در ایجاد محصول رخ داد ", FlashMessage::ERROR);
                }
                return $this->request->redirect('admin/category');
            }
        } else {
            $this->categoryModel->create_category($request);
            FlashMessage::add("مقادیر بدونه ضمیمه عکس با موفقیت در دیتابیس ذخیره شد", FlashMessage::WARNING);
            return $this->request->redirect('admin/category');
        }
    }



    public function edit()
    {
        $id = $this->request->get_param('id');

        $data = array(
            'category' => $this->categoryModel->first(['id' => $id]),
            'photo'    => $this->photoModel->first(['entity_id' => $id]),
        );
        return view('Backend.category.edit', $data);
    }



    public function update()
    {
        $params = $this->request->params();

        $id                   = $this->request->get_param('id');
        $files                = $this->request->files();
        $files_param          = $files['image_category'];
        $files_param_tmp_name = $files_param['tmp_name'];
        $file_param_exists    = !empty($files_param_tmp_name[0]);
        if ($file_param_exists) {
            $file       = new UploadedFile($files_param);
            $file_paths = $file->save();
            if ($file_paths) {

                $is_update_photo = $this->photoModel->update_photo('Category', $id, $file_paths[0], 'image_category');

                if ($is_update_photo) {
                    FlashMessage::add("ویرایش دسته بندی موفقیت انجام شد");
                } else {
                    FlashMessage::add(" مشکلی در ویرایش دسته بندی رخ داد ", FlashMessage::ERROR);
                }
            }
        } else {
            $this->categoryModel->update_category([
                'slug'        => create_slug($params['slug']),
                'name'        => $params['name'],
                'description' => $params['description'],
                'status'      => $params['status'] == 'on' ? 1 : 0,
            ], $id);
            FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
        }
        return $this->request->redirect('admin/category');
    }



    public function destroy()
    {
        $id     = $this->request->get_param('id');
        $is_cat = $this->categoryModel->has(['parent_id' => $id]);
        if ($is_cat == false) {
            $this->categoryModel->delete_category($id);
            $this->photoModel->delete_photo($id);

            FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
            return $this->request->redirect('admin/category');
        }
        FlashMessage::add("به دلیل وجود زیر دسته امکان حذف وجود ندارد", FlashMessage::ERROR);
        return $this->request->redirect('admin/category');
    }
}
