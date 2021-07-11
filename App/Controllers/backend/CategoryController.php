<?php

namespace App\Controllers\backend;

use App\Controllers\Controller;
use App\Models\Category;
use App\Services\Upload\UploadedFile;
use App\Utilities\FlashMessage;

class CategoryController extends Controller
{
    private $categoryModel;

    public function __construct()
    {
        parent::__construct();
        $this->categoryModel = new Category;
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
        if (!empty($files['image']['tmp_name'])) {
            $file = new UploadedFile('image');
            $file_url = $file->save();
            if ($file_url) {
                $this->categoryModel->create([
                    'image' => $files['image'],
                    'parent_id' => $params['parent_id'],
                    'name'      => $params['name'],
                    'slug'      => $params['slug'],
                ]);
                FlashMessage::add("آپلود فایل با ضمیمه عکس با موفقیت انجام شد", FlashMessage::SUCCESS);
                return $this->request->redirect('admin/category');

            } else {
                FlashMessage::add("مشکلی در آپلود قایل رخ  داده است", FlashMessage::ERROR);
                $file->destroy();
                return $this->request->redirect('admin/category');
            }
        }else{
            $this->categoryModel->create([
                'parent_id' => $params['parent_id'],
                'name'      => $params['name'],
                'slug'      => $params['slug'],
            ]);
            FlashMessage::add("مقادیر بدونه ضمیمه عکس با موفقیت در دیتابیس ذخیره شد", FlashMessage::WARNING);
            return $this->request->redirect('admin/category');
        }
    }



    public function edit()
    {
        $id = $this->request->get_param('id');

        $data = array(
            'parent' => $this->categoryModel->first(['id' => $id]),
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
}
