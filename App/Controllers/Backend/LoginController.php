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
