<?php

namespace App\Controllers\frontend;

class HomeController
{


    public function index()
    {
        global $request;
        return view('frontend.index',['request'=>$request]);
    }
}
