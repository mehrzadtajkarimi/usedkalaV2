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
            if (preg_match('/^[0-9]{10}+$/', $request)) {
                $user = Auth::login(['phone' => $request]);
            } else {
                die('فرمت وارد شده صحیح نمی باشد');
            }
        }
        if (filter_var($request, FILTER_VALIDATE_EMAIL)) {
            $user = Auth::login(['email' => $request]);
        }

        if ($user) {
            return $this->request->redirect('profile');
        }
    }
    public function logout()
    {
        Auth::logout();
        return $this->request->redirect('');
    }
}
