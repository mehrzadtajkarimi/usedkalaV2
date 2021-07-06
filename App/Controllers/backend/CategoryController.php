<?php

namespace App\Controllers\backend;

use App\Controllers\Controller;
use App\Utilities\FlashMessage;

class CategoryController extends Controller
{



    public function index()
    {
        $data = array(
            'categories' =>   $this->model->category_tree(),
        );
        return view('backend.category.index', $data);
    }


    public function create()
    {
        $params = $this->request->params();


        $this->model->create([
            'parent_id' => $params['parent_id'],
            'name' => $params['name'],
            'slug' => $params['slug'],
        ]);
        FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/category');
    }
    public function edit()
    {
        $id = $this->request->get_param('id');

        echo  $id;
    }
    public function delete()
    {
        $id = $this->request->get_param('id');

        echo  $id;
    }
}
