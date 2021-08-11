<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Core\Request;
use App\Models\Product;
use App\Services\Basket\Basket;

class CartController  extends Controller
{


    public function index()
    {
        $cart_items =Basket::items();
        $data = array(
            'cart_items' => $cart_items
        );
        return view('Frontend.cart.index', $data);
    }


    public function add()
    {
        $product_id = $this->request->get_param('id');
        $params = $this->request->params();

        
        
        $product_model = new Product();
        $product = $product_model->first(['id' => $product_id]);
        if ($product) {
            Basket::add($product);
        }
        dd($_SESSION['cart']);
        Request::redirect('cart');
    }

    public function remove()
    {
        Basket::remove($this->request->id);
        Request::redirect('cart');
    }
}
