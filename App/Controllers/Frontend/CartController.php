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

        $products_is_discounts = $this->productModel->join_product__with_productDiscounts_discounts() ?? [];
        $percent = $cart_items['percent'] ?? false;


        $coupon = 0;
        $exist_coupon = false;
        if ($percent) {
            $start_at  = strtotime($cart_items['percent']['start_at']) < time();
            $finish_at = strtotime($cart_items['percent']['finish_at']) > time();
            $coupon    = $cart_items['percent']['percent'];
            unset($cart_items['percent']);
            if ($start_at && $finish_at) {
                $exist_coupon = $coupon;  // $coupon = $cart_items['percent']['percent'];
            } else {
                $exist_coupon = false;
            }
        }

        foreach ($products_is_discounts as  $value) {
            if ($value['discount_status']) {
                $discounts[$value['product_id']] = $value['discount_percent'];
            }
        }

        foreach ($cart_items as  $value) {
            $exist_discount = in_array($value['id'], array_keys($discounts));
            if ($exist_discount && $exist_coupon) {
                // discount exist  and  coupon exist
                $price_discount = ($value['price'] - (($discounts[$value['id']] / 100) * $value['price']));
                $cart_total[$value['id']] = $value['count'] * ($price_discount - (($coupon / 100) * $price_discount));
            } else if ($exist_discount && !$exist_coupon) {
                // discount exist  and  coupon not exist
                $cart_total[$value['id']] = $value['count'] * ($value['price'] - (($discounts[$value['id']] / 100) * $value['price']));
            } else if (!$exist_discount && $exist_coupon) {
                // discount not exist  and  coupon exist
                $cart_total[$value['id']] = $value['count'] * ($value['price'] - (($coupon / 100) * $value['price']));
            } else {
                // discount not exist  and  coupon not exist
                $cart_total[$value['id']] = ($value['count'] *  $value['price']);
            }
        }

        foreach ($cart_items as  $value) {
            Basket::add_grand_total($value['id'], $cart_total[$value['id']]);
        }
        if (!is_array($cart_total)) {
            SessionManager::set('onLoadMsg', 'سبد خرید خالیست!');
            Request::redirect('');
        }

        if (!isset($discounts) || !is_array($discounts)) $discounts = [];

        $data = [
            'cart_total'            => array_sum($cart_total ?? []),
            'cart_coupon'           => $exist_coupon ?? 0,
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
        Basket::remove_coupon();
        if (isset($params['has_coupon'])) {
            $coupon = (new Coupon())->is_coupon($params['has_coupon']);
        }

        if ($coupon) {
            $has_coupon = Basket::add_coupon($coupon['percent'], $coupon['start_at'], $coupon['finish_at']);
            if ($has_coupon) {
                FlashMessage::add("کد تخفیف با موفقیت ثبت شد");
                Request::redirect('cart');
            } else {
                FlashMessage::add("ظاهرا مشکلی در ثبت کد تخفیف رخ داده ", FlashMessage::ERROR);
                Request::redirect('cart');
            }
        }
        FlashMessage::add("کد تخفیف اشتباه است", FlashMessage::ERROR);
        Request::redirect('cart');
    }
}
