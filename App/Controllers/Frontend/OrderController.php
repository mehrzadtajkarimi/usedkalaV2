<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Order;
use App\Models\User;
use App\Services\Auth\Auth;
use App\Utilities\FlashMessage;
use App\Core\Request;
use App\Services\Session\SessionManager;
class OrderController  extends Controller
{
    private $orderModel;
    private $userModel;

    public function __construct()
    {
        parent::__construct();
        $this->orderModel = new Order();
        $this->userModel  = new User();
    }

    public function index()
    {
        $data = array(
            'orders' => 'orders',
        );
        return view('Backend.orders.index', $data);
    }

    public function create()
    {
        if(Auth::is_login()){
            $totalPrice  = 0;
            $totalCount  = 0;
            $totalWeight = 0;
            $user_id     = Auth::is_login();
            $user_info   = $this->userModel->read_user($user_id);
            foreach($_SESSION['cart'] as $value){
                $totalCount  += $value['count'];
                $totalPrice  += $value['count'] * $value['price'];
                $totalWeight += $value['weight'];
    
            }
            echo "<pre>";
            var_dump($_SESSION['cart']);
            echo "</pre>";
        } else {
            FlashMessage::add(" لطفا برای تکمیل ثبت سفارش ابتدا وارد پروفایل خود شوید. ", FlashMessage::ERROR);
            return $this->request->redirect('login');
        }


        // $params = $this->request->params();
        // $params = [

        // ];
        // $params_create = array(
        //     'name' => $params['order-name'],
        // );
        // $order_id = $this->orderModel->create_order($params_create);
        // if ($order_id) {
        //     FlashMessage::add("ایجاد مثال موفقیت انجام شد");
        // } else {
        //     FlashMessage::add(" مشکلی در ایجاد مثال رخ داد ", FlashMessage::ERROR);
        // }
        // return $this->request->redirect('admin/order');
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
