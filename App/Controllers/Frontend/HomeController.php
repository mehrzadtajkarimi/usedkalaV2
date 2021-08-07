<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Discount;
use App\Models\Product;
use App\Models\Product_discount;

class HomeController extends Controller
{
   private $productModel;
   private $discountModel;
   private $product_discountModel;
    public function __construct()
    {
        parent::__construct();

        $this->productModel = new Product();
        $this->product_discountModel = new Product_discount();
        $this->discountModel = new Discount();

    }

    public function index()
    {


        // echo '<br><hr><pre style="background:#FF5722; border-radius: 10px; padding: 20PX">';
        // var_dump($this->discountModel->join_discount__with_productDiscounts_products());
        // die('LINE' .' => '. __LINE__ . PHP_EOL .'FILE' .' => '. __FILE__ );

        $data = array(
            'bestsellers'=>[],
            'discounts' =>[],
        );
        return view('Frontend.index', $data);
    }
}
