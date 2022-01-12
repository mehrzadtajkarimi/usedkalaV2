<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Order;
use App\Models\Order_Item;
use App\Models\User;
use App\Models\City;
use App\Models\Photo;
use App\Models\Province;
use App\Models\Product;
use App\Services\Auth\Auth;
use App\Services\Basket\Basket;
use App\Utilities\FlashMessage;
use App\Services\Session\SessionManager;

class OrderController  extends Controller
{
    private $orderModel;
    private $orderItemModel;
    private $userModel;
    private $cityModel;
    private $provinceModel;
    private $productModel;
    private $photoModel;

    public function __construct()
    {
        parent::__construct();
        $this->orderModel     = new Order();
        $this->orderItemModel = new Order_Item();
        $this->userModel      = new User();
        $this->cityModel      = new City();
        $this->provinceModel  = new Province();
        $this->productModel   = new Product();
        $this->photoModel     = new Photo();
    }

    public function index()
    {
        $user_id = SessionManager::get('auth');
        $orders =$this->orderModel->read_order_by_user_id($user_id) ;



        if (Auth::is_login()) {
            $data = array(
                'data'       => $this->userModel->join_user_to_photo($user_id),
                'orders'     => $orders,
                'cart_total' => array_sum($cart_total ?? []),
            );
            return view('Frontend.order.orders', $data);
        }

        return $this->request->redirect('login');
    }

    public function show()
    {
        $user_id     = SessionManager::get('auth');
        $id          = $this->request->get_param('id');
        $order       = $this->orderModel->read_order_by_user_id($user_id, $id);
        $order_items = $this->orderItemModel->read_orderItem_by_order_id($order[0]['id']);
        $products_is_discounts = $this->productModel->join_product__with_productDiscounts_discounts() ?? [];




        foreach ($products_is_discounts as  $value) {
            if ($value['discount_status']) {
                $discounts[$value['product_id']] = $value['discount_percent'];
            }
        }


        // dd($order_items ,$discounts);
        foreach ($order_items as $key => $value) {
            $order_items_info[] = $this->productModel->read_product($value['product_id']);
            $order_items_img[] = $this->photoModel->read_photo_by_id($value['product_id'], 'Product', true);
            
            if (array_key_exists($value['product_id'], $discounts)) {
                $order_items[$key]['discount_code'] = $value['quantity'] * ($value['price'] - (($discounts[$value['product_id']] / 100) * $value['price']));
            }
        }
        foreach ($order_items_info as $key => $value) {
            // var_dump($value['title']);

            $order_items[$key]['order_item_name'] = $value['title'] ?? '';
            $order_items[$key]['slug'] = $value['slug'] ?? '';
        }
        foreach ($order_items_img as $key => $value) {
            $order_items[$key]['img_path'] = $value[0]['path'];
            $order_items[$key]['img_alt']  = $value[0]['alt'];
        }
        if (Auth::is_login()) {
            $data = array(
                'data'        => $this->userModel->join_user_to_photo($user_id),
                'cart_total'  => array_sum($cart_total ?? []),
                'order'       => $order,
                'order_items' => $order_items,
                'city'        => $this->cityModel->read_city($order[0]['city_id']),
                'province'    => $this->provinceModel->read_province($order[0]['province_id']),
            );
            return view('Frontend.order.single_order', $data);
        }
    }

    public function create()
    {
        if (Auth::is_login()) {
            $user_id   = Auth::is_login();
            $user_info = $this->userModel->read_user($user_id);

            // validation required fields for order
            $checkArr  = [
                "first_name"  => "نام",
                "last_name"   => "نام خانوادگی",
                "province_id" => "استان",
                "city_id"     => "شهر",
                "address"     => "نشانی",
                "postal_code" => "کدپستی"
            ];
            $emptyColumns = "";
            foreach ($checkArr as $columnName => $persianName) {
                if ($user_info[$columnName] == "") {

                    $emptyColumns .= $persianName . "، ";
                }
                if ($emptyColumns != "") {
                    FlashMessage::add("برای ثبت سفارش، ابتدا فیلدهای «" . mb_substr($emptyColumns, 0, -2, "utf-8") . "» را در پروفایلِ خود، تکمیل کنید.", FlashMessage::ERROR);
                    return $this->request->redirect('profile');
                }
            }



            // dd($_SESSION['cart']['percent']['coupon_id'] ?? []); 
            $token         = 0;
            $order_number  = 0;
            $totalPrice    = 0;
            $totalCount    = 0;
            $totalWeight   = 0;
            $totalDiscount = 0;
            $shipping      = 0;
            $params        = $this->request->params();
            $notes         = $params['order-notes'];
            foreach ($_SESSION['cart'] as $value) {
                $totalCount  += $value['count'];
                $totalPrice  += $value['grand_total'];
                // $totalPrice  += ($value['count'] * $value['price']) + $totalDiscount + $shipping;
                $totalWeight += $value['weight'];
            }
            $params_create = array(
                'user_id'        => $user_id,
                'coupon_id'      => $_SESSION['cart_percent']['coupon_id'] ?? 0,
                'user_full_name' => $user_info['first_name'] . " " . $user_info['last_name'],
                'user_phone'     => $user_info['phone'],
                'city_id'        => $user_info['city_id'],
                'province_id'    => $user_info['province_id'],
                'postal_code'    => $user_info['postal_code'],
                'address'        => $user_info['address'],
                'token'          => $token,
                'order_number'   => $order_number,
                'item_count'     => $totalCount,
                'grand_total'    => $totalPrice,
                'discount_total' => $totalDiscount,
                'shipping_cost'  => $shipping,
                'notes'          => $notes,
                'weight'         => 'normal',
            );
            $order_id = $this->orderModel->create_order($params_create);
            $carts = Basket::items();

            // dd($carts);
            foreach ($carts as $value) {
                $single_product_id            = $value['id'];
                $single_product_quantity      = $value['count'];
                $single_product_price         = $value['price'];
                $single_product_discount      = $value['grand_total'];
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
                unset($_SESSION['cart_percent']);
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
    public function store_note()
    {
        $params = $this->request->params();
        $params_create = array(
            'notes' => $params['order-textarea-notes'],
        );
        $order_id = $this->orderModel->update_order($params_create, $params['id']);
        if ($order_id) {
            FlashMessage::add("ایجاد مثال موفقیت انجام شد");
        } else {
            FlashMessage::add(" مشکلی در ایجاد مثال رخ داد ", FlashMessage::ERROR);
        }
        return $this->request->redirect('profile/orders');
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
        $this->orderModel->update_order($params_updated, $order_id);

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

    public function status()
    {
        $admin_id =  Auth::is_login();

        $order_id = $this->request->get_param();

        $this->orderModel->update_order([
            'handler_id' =>  $admin_id,
            'status' =>  4,
        ], $order_id);
        return $this->request->redirect('profile/orders');
    }
}
