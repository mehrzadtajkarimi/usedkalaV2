<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use App\Models\Product_tag;
use App\Models\Tag;
use App\Models\Taggable;
use App\Models\Wish_list;
use App\Services\Session\SessionManager;

class TagController extends Controller
{
    private $categoryModel;
    private $productModel;
    private $taggableModel;
    private $wishListModel;

    public function __construct()
    {
        parent::__construct();
        $this->categoryModel = new Category;
        $this->productModel  = new Product;
        $this->taggableModel = new Taggable();
        $this->wishListModel = new Wish_list();
    }

    public function index()
    {
        $params = $this->request->params();

        $taggable = $this->taggableModel->join_taggable_by_tag_id($params['type'],$params['id']) ?? '';
        $wishlist_products = $this->wishListModel->read_all_wishList_items('Product');
        $selected_wishlist = [];
        foreach ($wishlist_products as $key => $value){
            $selected_wishlist[] = $value['entity_id'];
        }

        $data = array(
            'products'          => $taggable,
            'selected_wishlist' => $selected_wishlist,
            'auth'              => SessionManager::get('auth') ?? null,
        );

        return view('Frontend.product.index', $data);
    }
    public function create()
    {
    }
    public function store()
    {
    }

    public function show()
    {

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
