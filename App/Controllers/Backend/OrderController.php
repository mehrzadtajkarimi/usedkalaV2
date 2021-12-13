<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Order;
use App\Models\Order_Item;
use App\Models\OrderItem;
use App\Models\Photo;
use App\Models\User;
use App\Services\Auth\Auth;
use App\Services\Upload\UploadedFile;
use App\Utilities\FlashMessage;

class OrderController extends Controller
{
    private $photoModel;
    private $orderModel;
    private $userModel;
    private $orderItemModel;

    public function __construct()
    {
        parent::__construct();
        $this->photoModel     = new Photo();
        $this->orderModel     = new Order();
        $this->orderItemModel = new Order_Item();
        $this->userModel      = new User();
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

        $result = $this->orderItemModel->read_orderItem_get_product_by_order_id($order_id);

        echo json_encode($result);
    }

    public function status()
    {
        $admin_id =  Auth::is_login();

        $order_id = $this->request->params()['order_id'];
        $status = $this->request->params()['type'];

        if ($status == 2) {
            $result = $this->orderModel->update_order([
                'handler_id' =>  $admin_id,
                'status' =>  2,
            ], $order_id);
            echo  $result;
        }

        if ($status == 3) {
            $result = $this->orderModel->update_order([
                'sender_id' =>  $admin_id,
                'status' =>  3,
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
}
