<?php

namespace App\Controllers\frontend;

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
        $id = $this->request->get_param('id');
        $products = $this->productModel->join_product_to_category($id);
        $photo = $this->productModel->join_product_to_photo($id);
        $brands = $this->productModel->join_product_to_brand($id);
        dd($brands);
        $data = array(
            'product' => $products[0],
            'brand' => $brands[0],
        );
        view('frontend.product.index', $data);
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
        $id = $this->request->get_param('id');
        $products = $this->productModel->join_product_to_photo($id);
        $brands = $this->productModel->join_product_to_brand($id);
        dd($brands);
        $data = array(
            'product' => $products[0],
            'brand' => $brands[0],
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
