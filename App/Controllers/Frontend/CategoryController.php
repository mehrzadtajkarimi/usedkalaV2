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
        parent:: __construct();
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
		$slug['slug']=urldecode($slug['slug']);
		$categoryRow=$this->categoryModel->read_category_byslug($slug['slug']);
		$parent_id['id']=$categoryRow['id'];
		
        $description = $categoryRow['description'];
        $categories  = $this->categoryModel->category_tree_for_frontend($parent_id,$slug);
        $products    = $this->productModel->join_product__with_single_photo_by_category_id($parent_id['id']);
		
        $wishlist_products = $this->wishListModel->read_all_wishList_items('Product');
        $selected_wishlist = [];
        foreach ($wishlist_products as $key => $value){
            $selected_wishlist[] = $value['entity_id'];
        }

        if (is_array($categories)) {
            $data = array(
                'categories'        => $categories,
                'description'       => $description,
                'products'          => $products,
                'auth'              => SessionManager::get('auth') ?? false,
                'selected_wishlist' => $selected_wishlist,
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
