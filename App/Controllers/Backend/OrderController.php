<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Coupon;
use App\Models\Order;
use App\Models\Order_Item;
use App\Models\Photo;
use App\Models\Product;
use App\Models\User;
use App\Services\Auth\Auth;


class OrderController extends Controller
{
    private $photoModel;
    private $orderModel;
    private $userModel;
    private $orderItemModel;
    private $productModel;
    private $couponModel;

    public function __construct()
    {
        parent::__construct();
        $this->photoModel     = new Photo();
        $this->orderModel     = new Order();
        $this->orderItemModel = new Order_Item();
        $this->userModel      = new User();
        $this->productModel   = new Product();
        $this->couponModel    = new Coupon();
    }

    public function index()
    {
        $data = array(
            'photos' => $this->photoModel->read_photo(),
            'orders' => $this->orderModel->read_order(),
        );
        view('Backend.order.index', $data);
    }

    public function get_admin()
    {
        $order_id = $this->request->params()['order_id'];
        $type = $this->request->params()['type'];

        $result = $this->orderModel->read_order($order_id);


        if ($type == 1) {
            $admin =  $this->userModel->read_user($result['handler_id']);
            if (!empty($admin)) {
                echo $admin['first_name'] . ' ' . $admin['last_name'];
            }
        }
        if ($type == 2) {
            $admin =  $this->userModel->read_user($result['sender_id']);
            if (!empty($admin)) {
                echo $admin['first_name'] . ' ' . $admin['last_name'];
            }
        }
    }

    public function get_orders()
    {
        $order_id = $this->request->params()['order_id'];

        $results = [];

        $results += $this->orderItemModel->join__orderItem_whit_product_by_order_id($order_id);

        $products_is_discounts = $this->productModel->join_product__with_productDiscounts_discounts() ?? [];


        foreach ($results as $key =>  $value) {

            $discount_coupon = $value['coupon_id'] > 0 ? $this->couponModel->read_coupon($value['coupon_id']) : false;

            if ($discount_coupon) {
                $start_at  = strtotime($discount_coupon['start_at']) < time();
                $finish_at = strtotime($discount_coupon['finish_at']) > time();
            }
            $discount_percent = false;

            foreach ($products_is_discounts as $discount) {
                if ($discount['discount_status'] == 1 && $value['product_id'] == $discount['product_id']) {
                    $discount_percent =  $value['quantity'] * ($value['price'] - (($discount['discount_percent'] / 100) * $value['price']));
                    $results[$key] += ['discount_percent' => $discount_percent];
                }
            }

            if ($discount_coupon && $discount_percent) {

                if ($start_at && $finish_at) {
                    $coupon_price__mines__discount_price =   ($discount_percent - (($discount_coupon['percent'] / 100) * $discount_percent));

                    $results[$key] += ['percent' => $discount_coupon['percent']];
                    $results[$key] += ['discount_coupon' =>   $coupon_price__mines__discount_price];
                }
            }
            if ($discount_coupon) {

                if ($start_at && $finish_at) {
                    $coupon_price =  $value['quantity'] * ($value['price'] - (($discount_coupon['percent'] / 100) * $value['price']));

                    $results[$key] += ['percent' => $discount_coupon['percent']];
                    $results[$key] += ['discount_coupon' =>   $coupon_price];
                }
            }
        }



        echo json_encode($results);
    }

    public function status()
    {
        $admin_id =  Auth::is_login();

        $order_id = $this->request->params()['order_id'];
        $status = $this->request->params()['type'];

        if ($status == 2) {
            $result = $this->orderModel->update_order([
                'handler_id' => $admin_id,
                'status'     => 2,
            ], $order_id);
            echo  $result;
        }

        if ($status == 3) {
            $result = $this->orderModel->update_order([
                'sender_id' => $admin_id,
                'status'    => 3,
            ], $order_id);
            echo  $result;
        }
        if ($status == 4) {
            // $result = $this->orderModel->update_order([
            //     'delivery_id' =>  $admin_id,
            //     'status' =>  4,
            // ], $order_id);
            // echo  $result;
        }
    }

    public function tracker()
    {
        $param = $this->request->params();
        $status_sender = $param['status-sender'];
        $order_id = $this->request->get_param('id');
        $trackers = array(
            $param['tracker-post'],
            $param['tracker-postbar'],
            $param['tracker-chapar'],
            $param['tracker-snappـbox'],
            $param['tracker-alopeyk'],
        );

        $filter_array = array_filter($trackers);
        $result = $this->orderModel->update_order([
            'tracking' => implode(', ', $filter_array),
            'status_sender' => $status_sender,
        ], $order_id);
        echo  $result;
    }
}
