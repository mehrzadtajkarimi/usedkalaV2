<?php

namespace App\Controllers\backend;

use App\Controllers\Controller;
use App\Models\Category;
use App\Utilities\FlashMessage;

class CategoryController extends Controller
{
    private $categoryModel;

    public function __construct()
    {
        parent:: __construct();
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

        $category = $this->categoryModel->first(['id' => $id]);

        $data   = array(

            'category' => $category,
        );
        return view('backend.category.create', $data);
    }

    public function store()
    {
        $params = $this->request->params();
        // echo'<pre>';var_dump($params);die;
        $this->categoryModel->create([
            'parent_id' => $params['parent_id'],
            'name'      => $params['name'],
            'slug'      => $params['slug'],
            'image'     => $params['image'],
        ]);
        FlashMessage:: add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/category');
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
        FlashMessage:: add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/category');
    }
    public function destroy()
    {
        $id = $this->request->get_param('id');
        $this->categoryModel->delete(['id'=>$id]);

        FlashMessage:: add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/category');
    }
}
