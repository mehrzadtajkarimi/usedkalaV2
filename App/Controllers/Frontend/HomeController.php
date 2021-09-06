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
    public function __construct()
    {
        parent::__construct();

        $this->sliderModel           = new Slider();
        $this->photoModel            = new Photo();
        $this->product_discountModel = new Product_discount();
        $this->discountModel         = new Discount();
    }

    public function index()
    {
        $cart_items       = Basket::items();
        $productDiscounts = $this->discountModel->join_discount__with_productDiscounts_products();
        $sliders        = $this->sliderModel->read_slider();


        foreach ($sliders as  $value) {
            # code...
            $sliders[] =$this->photoModel->read_photo_by_id($value['id'], 'Slider');
        }
// dd($sliders);

        foreach ($cart_items as  $value) {
            $cart_total[] = $value['count'] * $value['price'];
        }

        // dd(count($cart_items));
        $data = array(

            'productDiscounts' => $productDiscounts,
            'sliders'          => $sliders,
        );
        return view('Frontend.index', $data);
    }
}
