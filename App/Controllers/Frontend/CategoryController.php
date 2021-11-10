<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use App\Utilities\FlashMessage;

class CategoryController extends Controller
{
    private $categoryModel;
    private $productModel;

    public function __construct()
    {
        parent::__construct();
        $this->categoryModel = new Category;
        $this->productModel  = new Product;
    }

    public function index()
    {
    }
    public function create()
    {
    }
    public function store()
    {
    }

    public function show()
    {
        $parent_id = $this->request->get_param('id');
        $slug = $this->request->get_param('slug');

        $description = $this->categoryModel->read_category($parent_id);
        $categories  = $this->categoryModel->category_tree_for_frontend($parent_id,$slug);
        $products    = $this->productModel->join_product__with_single_photo_by_category_id();

        if (is_array($categories)) {
            $data = array(
                'categories'  => $categories,
                'description' => $description,
                'products'    => $products,
            );
            return view('Frontend.category.show', $data);
        }
    }

    public function edit()
    {
    }
    public function update()
    {
    }
    public function destroy()
    {
    }
}
