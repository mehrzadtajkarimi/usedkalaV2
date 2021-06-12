<?php

namespace App\Controllers;

class HomeController
{


    public function index()
    {
        global $request;
        return view('index',['request'=>$request]);
    }
}
