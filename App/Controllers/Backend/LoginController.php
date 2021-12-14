<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Services\Auth\Auth;
use App\Models\User;

class LoginController extends Controller
{

    public function login()
    {
		$isLogin=Auth::is_login();
		if ($isLogin>0)
		{
			$userModel = new User();
			$isAdmin=$userModel->is_admin($isLogin);
			if ($isAdmin)
				return $this->request->redirect('admin');
			else
				return $this->request->redirect('profile');
		}
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
    // public function token()
    // {
    //     global $request;
    //     return view('Backend.user.token', ['request' => $request], true);
    // }
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
