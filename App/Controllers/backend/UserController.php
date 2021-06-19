<?php

namespace App\Controllers\backend;

class UserController
{


    public function index()
    {
        global $request;
        return view_back('users.index',['request'=>$request]);
    }
}
