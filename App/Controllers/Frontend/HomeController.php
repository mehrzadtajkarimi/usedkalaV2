<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Discount;
use App\Models\Photo;
use App\Models\Product;
use App\Models\Product_discount;

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
        $productDiscounts = $this->discountModel->join_discount__with_productDiscounts_products();
        foreach ($productDiscounts as $key=>$value) {
             $productDiscounts[$key]['photo']=$this->photoModel->read_photo_by_id($value['products_id'], 'Product',TRUE)[0];
        }
        // echo '<pre>';
        // var_dump($productDiscounts[0]);
        // echo '</pre><br>';die;

        $data = array(
            'productDiscounts' => $productDiscounts,
        );
        return view('Frontend.index', $data);
    }
}
