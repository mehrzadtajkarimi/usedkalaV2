<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Core\Request;
use App\Models\Blog;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Discount;
use App\Models\Photo;
use App\Models\Product;
use App\Models\Product_discount;
use App\Models\Setting;
use App\Models\Slider;
use App\Services\Basket\Basket;
use App\Services\Session\SessionManager;

class HomeController extends Controller
{
    private $discountModel;
    private $sliderModel;
    private $photoModel;
    private $productModel;
    private $brandModel;
    private $settingModel;
    private $categoryModel;
    private $blogModel;
    public function __construct()
    {
        parent::__construct();

        $this->sliderModel           = new Slider();
        $this->photoModel            = new Photo();
        $this->product_discountModel = new Product_discount();
        $this->discountModel         = new Discount();
        $this->productModel          = new Product();
        $this->brandModel            = new Brand();
        $this->settingModel          = new Setting();
        $this->categoryModel         = new Category();
        $this->blogModel             = new Blog();
    }

    public function index()
    {
        $cart_items              = Basket::items();
        $product_category_server = $this->categoryModel->join_category_to_product_categories(122);               //id server name
        $product_category_rack   = $this->categoryModel->join_category_to_product_categories(126);               //id rack name
        $product_category_switch = $this->categoryModel->join_category_to_product_categories(128);               //id switch name
        $product_discounts       = $this->discountModel->join_discount__with_productDiscounts_products_photo();
        $latest_products         = $this->productModel->join_product_to_photo__for_latest_product();
        $sale_products           = $this->productModel->join_product_to_photo__for_sale_product();
        $featured_products       = $this->productModel->join_product_to_photo__for_featured_product();
        $sliders                 = $this->sliderModel->read_slider();
        $brands                  = $this->brandModel->read_brand();
        $setting                 = $this->settingModel->read_setting();
        $latest_blogs            = $this->blogModel->join_blog_to_photo_by_limit(2);
        $home_page_active_menu = 'page-template-template-homepage-v1';

        foreach ($brands as $key => $value) {
            $brands[$key]['product'] = $this->productModel->join_product__with_photo_by_brand_id($value['id']);
        }

        foreach ($sliders as $key => $value) {
            $photos = $this->photoModel->read_photo_by_id($value['id'], 'Slider', true)[0];
            $sliders[$key]['photo']  = $photos;
        }

        foreach ($cart_items as  $value) {
            $cart_total[] = $value['count'] * $value['price'];
        }

        $data = array(

            'product_servers'       => $product_category_server,
            'product_racks'         => $product_category_rack,
            'product_switch'        => $product_category_switch,
            'product_discounts'     => $product_discounts,
            'product_brands'        => $brands,
            'latest_products'       => $latest_products,
            'sale_products'         => $sale_products,
            'featured_products'     => $featured_products,
            'sliders'               => $sliders,
            'setting'               => $setting,
            'latest_blogs'          => $latest_blogs,
            'home_page_active_menu' => $home_page_active_menu,
			'onLoadMsg'				=> SessionManager::get('onLoadMsg')
        );
		SessionManager::remove('onLoadMsg');
        return view('Frontend.index', $data);
    }
}
