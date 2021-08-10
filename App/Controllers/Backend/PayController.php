<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Services\Payment\Online\OnlinePayment;

class PayController extends Controller
{

    public function pay()
    {
        $params = $this->request->params();
        $whitelist = ['Online', 'Wallet','COD'];
        if (!in_array($params['payType'], $whitelist)) {
            die("Invalid Pay Request !");
        }

        $payTypeClass = str_replace('#PT#', $params['payType'], "\App\Services\Payment\#PT#\#PT#Payment");;
        $payType = new $payTypeClass;

        // $payType->setGatway(...); // gateway injection (if user can select gateway)

        $payType->pay();
    }

    public function verify()
    {

        $payType = new OnlinePayment();
        $payType->verify();
    }
}
