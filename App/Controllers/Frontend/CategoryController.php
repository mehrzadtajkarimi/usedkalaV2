<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use App\Models\Wish_list;
use App\Utilities\FlashMessage;
use App\Services\Session\SessionManager;

class CategoryController extends Controller
{
    private $categoryModel;
    private $productModel;
    private $wishListModel;

    public function __construct()
    {
        parent::__construct();
        $this->categoryModel  = new Category;
        $this->productModel   = new Product;
        $this->wishListModel = new Wish_list();
    }

    public function index()
    {
    }
    public function create()
    {
    }
    public function store()
    {
    }

    public function show()
    {
        $slug = $this->request->get_param('slug');
        $slug['slug'] = urldecode($slug['slug']);
        $categoryRow = $this->categoryModel->read_category_by_slug($slug['slug']);
        $parent_id['id'] = $categoryRow['id'];

        $description          = $categoryRow;
        $categories           = $this->categoryModel->category_tree_for_frontend($parent_id, $slug);
        $products             = $this->productModel->join_product__with_single_photo_by_category_id($parent_id['id']);
        $products_is_discount = $this->productModel->join_product__with_productDiscounts_discounts();
        $breadcrumb           = $this->categoryModel->get_categories_for_product_breadcrumb($parent_id);
        $wishlist_products    = $this->wishListModel->read_all_wishList_items('Product');


        // dd($products_is_discount);
        // dd(array_column($products_is_discount,'discount_status','product_id'));
        // dd(array_column($products ,'id'));
        // dd(in_array(90,array_column($products_is_discount,'product_id')));


        foreach ($products_is_discount as  $value) {
            if ($value['discount_status']) {
                $discounts[$value['product_id']] = $value['discount_percent'];
            }
        }


        $selected_wishlist = [];
        foreach ($wishlist_products as $key => $value) {
            $selected_wishlist[] = $value['entity_id'];
        }
        $breadcrumb_item = [];
        foreach (array_reverse($breadcrumb) as $key => $value) {
            foreach ($value as $value2) {
                $breadcrumb_item[$key]['name'] = $value2['name'];
                $breadcrumb_item[$key]['slug'] = $value2['slug'];
            }
        }
        if (is_array($categories)) {
            $data = array(
                'categories'        => $categories,
                'description'       => $description,
                'products'          => $products,
                'discounts'         => $discounts,
                'auth'              => SessionManager::get('auth') ?? false,
                'selected_wishlist' => $selected_wishlist,
                'breadcrumb'        => $breadcrumb_item,
            );
            return view('Frontend.category.show', $data);
        }
    }

    public function edit()
    {
    }
    public function update()
    {
    }
    public function destroy()
    {
    }
}
