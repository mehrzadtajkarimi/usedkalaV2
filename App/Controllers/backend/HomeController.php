<?php

namespace App\Controllers\backend;

use App\Controllers\Controller;

class HomeController extends Controller
{


    public function index()
    {
        return view('backend.index',['request'=>$this->request]);
    }
}
