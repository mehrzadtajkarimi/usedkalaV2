<?php

namespace App\Controllers\backend;

use App\Controllers\Controller;
use App\Core\Request;
use App\Models\Category;
use App\Utilities\FlashMessage;

class CategoryController extends Controller
{

    public $model;
    public function __construct() {
        $this->model = new Category;
    }


    public function index()
    {
        $data = array(
            'categories' =>   $this->model->category_tree(),
        );
        return view('backend.category.index', $data);
    }


    public function create()
    {
        global $request;
        $parent_id = $request->get_param('id');
        $data = array(
            'parent' =>   $this->model->first(['id' => $parent_id]),
        );
        return view('backend.category.create', $data);
    }

    public function store()
    {
        global $request;
        $params = $request->params();
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
        global $request;
        $id = $request->get_param('id');

        $data = array(
            'parent' =>   $this->model->first(['id' => $id]),
        );
        return view('backend.category.edit', $data);
    }
    public function update()
    {
        global $request;
        $id = $request->get_param('id');
        echo '<pre>';
        var_dump($id);
        echo '</pre><br>';
        $params = $request->params();
        $this->model->update([
            'parent_id' => $params['parent_id'],
            'name' => $params['name'],
            'slug' => $params['slug'],
            'image' => $params['image'],
        ], ['id' => $id]);
    }
    public function destroy()
    {
        global $request;
        $id = $request->params('id');

        echo  $id;
    }
}
