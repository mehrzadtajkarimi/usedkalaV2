<?php

namespace App\Controllers\backend;

use App\Controllers\Controller;
use App\Models\Category;
use App\Utilities\FlashMessage;

class CategoryController extends Controller
{
    private $Model;

    public function __construct()
    {
        parent:: __construct();
        $this->Model = new Category;
    }

    public function index()
    {
        $data = array(
            'categories' => $this->Model->category_tree(),
        );
        return view('backend.category.index', $data);
    }


    public function create()
    {
        $id = $this->request->get_param('id');

        $parent = $this->Model->first(['id' => $id]);
        $data   = array(
            'parent' => $parent,
        );
        return view('backend.category.create', $data);
    }

    public function store()
    {
        $params = $this->request->params();
        echo'<pre>';var_dump($params);die;
        $this->Model->create([
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
            'parent' => $this->Model->first(['id' => $id]),
        );
        return view('backend.category.edit', $data);
    }
    public function update()
    {
        echo'<pre>';var_dump('ddddddddddd');die;
        $id = $this->request->get_param('id');
        echo '<pre>';
        var_dump($id);
        echo '</pre><br>';
        $params = $this->request->params();
        $this->Model->update([
            'parent_id' => $params['parent_id'],
            'name'      => $params['name'],
            'slug'      => $params['slug'],
            'image'     => $params['image'],
        ], ['id' => $id]);
    }
    public function destroy()
    {
        $id = $this->request->params('id');

        echo  $id;
    }
}
