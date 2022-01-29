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
use App\Models\Product_category;
use App\Models\Product_discount;
use App\Models\StaticPages;
use App\Models\Slider;
use App\Models\Wish_list;
use App\Models\PageMetas;
use App\Services\Basket\Basket;
use App\Utilities\TimeUtil;

class HomeController extends Controller
{
    private $discountModel;
    private $sliderModel;
    private $photoModel;
    private $productModel;
    private $brandModel;
    private $staticPagesModel;
    private $categoryModel;
    private $productCategoryModel;
    private $wishListModel;
    private $blogModel;
    private $pageMetasModel;
    public function __construct()
    {
        parent::__construct();

        $this->sliderModel           = new Slider();
        $this->photoModel            = new Photo();
        $this->product_discountModel = new Product_discount();
        $this->discountModel         = new Discount();
        $this->productModel          = new Product();
        $this->brandModel            = new Brand();
        $this->staticPagesModel          = new StaticPages();
        $this->categoryModel         = new Category();
        $this->productCategoryModel  = new Product_category();
        $this->blogModel             = new Blog();
        $this->wishListModel         = new Wish_list();
        $this->pageMetasModel         = new PageMetas();
		$this->jDateObj    = new TimeUtil();
    }

    public function index()
    {
        // $cart_items              = Basket::items();
        $category_id             = 110;                                                                                //ID حراجی
        $brand_id                = 12;                                                                                 //ID Intel
        $product_category_server = $this->productModel->join_product__with_single_photo_by_category_id(168);           //id server name
        $product_category_rack   = $this->productModel->join_product__with_single_photo_by_category_id(122);           //id rack name
        $product_category_switch = $this->productModel->join_product__with_single_photo_by_category_id(169);           //id switch name
        $product_discounts       = $this->discountModel->join_discount__with_productDiscounts_products_photo();
        $latest_products         = $this->productModel->join_product_to_photo__for_latest_product();
        $sale_products           = $this->productModel->join_product_to_photo__for_sale_product();
        $featured_products       = $this->productModel->join_product_to_photo__for_featured_product();
        $products_haraji         = $this->productModel->join_product__with_single_photo_by_category_id($category_id);
        $products_cisco          = $this->productModel->join_product_to_photo_by_brand_id($brand_id);
        $sliders                 = $this->sliderModel->read_slider();
        $brands                  = $this->brandModel->read_brand();
        $staticPage                 = $this->staticPagesModel->read_staticPages();
        $latest_blogs            = $this->blogModel->join_blog_to_photo_by_limit(2);
        $wishlist_products       = $this->wishListModel->read_all_wishList_items('Product');
        $home_page_active_menu   = 'page-template-template-homepage-v1';
        $selected_wishlist       = [];
		$pageMetas=$this->pageMetasModel->read_pagemeta(1);
		
		foreach($latest_blogs as $key=>$blogRow)
			$latest_blogs[$key]['created_at']=$this->jDateObj->jalaliDate($latest_blogs[$key]['created_at']);
		
        foreach ($wishlist_products as $key => $value)
            $selected_wishlist[] = $value['entity_id'];
        
        foreach ($brands as $key => $value)
            $brands[$key]['product'] = $this->productModel->join_product__with_photo_by_brand_id($value['id']);
        
		$brands=array_reverse($brands);

        foreach ($sliders as $key => $value) {
            $photos = $this->photoModel->read_photo_by_id($value['id'], 'Slider', true)[0];
            $sliders[$key]['photo']  = $photos;
        }

        // foreach ($cart_items as  $value) {
        //     $cart_total[] = $value['count'] * $value['price'];
        // }

        $data = array(

            'product_servers'       => $product_category_server,
            'product_racks'         => $product_category_rack,
            'product_switch'        => $product_category_switch,
            'product_discounts'     => $product_discounts,
            'product_brands'        => $brands,
            'product_haraji'        => $products_haraji,
            'product_cisco'         => $products_cisco,
            'latest_products'       => $latest_products,
            'sale_products'         => $sale_products,
            'featured_products'     => $featured_products,
            'sliders'               => $sliders,
            'staticPage'               => $staticPage,
            'latest_blogs'          => $latest_blogs,
            'home_page_active_menu' => $home_page_active_menu,
            'selected_wishlist'     => $selected_wishlist,
			'headSeoTitle' => $pageMetas['html_title'],
			'headSeoDescription' => $pageMetas['html_desc'],
			'headSeoRobots' => $pageMetas['robots'],
			'headSeoCanonical' => $pageMetas['canonical']
        );
        return view('Frontend.index', $data);
    }
}
