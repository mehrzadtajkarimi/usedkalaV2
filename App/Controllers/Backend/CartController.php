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
    private $cartModel;


    public function __construct()
    {
        parent::__construct();

        $this->productModel = new Product();
        $this->cartModel    = new cart();

    }

    public function index()
    {
        $data = array(
            'products' => $this->productModel->read_product(),
            'carts'    => $this->cartModel->read_cart(),
        );
        view('Backend.cart.index', $data);
    }

    public function create()
    {
    }

    public function store()
    {
        $params = $this->request->params();
        $params_create = array(
            'user_id'     => Auth::is_login(),
            'start_at'    => date("Y-m-d H:i:s", $params['start_at']),
            'finish_at'   => date("Y-m-d H:i:s", $params['finish_at']),
            'code'        => $params['code'],
            'title'       => $params['cart-title'],
            'description' => $params['cart-description'],
            'percent'     => $params['cart-percent'],
            'status'      => $params['product-status'] ?? 0,
        );
        $cart_id =  $this->cartModel->create_cart($params_create);
        foreach ($params['cart-category'] as  $value) {
            $this->categorycartModel->create_categorycart([
                'cart_id' => $cart_id,
                'category_id' => $value,
            ]);
        }
        foreach ($params['cart-product'] as  $value) {
            $this->productcartModel->create_productcart([
                'cart_id' => $cart_id,
                'product_id' => $value,
            ]);
        }
        FlashMessage::add("مقادیر باموفقیت  ضمیمه شد و با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/cart');
    }

    public function show()
    {
    }

    public function edit()
    {
        $id               = $this->request->get_param('id');
        $categories_by_id = $this->categorycartModel->read_categorycart($id);
        $products_by_id   = $this->productcartModel->read_productcart($id);

        if ($categories_by_id) {
            foreach ($categories_by_id as  $value) {
                $categories_selected[] = $value['id'];
            }
        }
        if ($products_by_id) {
            foreach ($products_by_id as  $value) {
                $products_selected[] = $value['id'];
            }
        }

        $data = array(
            'cart'            => $this->cartModel->read_cart($id),
            'categories'          => $this->categoryModel->category_tree_for_backend(),
            'products'            => $this->productModel->read_product(),
            'products_selected'   => $products_selected ?? [],
            'categories_selected' => $categories_selected ?? [],
        );
        view('Backend.cart.edit', $data);
    }


    public function update()
    {
        $params = $this->request->params();
        $id = $this->request->get_param('id');



        
        $params_update = array(
            'user_id'     => Auth::is_login(),
            'start_at'    => date("Y-m-d H:i:s", $params['start_at']),
            'finish_at'   => date("Y-m-d H:i:s", $params['finish_at']),
            'code'        => $params['cart-code'],
            'title'       => $params['cart-title'],
            'description' => $params['cart-description'],
            'percent'     => $params['cart-percent'],
            'status'      => $params['cart-status']== 'on'? 1 : 0,
        );
        $this->cartModel->update_cart($params_update, $id);


        if (!empty($params['cart-category'])) {
            $this->categorycartModel->delete_categorycart_by_cart_id($id);
            foreach ($params['cart-category'] as  $category_id) {
                $this->categorycartModel->create_categorycart([
                    'cart_id' => $id,
                    'category_id' => $category_id,
                ]);
            }
        }
        if (!empty($params['cart-product'])) {
            $this->productcartModel->delete_productcart_by_category_id($id);
            foreach ($params['cart-product'] as  $value) {
                $this->productcartModel->create_productcart([
                    'cart_id' => $id,
                    'product_id' => $value,
                ], $id);
            }
        }
        FlashMessage::add("مقادیر باموفقیت  ضمیمه شد و با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/cart');
    }


    public function destroy()
    {
        $id = $this->request->get_param('id');

        $is_deleted_categorycart=   $this->categorycartModel->delete_categorycart_by_cart_id($id);
        $is_deleted_productcart=  $this->productcartModel->delete_productcart_by_category_id($id);
        $is_deleted_cart=  $this->cartModel->delete_cart($id);

        if ($is_deleted_categorycart && $is_deleted_productcart && $is_deleted_cart) {
            # code...
            FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
            return $this->request->redirect('admin/cart');
        }
        FlashMessage::add(" مشکلی در حذف محصول پیش آمده است", FlashMessage::ERROR);
        return $this->request->redirect('admin/cart');
    }
}
