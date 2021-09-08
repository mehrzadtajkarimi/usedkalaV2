<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;

class HomeController extends Controller
{


    public function index()
    {
    //  dd($_SESSION);
        return view('Backend.index', ['request' => $this->request]);
    }
}
