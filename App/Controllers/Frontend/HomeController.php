<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Core\Request;
use App\Models\Discount;
use App\Models\Photo;
use App\Models\Product;
use App\Models\Product_discount;
use App\Services\Basket\Basket;

class HomeController extends Controller
{
    private $discountModel;
    private $photoModel;
    public function __construct()
    {
        parent::__construct();

        $this->productModel          = new Product();
        $this->photoModel            = new Photo();
        $this->product_discountModel = new Product_discount();
        $this->discountModel         = new Discount();
    }

    public function index()
    {
        $cart_items = Basket::items();

        $productDiscounts = $this->discountModel->join_discount__with_productDiscounts_products();


        foreach ($cart_items as  $value) {
            $cart_total[] = $value['count'] * $value['price'];
        }

// dd(count($cart_items));
        $data = array(

            'productDiscounts' => $productDiscounts,
        );
        return view('Frontend.index', $data);
    }
}
