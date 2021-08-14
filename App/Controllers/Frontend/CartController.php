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
//         dd($cart_items);
// dd($_SESSION);
        $data = array(
            'cart_items' => $cart_items
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

    public function remove()
    {
        $product_id = $this->request->get_param('id');
        Basket::remove($product_id);
        Request::redirect('cart');
    }
}
