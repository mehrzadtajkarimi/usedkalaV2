<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Product;
use App\Utilities\FlashMessage;

class ProductController extends Controller
{
    private $productModel;

    public function __construct()
    {
        parent::__construct();
        $this->productModel = new Product();
    }

    public function index()
    {
        $id       = $this->request->get_param('id');
        $products = $this->productModel->join_product__with_category_and_brand_and_photo($id);
        $data     = array(
            'products' => $products,
        );
        view('Frontend.product.index', $data);
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
        $id      = $this->request->get_param('id');
        $product = $this->productModel->join_product__with_brand_and_photo($id);
        $data    = array(
            'product' => $product,
        );
        return view('Frontend.product.show', $data);
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
