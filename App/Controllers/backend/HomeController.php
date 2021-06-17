<?php

namespace App\Controllers\backend;

class HomeController
{


    public function index()
    {
        global $request;
        return view_back('index',['request'=>$request]);
    }
}
