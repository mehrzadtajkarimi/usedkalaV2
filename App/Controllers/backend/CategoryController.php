<?php

namespace App\Controllers\backend;

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
        $this->photoModel = new Photo;
    }

    public function index()
    {
        $data = array(
            'categories' => $this->categoryModel->category_tree(),
        );
        return view('backend.category.index', $data);
    }


    public function create()
    {
        $id = $this->request->get_param('id');
        $category = $this->categoryModel->first(['id' => $id]) ?? 0;
        $data   = array(
            'category' => $category,
        );
        return view('backend.category.create', $data);
    }


    public function store()
    {
        $params = $this->request->params();
        $files = $this->request->files();
        if (!empty($files['image_category']['tmp_name'])) {
            $file = new UploadedFile('image_category');
            $file_url = $file->save();
            if ($file_url) {


                $is_create_category = $this->create_category($params);
                $is_create_photo = $this->photoModel->create_photo('Category', $is_create_category, $file_url, 'image_category');


                if ($is_create_photo && $is_create_category) {
                    FlashMessage::add("ایجاد دسته بندی موفقیت انجام شد");
                } else {
                    FlashMessage::add(" مشکلی در ایجاد دسته بندی رخ داد ", FlashMessage::ERROR);
                }
                return $this->request->redirect('admin/category');
            }
        } else {
            $this->create_category($params);
            FlashMessage::add("مقادیر بدونه ضمیمه عکس با موفقیت در دیتابیس ذخیره شد", FlashMessage::WARNING);
            return $this->request->redirect('admin/category');
        }
    }



    public function edit()
    {
        $id = $this->request->get_param('id');

        $data = array(
            'category' => $this->categoryModel->first(['id' => $id]),
            'photo' => $this->photoModel->first(['entity_id' => $id]),
        );
        return view('backend.category.edit', $data);
    }



    public function update()
    {
        $id = $this->request->get_param('id');
        $params = $this->request->params();
        $this->categoryModel->update([
            'name'      => $params['name'],
            'slug'      => $params['slug'],
            'image'     => $params['image'],
        ], ['id' => $id]);
        FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/category');
    }



    public function destroy()
    {
        $id = $this->request->get_param('id');
        $is_cat = $this->categoryModel->has(['parent_id' => $id]);
        if ($is_cat == false) {
            $this->categoryModel->delete(['id' => $id]);

            FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
            return $this->request->redirect('admin/category');
        }
        FlashMessage::add("به دلیل وجود زیر دسته امکان حذف وجود ندارد", FlashMessage::ERROR);
        return $this->request->redirect('admin/category');
    }


    public function create_category($params)
    {
        $categoryModel = $this->categoryModel->create([
            'parent_id' => $params['parent_id'],
            'name'      => $params['name'],
            'slug'      => $params['slug'],
        ]);
        return $categoryModel;
    }
}
