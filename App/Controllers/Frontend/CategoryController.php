<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Category;
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
        $category_id = $this->request->get_param('id');
        $data = array(
            'products' => $this->productModel->read_product($category_id),
        );
        view('Backend.product.show', $data);
    }

    public function create()
    {
        //
    }

    public function store()
    {
        //
    }

    public function show()
    {
        $parent_id = $this->request->get_param('id');
        $categories = $this->categoryModel->category_tree_for_frontend($parent_id);
        // dd($categories);
        if (is_array($categories)) {
            $data = array(
                'categories' => $categories,
            );
            return view('Frontend.category.show', $data);
        }
       
  
    }

    public function edit()
    {
        //
    }


    public function update()
    {
        //
    }


    public function destroy()
    {
        //
    }
}
