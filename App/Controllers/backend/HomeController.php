<?php

namespace App\Controllers\backend;

class HomeController
{


    public function index()
    {
        global $request;
        return view('backend.index',['request'=>$request]);
    }
}
