<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\User;
use App\Models\City;
use App\Models\Province;
use App\Services\Auth\Auth;
use App\Utilities\FlashMessage;
use App\Services\Session\SessionManager;
class OrderController  extends Controller
{
    private $orderModel;
    private $orderItemModel;
    private $userModel;
    private $cityModel;
    private $provinceModel;

    public function __construct()
    {
        parent::__construct();
        $this->orderModel     = new Order();
        $this->orderItemModel = new OrderItem();
        $this->userModel      = new User();
        $this->cityModel      = new City();
        $this->provinceModel  = new Province();
    }

    public function index()
    {
        $user_id = SessionManager::get('auth');

        if (Auth::is_login()) {
            $data = array(
                'data'       => $this->userModel->join_user_to_photo($user_id),
                'cart_total' => array_sum($cart_total ?? []),
                'orders'     => $this->orderModel->read_order_by_user_id($user_id)
            );
            return view('Frontend.profile.orders', $data);
        }

        return $this->request->redirect('login');
    }

    public function show()
    {
        $user_id = SessionManager::get('auth');
        $id      = $this->request->get_param('id');
        $order   = $this->orderModel->read_order_by_user_id($user_id, $id);
        if (Auth::is_login()) {
            $data = array(
                'data'        => $this->userModel->join_user_to_photo($user_id),
                'cart_total'  => array_sum($cart_total ?? []),
                'order'       => $order,
                'order_items' => $this->orderItemModel->read_orderItem_by_order_id($order[0]['id']),
                'city'        => $this->cityModel->read_city($order[0]['city_id']),
                'province'    => $this->provinceModel->read_province($order[0]['province_id']),
            );
            return view('Frontend.profile.single_order', $data);
        }

    }

    public function create()
    {
        if(Auth::is_login()){
            $token         = 0;
            $order_number  = 0;
            $totalPrice    = 0;
            $totalCount    = 0;
            $totalWeight   = 0;
            $totalDiscount = 0;
            $shipping      = 0;
            $user_id       = Auth::is_login();
            $user_info     = $this->userModel->read_user($user_id);
            $params        = $this->request->params();
            $notes         = $params['order-notes'];
            foreach($_SESSION['cart'] as $value){
                $totalCount  += $value['count'];
                $totalPrice  += ($value['count'] * $value['price']) + $totalDiscount + $shipping;
                $totalWeight += $value['weight'];
            }
            $params_create = array(
                'user_id'        => $user_id,
                'user_full_name' => $user_info['first_name'] . " " . $user_info['last_name'],
                'user_phone'     => $user_info['phone'],
                'city_id'        => $user_info['city_id'],
                'province_id'    => $user_info['province_id'],
                'postal_code'    => $user_info['postal_code'],
                'address'        => $user_info['address'],
                'token'          => $token,
                'order_number'   => $order_number,
                'weight'         => 'normal',
                'item_count'     => $totalCount,
                'grand_total'    => $totalPrice,
                'discount_total' => $totalDiscount,
                'shipping_cost'  => $shipping,
                'notes'          => $notes
            );
            dd($_SESSION['cart']);
            $order_id = $this->orderModel->create_order($params_create);
            foreach($_SESSION['cart'] as $value){
                $single_product_id            = $value['id'];
                $single_product_quantity      = $value['product_quantity'];
                $single_product_price         = $value['price'];
                $single_product_discount      = 0;
                $single_product_params_create = [
                    'order_id'   => $order_id,
                    'product_id' => $single_product_id,
                    'quantity'   => $single_product_quantity,
                    'price'      => $single_product_price,
                    'discount'   => $single_product_discount
                ];
                $order_item_id[] = $this->orderItemModel->create_orderItem($single_product_params_create);
            }
            if (!empty($order_item_id)) {
                FlashMessage::add("ثبت سفارش با موفقیت انجام شد");
                unset($_SESSION['cart']);
            } else {
                FlashMessage::add(" مشکلی در ثبت سفارش رخ داد ", FlashMessage::ERROR);
            }
            return $this->request->redirect('profile/orders');
        } else {
            FlashMessage::add(" لطفا برای تکمیل ثبت سفارش ابتدا وارد پروفایل خود شوید. ", FlashMessage::ERROR);
            return $this->request->redirect('login');
        }
    }

    public function store()
    {
        $params = $this->request->params();
        $params_create = array(
            'name' => $params['order-name'],
        );
        $order_id = $this->orderModel->create_order($params_create);
        if ($order_id) {
            FlashMessage::add("ایجاد مثال موفقیت انجام شد");
        } else {
            FlashMessage::add(" مشکلی در ایجاد مثال رخ داد ", FlashMessage::ERROR);
        }
        return $this->request->redirect('admin/order');
    }

    public function edit()
    {
        $id = $this->request->get_param('id');
        $order = $this->orderModel->read_order($id);

        $data = array(
            'order' => $order,
        );
        view('Backend.order.edit', $data);
    }

    public function update()
    {
        $params = $this->request->params();
        $order_id = $this->request->get_param('id');
        $params_updated = array(
            'name'   => $params['order-name'],
        );
        $this->orderModel->update_order($params_updated, $order_id['id']);

        FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/order');
    }

    public function destroy()
    {
        $id = $this->request->get_param('id');
        $is_deleted_order = $this->orderModel->delete_order($id);
        if ($is_deleted_order) {
            FlashMessage::add("مقادیر  با موفقیت از دیتابیس حذف شد");
            return $this->request->redirect('admin/order');
        }
        FlashMessage::add(" مشکلی در حذف مثال پیش آمده است", FlashMessage::ERROR);
        return $this->request->redirect('admin/order');
    }
}
