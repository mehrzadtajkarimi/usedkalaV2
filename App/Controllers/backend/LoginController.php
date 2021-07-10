<?php

namespace App\Controllers\backend;

use App\Controllers\Controller;
use App\Services\Auth\Auth;

class LoginController extends Controller
{




    public function login()
    {

        return view('backend.user.login',[], true);
    }

    public function is_login()
    {
        $phone_number = $this->request->input('phone-number');
        $user = Auth::login(['phone' => $phone_number]);
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
