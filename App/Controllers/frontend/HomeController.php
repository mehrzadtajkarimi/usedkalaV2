<?php

namespace App\Controllers\frontend;

use App\Controllers\Controller;


class HomeController extends Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $data = array();
        return view('frontend.index', $data);
    }
}
