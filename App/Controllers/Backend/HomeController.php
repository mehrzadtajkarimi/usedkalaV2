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
        $this_day   = (int) $this->orderModel->comparison($this->between_dates('this', 'day'));
        $this_week  = (int) $this->orderModel->comparison($this->between_dates('this', 'week'));
        $this_month = (int) $this->orderModel->comparison($this->between_dates('this', 'month'));
        $this_year  = (int) $this->orderModel->comparison($this->between_dates('this', 'year'));
        $last_day   = (int) $this->orderModel->comparison($this->between_dates('last', 'day'));
        $last_week  = (int) $this->orderModel->comparison($this->between_dates('last', 'week'));
        $last_month = (int) $this->orderModel->comparison($this->between_dates('last', 'month'));
        $last_year  = (int) $this->orderModel->comparison($this->between_dates('last', 'year'));

        $data = array(
            'grand'    => $this->calculations_mount('grand'),
            'discount' => $this->calculations_mount('discount'),

            'count_order'  => $this->orderModel->count_order(),         // count all order
            'max_total'    => $this->orderModel->read_max_total(),      // max total of all orders
            'min_total'    => $this->orderModel->read_min_total(),      // min total of all orders
            'max_discount' => $this->orderModel->read_max_discount(),   // max discount of all orders

            'change_sale_day'   => $this_day && $last_day ? $this->percentage_change($this_day, $last_day) : 0,           // percentage change of sale day
            'change_sale_week'  => $this_week && $last_week ? $this->percentage_change($this_week, $last_week) : 0,       // percentage change of sale week
            'change_sale_mount' => $this_month && $last_month ? $this->percentage_change($this_month, $last_month) : 0,   // percentage change of sale mount
            'change_sale_year'  => $this_year && $last_year ? $this->percentage_change($this_year, $last_year) : 0,       // percentage change of sale year

            'avg_grand'    => $this->orderModel->read_avg_grand(),      // avg grand total of all orders
            'avg_discount' => $this->orderModel->read_avg_discount(),   // avg discount of all orders

        );
        return view('Backend.index', $data);
    }


    public function report()
    {
        $data = [
            'orders' => $this->orderModel->read_order(),
        ];
        return view('Backend.report.index', $data);
    }

    public function between_dates($When, $topic)
    {
        if ($When === 'this') {
            return  [
                'as' => date('Y-m-d H:i:s'),
                'to' => date('Y-m-d H:i:s', strtotime("-1 $topic")),
            ];
        }
        if ($When === 'last') {
            return [
                'as' => date('Y-m-d H:i:s', strtotime("-1 $topic")),
                'to' => date('Y-m-d H:i:s', strtotime("-2 $topic")),
            ];
        }
    }

    public function percentage_change($original_value,  $new_value): int // محاسبه درصد تغییر
    {
        if ($original_value > 0 && $new_value > 0) {
            return ($new_value - $original_value) / $original_value * 100;
        }
    }

    public function calculations_mount($requested): array
    {
        // $shamsi_1400 = [1616272200, 1618947000, 1621625400, 1624303800, 1626982200, 1629660600, 1632342600, 1634934600, 1637526600, 1640118600, 1642710600, 1645302600]; // array key is month shamsi example(فروردین - ساعت 12 شب)
        $shamsi_1400 = [
            '2021-03-21 00:00:00',
            '2021-04-21 00:00:00',
            '2021-05-22 00:00:00',
            '2021-06-22 00:00:00',
            '2021-07-23 00:00:00',
            '2021-08-23 00:00:00',
            '2021-09-23 00:00:00',
            '2021-10-23 00:00:00',
            '2021-11-22 00:00:00',
            '2021-12-22 00:00:00',
            '2022-01-21 00:00:00',
            '2022-02-20 00:00:00'
        ]; // array key is month shamsi example(فروردین - ساعت 12 شب)
        // $shamsi_1400_array = array_map(function ($item) {
        //     return strtotime($item);
        // }, $shamsi_1400);
        $farvardin  = $this->orderModel->read_order_between($shamsi_1400[0], $shamsi_1400[1]);
        $ordebhesht = $this->orderModel->read_order_between($shamsi_1400[1], $shamsi_1400[2]);
        $khordad    = $this->orderModel->read_order_between($shamsi_1400[2], $shamsi_1400[3]);
        $tir        = $this->orderModel->read_order_between($shamsi_1400[3], $shamsi_1400[4]);
        $mordad     = $this->orderModel->read_order_between($shamsi_1400[4], $shamsi_1400[5]);
        $shhrivar   = $this->orderModel->read_order_between($shamsi_1400[5], $shamsi_1400[6]);
        $mehr       = $this->orderModel->read_order_between($shamsi_1400[6], $shamsi_1400[7]);
        $aban       = $this->orderModel->read_order_between($shamsi_1400[7], $shamsi_1400[8]);
        $azar       = $this->orderModel->read_order_between($shamsi_1400[8], $shamsi_1400[9]);
        $day        = $this->orderModel->read_order_between($shamsi_1400[9], $shamsi_1400[10]);
        $bhman      = $this->orderModel->read_order_between($shamsi_1400[10], $shamsi_1400[11]);
        $esfand     = $this->orderModel->read_order_between($shamsi_1400[11], $shamsi_1400[11]);

        return   [
            array_sum(array_column($farvardin, $requested . '_total')),
            array_sum(array_column($ordebhesht, $requested . '_total')),
            array_sum(array_column($khordad, $requested . '_total')),
            array_sum(array_column($tir, $requested . '_total')),
            array_sum(array_column($mordad, $requested . '_total')),
            array_sum(array_column($shhrivar, $requested . '_total')),
            array_sum(array_column($mehr, $requested . '_total')),
            array_sum(array_column($aban, $requested . '_total')),
            array_sum(array_column($azar, $requested . '_total')),
            array_sum(array_column($day, $requested . '_total')),
            array_sum(array_column($bhman, $requested . '_total')),
            array_sum(array_column($esfand, $requested . '_total')),

        ];
    }


}
