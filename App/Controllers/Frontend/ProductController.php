<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Photo;
use App\Models\Product;
use App\Utilities\FlashMessage;

class ProductController extends Controller
{
    private $productModel;
    private $photoModel;

    public function __construct()
    {
        parent::__construct();
        $this->productModel = new Product();
        $this->photoModel = new Photo();
    }

    public function index()
    {
        $id       = $this->request->get_param('id');
        $products = $this->productModel->join_product_to_photo($id);
        // dd($products);
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
        $parent_id      = $this->request->get_param('id');
        $product = $this->productModel->join_product__with_brand($parent_id);
        dd($product);
        $photos  = $this->photoModel->get('*', [
            'entry_id' =>''
        ]);
        $data    = array(
            'product' => $product,
            'photos' => $photos,
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
