<?php

namespace App\Controllers\frontend;

use App\Core\Request;
use App\Models\Product;
use App\Services\Basket\providers\SessionProvider;

class CartController
{
    private $basket;

    public function __construct()
    {
        $this->basket = new SessionProvider();
    }

    public function index(Request $request)
    {
        $cart_items = $this->basket->items();
        $data = array(
            'cart_items' => $cart_items
        );
        return view('backend.cart.index', $data);
    }


    public function add(Request $request)
    {
        $product_model = new Product();
        $product = $product_model->get('*', ['id' => $request->id]);
        if ($product) {
            $this->basket->add($product_model);
        }
        Request::redirect('cart');
    }

    public function remove(Request $request)
    {
        $this->basket->remove($request->id);
        Request::redirect('cart');
    }
}
