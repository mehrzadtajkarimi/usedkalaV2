<?php

namespace App\Controllers\backend;

class UserController
{
    public function index()
    {
        global $request;
        return view('backend.user.index', ['request' => $request]);
    }
}
