<?php

namespace App\Controllers\backend;

use App\Core\Request;
use App\Models\Category;

class CategoryController
{


    public function index()
    {
        // $category =  new Category();


        $data = array(
            // 'children' =>  $category->child(),
        );

        return view('backend.category.index', $data);
    }
}
