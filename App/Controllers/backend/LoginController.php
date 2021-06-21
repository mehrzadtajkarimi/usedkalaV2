<?php

namespace App\Controllers\backend;

class LoginController
{


    public function login()
    {
        global $request;
        return view('backend.user.login', ['request' => $request], true);
    }

    public function is_login()
    {
        global $request;
        echo $request->params;
        return true;
    }
    public function register()
    {
        global $request;
        return view('backend.user.register', ['request' => $request], true);
    }
}
