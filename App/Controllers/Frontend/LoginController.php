<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Core\Request;
use App\Services\Auth\Auth;
use App\Utilities\FlashMessage;

class LoginController extends Controller
{
    public function login()
    {
		$isLogin=Auth::is_login();
		if ($isLogin>0)
			return $this->request->redirect('');
        global $request;
        return view('Frontend.user.login', ['request' => $request]);
    }
	
    public function is_login()
    {
        $request = $this->request->input('login');
        if (is_numeric($request) && preg_match('/^09(1[0-9]|3[1-9]|2[1-9])-?[0-9]{3}-?[0-9]{4}/',$request))
		{
			Auth::login([
				'phone'      => $request,
			]);
		}
		else
		{
			FlashMessage::add('موبایل را با ارقام لاتین بصورت یازده رقمی بدونِ اسپیس، خط فاصله یا نظایر اینها وارد کنید.', FlashMessage::WARNING);
			Request::redirect('login');
		}
        // }
        // if (filter_var($request, FILTER_VALIDATE_EMAIL))
		// {
            // Auth::login([
                // 'email'      => $request,
            // ]);
        // }
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
