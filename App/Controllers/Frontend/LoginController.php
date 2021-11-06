<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Services\Auth\Auth;


class LoginController extends Controller
{
    public function login()
    {
        global $request;
        return view('Frontend.user.login', ['request' => $request]);
    }
    public function is_login()
    {
        $request = $this->request->input('login');
        if (is_numeric($request)) {
            Auth::login([
                'phone'      => $request,
            ]);
        }
        if (filter_var($request, FILTER_VALIDATE_EMAIL)) {
            Auth::login([
                'email'      => $request,
            ]);
        }
    }

    public function token()
    {
        global $request;
        return view('Frontend.user.token', ['request' => $request]);
    }
    public function is_token()
    {
        $token = $this->request->input('token');
        Auth::is_token($token);
    }
    public function logout()
    {
        Auth::logout();
    }
}
