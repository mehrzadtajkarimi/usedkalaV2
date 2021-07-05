<?php

namespace App\Controllers\frontend;

use App\Controllers\Controller;
use App\Core\Request;
use App\Models\Product;
use App\Services\Basket\Providers\SessionProvider;

class CartController  extends Controller
{
    public $basket;

    public function __construct()
    {
        $this->basket = new SessionProvider();
    }

    public function index()
    {
        $cart_items = $this->basket->items();
        $data = array(
            'cart_items' => $cart_items
        );
        return view('frontend.cart.index', $data);
    }


    public function add()
    {
        $product_model = new Product();
        $product = $product_model->get('*', ['id' => $this->request->id]);
        if ($product) {
            $this->basket->add($product_model);
        }
        Request::redirect('cart');
    }

    public function remove()
    {
        $this->basket->remove($this->request->id);
        Request::redirect('cart');
    }
}
