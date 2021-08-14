<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Photo;
use App\Models\Product;
use App\Models\Product_discount;
use App\Utilities\FlashMessage;

class ProductController extends Controller
{
    private $productModel;
    private $photoModel;

    public function __construct()
    {
        parent::__construct();
        $this->productModel         = new Product();
        $this->photoModel           = new Photo();
        $this->ProductDiscountModel = new Product_discount();
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
        $id       = $this->request->get_param('id');

        $photos          = $this->photoModel->read_photo_by_id($id, 'Product');
        $photo           = $this->photoModel->read_single_photo_by_id('0', $id, 'Product')[0];
        $product         = $this->productModel->read_product($id);
        $productDiscount = $this->productModel->join_product__with_productDiscounts_discounts($id)[0]??'' ;
        // dd(empty($productDiscount) ? $product : $productDiscount['discounts_status']);
        $data    = array(
            'product'          => empty($productDiscount) ? $product : $productDiscount,
            'photos'           => $photos,
            'photo'            => $photo,
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
