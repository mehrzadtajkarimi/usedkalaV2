<?php

namespace App\Controllers\frontend;

class HomeController
{


    public function index()
    {
        global $request;
        return view_front('index',['request'=>$request]);
    }
}
