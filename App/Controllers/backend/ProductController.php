<?php

namespace App\Controllers\backend;

use App\Controllers\Controller;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use App\Utilities\FlashMessage;

class ProductController extends Controller
{
    private $productModel;
    private $categoryModel;
    private $brandModel;

    public function __construct()
    {
        parent::__construct();
        $this->productModel = new Product();
        $this->categoryModel = new Category();
        $this->brandModel = new Brand();
    }

    public function index()
    {
        $data = array(
            'products' => $this->productModel->read_product(),
            'categories' => $this->categoryModel->category_tree(),
            'brands' => $this->brandModel->read_brand(),
        );
        view('backend.product.index', $data);
    }

    public function create()
    {
        $data = array();
        view('backend.product.create', $data);
    }

    public function store()
    {
        $param=$this->request->params();
        return $this->productModel->create([
            'name' => $param['name'],
        ]);
    }

    public function show()
    {
        $id = $this->request->get_param('id');
        $categories = $this->productModel->inner_join_two('categories', 'photos', 'id', 'entity_id', 'categories.parent_id' . '=' . $id);


        $data = array(
            'categories' => $categories,
        );

        return view('frontend.product.show', $data);
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
