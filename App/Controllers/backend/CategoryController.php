<?php

namespace App\Controllers\backend;

use App\Core\Request;
use App\Models\Category;

class CategoryController
{
    public function index()
    {
        $children = new Category();

        $data = array(
            'children' =>  $children->child(),
        );
        return view('backend.category.index', $data);
    }
}
