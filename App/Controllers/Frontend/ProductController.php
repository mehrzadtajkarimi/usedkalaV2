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
        $product = $this->productModel->join_product__with_brand($id);
        $photos  = $this->photoModel->read_photo_by_id($id, 'Product');
        $photo   = $this->photoModel->read_single_photo_by_id('0', $id, 'Product');
        // dd($photo);
        $data    = array(
            'product' => $product[0],
            'photos' => $photos,
            'photo' => $photo[0],
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
