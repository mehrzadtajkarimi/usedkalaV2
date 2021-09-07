<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Services\Auth\Auth;

class LoginController extends Controller
{

    public function login()
    {
        global $request;
        return view('Backend.user.login', ['request' => $request], true);
    }
    public function is_login()
    {
        $phone = $this->request->input('phone');
        Auth::login([
            'phone' => $phone,
        ], true); // true == is_admin
    }
    public function token()
    {
        global $request;
        return view('Backend.user.token', ['request' => $request], true);
    }
    public function is_token()
    {
        $token = $this->request->input('token');
        Auth::is_token($token, true);
    }
    public function logout()
    {
        Auth::logout();
    }
}
