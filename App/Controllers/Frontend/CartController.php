<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Core\Request;
use App\Models\Product;
use App\Services\Basket\Basket;
use App\Services\Session\SessionManager;

class CartController  extends Controller
{


    public function index()
    {
        $cart_items = Basket::items();

        foreach ($cart_items as  $value) {
            $cart_total[] = $value['count'] * $value['price'];
        }
        if (!is_array($cart_total)) {
			SessionManager::set('onLoadMsg','سبد خرید خالیست!');
            Request::redirect('');
        }

        $data = [
            'cart_total' => array_sum($cart_total ?? []),
            'cart_items' => $cart_items,
			'home_page_active_menu' => "page home page-template-default"
        ];

        return view('Frontend.cart.index', $data);
    }


    public function add()
    {
        $product_model = new Product();

        $product_id = $this->request->get_param('id');
        $params     = $this->request->params();
        $product    = $product_model->first(['id' => $product_id['id']]);
        if(isset($params['product_quantity'])){
            $product['product_quantity'] = $params['product_quantity'];
        } else {
            $product['product_quantity'] = 1;
        }
        if(isset($params['photo_path'])){
            $product['photo_path'] = $params['photo_path'];
        } else {
            $product['photo_path'] = $product_model->join_product_to_photo_by_id($product_id['id']);
            $product['photo_path'] = $product['photo_path'][0]['path'];
        }
        if ($product) {
            Basket::add($product);
        }
        Request::redirect('cart');
    }
    public function plus()
    {
        $product_id = $this->request->get_param('id');

        Basket::plus($product_id['id']);
        Request::redirect('cart');
    }
    public function minus()
    {
        $product_id = $this->request->get_param('id');
        Basket::minus($product_id['id']);
        Request::redirect('cart');
    }

    public function remove()
    {
        $product_id = $this->request->get_param('id');
        Basket::remove($product_id['id']);
        Request::redirect('cart');
    }
}
