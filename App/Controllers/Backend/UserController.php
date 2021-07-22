<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;

class UserController  extends Controller
{
    public function index()
    {
        return view('Backend.user.index', ['request' => $this->request]);
    }
}
