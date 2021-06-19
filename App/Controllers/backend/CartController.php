<?php

namespace App\Controllers\backend;

use App\Core\Request;

class CartController
{
private $basket;

    public function index(Request $request)
    {
        return view_back('cart.index', ['request' => $request]);
    }


    public function add(Request $request)
    {
      // redirect index
    }

    public function remove(Request $request)
    {
        // redirect index
    }
}
