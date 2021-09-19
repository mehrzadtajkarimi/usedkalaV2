<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Core\Request;
use App\Models\Discount;
use App\Models\Photo;
use App\Models\Product;
use App\Models\Product_discount;
use App\Models\Slider;
use App\Services\Basket\Basket;

class HomeController extends Controller
{
    private $discountModel;
    private $sliderModel;
    private $photoModel;
    private $productModel;
    public function __construct()
    {
        parent::__construct();

        $this->sliderModel           = new Slider();
        $this->photoModel            = new Photo();
        $this->product_discountModel = new Product_discount();
        $this->discountModel         = new Discount();
        $this->productModel          = new Product();
    }

    public function index()
    {
        $cart_items       = Basket::items();
        $product_discounts = $this->discountModel->join_discount__with_productDiscounts_products_photo();
        $sliders          = $this->sliderModel->read_slider();
        $latest_products  = $this->productModel->join_product_to_photo();
        foreach ($sliders as $key => $value) {
            $photos = $this->photoModel->read_photo_by_id($value['id'], 'Slider', true)[0];
            $sliders[$key]['photo']  = $photos;
        }
        foreach ($cart_items as  $value) {
            $cart_total[] = $value['count'] * $value['price'];
        }

        $data = array(

            'product_discounts' => $product_discounts,
            'sliders'          => $sliders,
            'latest_products'  => $latest_products,
        );
        return view('Frontend.index', $data);
    }
}
