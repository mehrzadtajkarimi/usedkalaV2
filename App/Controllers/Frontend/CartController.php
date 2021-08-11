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
        $product_model = new Product();
        $product = $product_model->get('*', ['id' => $this->request->id]);
        if ($product) {
            $this->basket->add($product);
        }
        Request::redirect('cart');
    }

    public function remove()
    {
        $this->basket->remove($this->request->id);
        Request::redirect('cart');
    }
}
