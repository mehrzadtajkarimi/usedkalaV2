<?php

namespace App\Controllers\backend;

use App\Controllers\Controller;

class UserController  extends Controller
{
    public function index()
    {
        return view('backend.user.index', ['request' => $this->request]);
    }
}
