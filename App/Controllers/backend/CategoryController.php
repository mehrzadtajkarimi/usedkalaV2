<?php

namespace App\Controllers\backend;

use App\Controllers\Controller;
use App\Core\Request;
use App\Models\Category;

class CategoryController extends Controller
{
    private $model;
    public function __construct()
    {
        $this->model = new Category();
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
