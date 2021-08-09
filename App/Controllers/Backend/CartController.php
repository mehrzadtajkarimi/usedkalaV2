<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Product;
use App\Models\Product_cart;
use App\Models\Category;
use App\Models\Category_cart;
use App\Models\cart;
use App\Services\Auth\Auth;
use App\Services\Basket\Basket;
use App\Utilities\FlashMessage;

class CartController extends Controller
{

    private $productModel;

    public function __construct()
    {
        parent::__construct();

        $this->productModel = new Product();
    }

    public function index()
    {
        $data = array(
            'products' => $this->productModel->read_product(),
            'carts'    => Basket::items()
        );
        view('Backend.cart.index', $data);
    }

    public function add()
    {
        $id_product = $this->request->get_param('id');
        $product = $this->productModel->get('*', ['id' => $id_product]);
        if ($product) {
            Basket::add($product);
        }
        return $this->request->redirect('Backend.cart.index');
    }

    public function destroy()
    {
        $product_id = $this->request->get_param('id');
        Basket::remove($product_id);
        return $this->request->redirect('Backend.cart.index');
    }
}
