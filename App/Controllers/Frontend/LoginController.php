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
        $phone = $this->request->input('phone');
        $user = Auth::login(['phone' => $phone]);
        if ($user) {
            return $this->request->redirect('admin');
        }
    }
    public function logout()
    {
        Auth::logout();
        return $this->request->redirect('');
    }
}
