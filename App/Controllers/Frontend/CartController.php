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
        $cart_items = Basket::items();

        foreach ($cart_items as  $value) {
            $cart_total[] = $value['count'] * $value['price'];
        }
        $data = array(
            'cart_items' => $cart_items,
            'cart_total' => array_sum($cart_total)
        );
        return view('Frontend.cart.index', $data);
    }


    public function add()
    {
        $product_model = new Product();

        $product_id = $this->request->get_param('id');
        $params     = $this->request->params();
        $product    = $product_model->first(['id' => $product_id]);
        $product['product_quantity'] = $params['product_quantity'];
        $product['photo_path']       = $params['photo_path'];

        if ($product) {
            Basket::add($product);
        }
        Request::redirect('cart');
    }
    public function plus()
    {
        $product_id = $this->request->get_param('id');
        Basket::plus($product_id);
        Request::redirect('cart');
    }
    public function minus()
    {
        $product_id = $this->request->get_param('id');
        Basket::minus($product_id);
        Request::redirect('cart');
    }

    public function remove()
    {
        $product_id = $this->request->get_param('id');
        Basket::remove($product_id);
        Request::redirect('cart');
    }
}
