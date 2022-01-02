<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Core\Request;
use App\Models\Coupon;
use App\Models\Product;
use App\Services\Auth\Auth;
use App\Services\Basket\Basket;
use App\Services\Session\SessionManager;
use App\Utilities\FlashMessage;

class CartController  extends Controller
{

    private $productModel;

    public function __construct()
    {
        parent::__construct();
        $this->productModel   = new Product;
    }
    public function index()
    {
        if (!Auth::is_login()) {
            return $this->request->redirect('');
        }
        // $cart_items = Basket::reset();
        $cart_items = Basket::items();

        $products_is_discounts = $this->productModel->join_product__with_productDiscounts_discounts();

        // dd($cart_items);
        $coupon = $cart_items['percent'] ?? 0;
        unset($cart_items['percent']);
        $exist_coupon   = !empty($coupon);


        foreach ($products_is_discounts as  $value) {
            if ($value['discount_status']) {
                $discounts[$value['product_id']] = $value['discount_percent'];
            }
        }
        $price_slot = 0;
        $cart_total = [];

        foreach ($cart_items as  $value) {

            $exist_discount = in_array($value['id'], array_column($products_is_discounts, 0));

            if ($exist_discount && $exist_coupon) {
                // discount exist  and  coupon exist
                $price_discount = $value['count'] * ($value['price'] - (($discounts[$value['id']] / 100) * $value['price']));
                $cart_total[] = $value['count'] * ($price_discount - (($coupon / 100) * $price_discount));
            } else if ($exist_discount && !$exist_coupon) {
                // discount exist  and  coupon not exist
                $cart_total[] = $value['count'] * ($value['price'] - (($discounts[$value['id']] / 100) * $value['price']));
            } else if (!$exist_discount && $exist_coupon) {
                // discount not exist  and  coupon exist
                $cart_total[] = $value['count'] * ($value['price'] - (($coupon / 100) * $value['price']));
            } else {
                // discount not exist  and  coupon not exist
                $cart_total[] =  ($value['count'] *  $value['price']);
            }
        }
        if (!is_array($cart_total)) {
            SessionManager::set('onLoadMsg', 'سبد خرید خالیست!');
            Request::redirect('');
        }

        $data = [
            'cart_total'            => array_sum($cart_total ?? []),
            'cart_coupon'           => $coupon,
            'cart_items'            => $cart_items,
            'discounts'             => $discounts,
            'home_page_active_menu' => "page home page-template-default"
        ];

        return view('Frontend.cart.index', $data);
    }

    public function add()
    {
        if (!Auth::is_login()) {
            FlashMessage::add(" جهت مشاهده سبد خرید ابتدا باید وارد شوید", FlashMessage::ERROR);
            Request::redirect('');
        }

        $product_id = $this->request->get_param('id');
        $params     = $this->request->params();
        $product    = $this->productModel->first(['id' => $product_id]);

        if (isset($params['product_quantity'])) {
            $product['product_quantity'] = $params['product_quantity'];
        } else {
            $product['product_quantity'] += 1;
        }
        if (isset($params['photo_path'])) {
            $product['photo_path'] = $params['photo_path'];
        } else {
            $product['photo_path'] = $this->productModel->join_product_to_photo_by_id($product_id);
            $product['photo_path'] = $product['photo_path'][0]['path'];
        }
        if ($product) {
            Basket::add($product);
        }
        Request::redirect('cart');
    }

    public function plus()
    {
        $product_id   = $this->request->get_param('id');
        $plus_product = $this->convert_numbers('fa', Basket::plus($product_id));
        $discount     = $this->productModel->join_product__with_productDiscounts_discounts_by_product_id($product_id)[0] ?? '';

        if ($discount) {
            $total = $this->convert_numbers('fa', number_format(Basket::total($discount)));
        } else {
            $total = $this->convert_numbers('fa', number_format(Basket::total($product_id)));
        }

        $result = [
            'count' => $plus_product,
            'total' => $total
        ];
        echo json_encode($result, JSON_UNESCAPED_UNICODE);
    }

    public function minus()
    {
        $product_id    = $this->request->get_param('id');
        $minus_product = $this->convert_numbers('fa', Basket::minus($product_id));
        $discount      = $this->productModel->join_product__with_productDiscounts_discounts_by_product_id($product_id)[0];

        if ($discount['id']) {
            $total = $this->convert_numbers('fa', number_format(Basket::total($discount)));
        } else {
            $total = $this->convert_numbers('fa', number_format(Basket::total($product_id)));
        }

        $result        = [
            'count' => $minus_product,
            'total' => $total
        ];
        echo json_encode($result, JSON_UNESCAPED_UNICODE);
    }

    public function remove()
    {
        $product_id = $this->request->get_param('id');
        Basket::remove($product_id);
        Request::redirect('cart');
    }

    public function has_coupon()
    {
        $params = $this->request->params();
        if (isset($params['has_coupon'])) {
            # code...
            $coupon = (new Coupon())->is_coupon($params['has_coupon']);
        }

        if ($coupon) {
            $has_coupon = Basket::has_coupon($coupon['percent']);
            if ($has_coupon) {
                FlashMessage::add("کد تخفیف با موفقیت ثبت شد");
                Request::redirect('cart');
            } else {
                FlashMessage::add("کد تخفیف اشتباه است", FlashMessage::ERROR);
                Request::redirect('cart');
            }
        }
        Request::redirect('cart');
    }
}
