<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Services\Auth\Auth;
use App\Utilities\FlashMessage;
use Ghasedak\GhasedakApi;

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
            Auth::login(['phone' => $request]);
            $this->request->redirect('profile');
        }
        if (filter_var($request, FILTER_VALIDATE_EMAIL)) {
            Auth::login(['email' => $request]);
            $this->request->redirect('profile');
        }
        FlashMessage::add('مشکلی در هنگام ثبت تام رخ داده است', FlashMessage::WARNING);
        $this->request->redirect('login');
    }



    public function token()
    {
        global $request;
        return view('Frontend.user.token', ['request' => $request]);
    }
    public function is_token()
    {
        $request = $this->request->input('token');

        $is_token= Auth::is_token($request);
        if ($is_token) {
            $this->request->redirect('profile');
        }else{
            $this->request->redirect('login');
        }
    }



    public function logout()
    {
        Auth::logout();
        $this->request->redirect('');
    }

}
