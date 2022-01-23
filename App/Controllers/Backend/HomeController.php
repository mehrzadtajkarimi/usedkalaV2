<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Order;

class HomeController extends Controller
{

    private $orderModel;
    public function __construct()
    {
        parent::__construct();
        $this->orderModel  = new Order();
    }


    public function index()
    {
        $shamsi_1400 = [1616272200, 1618947000, 1621625400, 1624303800, 1626982200, 1629660600, 1632342600, 1634934600, 1637526600, 1640118600, 1642710600, 1645302600]; // array key is month shamsi example(فروردین - ساعت 12 شب)

        $orders = $this->orderModel->read_order();

        foreach ($orders as $key => $value) {

            $created[$key]['created_at'] = strtotime($value['created_at']);
            $id[$key]['id'] = $value['id'];
        }


        $orders_timestamp_created = array_column($created, 'created_at');
        $orders_timestamp_id      = array_column($id, 'id');

        foreach ($orders_timestamp_created as $key => $value) {
            if ($shamsi_1400[$key] <= $value && $value <= $shamsi_1400[$key + 1]) {  // فروردین
                $orders_timestamp_created['فروردین'] = $value;
                unset($orders_timestamp_created[$key]);
            } elseif ($shamsi_1400[$key + 1] <= $value && $value <= $shamsi_1400[$key + 2]) { // اردیبهشت
                $orders_timestamp_created['اردیبهشت'] = $value;
                unset($orders_timestamp_created[$key]);
            } elseif ($shamsi_1400[$key + 2] <= $value && $value <= $shamsi_1400[$key + 3]) {    // خرداد
                $orders_timestamp_created['خرداد'] = $value;
                unset($orders_timestamp_created[$key]);
            } elseif ($shamsi_1400[$key + 3] <= $value && $value <= $shamsi_1400[$key + 4]) {    // تیر
                $orders_timestamp_created['تیر'] = $value;
                unset($orders_timestamp_created[$key]);
            } elseif ($shamsi_1400[$key + 4] <= $value && $value <= $shamsi_1400[$key + 5]) {    // مرداد
                $orders_timestamp_created['مرداد'] = $value;
                unset($orders_timestamp_created[$key]);
            } elseif ($shamsi_1400[$key + 5] <= $value && $value <= $shamsi_1400[$key + 6]) {    // شهریور
                $orders_timestamp_created['شهریور'] = $value;
                unset($orders_timestamp_created[$key]);
            } elseif ($shamsi_1400[$key + 6] <= $value && $value <= $shamsi_1400[$key + 7]) {    // مهر
                $orders_timestamp_created['مهر'] = $value;
                unset($orders_timestamp_created[$key]);
            } elseif ($shamsi_1400[$key + 7] <= $value && $value <= $shamsi_1400[$key + 8]) {    // آبان
                $orders_timestamp_created['آبان'] = $value;
                unset($orders_timestamp_created[$key]);
            } elseif ($shamsi_1400[$key + 8] <= $value && $value <= $shamsi_1400[$key + 9]) {    // آذر
                $orders_timestamp_created['آذر'] = $value;
                unset($orders_timestamp_created[$key]);
            } elseif ($shamsi_1400[$key + 9] <= $value && $value <= $shamsi_1400[$key + 10]) {    // دی
                $orders_timestamp_created['دی'] = $value;
                unset($orders_timestamp_created[$key]);
            } elseif ($shamsi_1400[$key + 10] <= $value && $value <= $shamsi_1400[$key + 11]) {    // بهمن
                $orders_timestamp_created['بهمن'] = $value;
                unset($orders_timestamp_created[$key]);
            } elseif ($shamsi_1400[$key + 11] <= $value && $value <= $shamsi_1400[$key + 12]) {    // اسفند
                $orders_timestamp_created['اسفند'] = $value;
                unset($orders_timestamp_created[$key]);
            }
        }


        dd(array_combine( $orders_timestamp_id,$orders_timestamp_created));
        dd($orders_timestamp_created);
        dd(range(1616272200, 1618947000));





        $data = array(
            'orders' => $orders,
        );


        return view('Backend.index', $data);
    }
}
