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
        try 
        {
            $message = "تست ارسال وب سرویس قاصدک";
            $lineNumber = "10008566";
            $receptor = "09128897603";
            $api = new \Ghasedak\GhasedakApi('a5e283c01b4da80b682e844c21ce7c64116e59ed3b08e947ef1bd6056a29d48f');
            $api->SendSimple($receptor,$message,$lineNumber);
        }
        catch(\Ghasedak\Exceptions\ApiException $e){
            echo $e->errorMessage();
        }
        catch(\Ghasedak\Exceptions\HttpException $e){
            echo $e->errorMessage();
        }




        global $request;
        return view('Frontend.user.login', ['request' => $request]);
    }


    public function is_login()
    {
        $request = $this->request->input('login');
        if (is_numeric($request)) {
            Auth::login(['phone' => $request]);
            return $this->request->redirect('profile');
        }
        if (filter_var($request, FILTER_VALIDATE_EMAIL)) {
            Auth::login(['email' => $request]);
            return $this->request->redirect('profile');
        }
        FlashMessage:: add('مشکلی در هنگام ثبت تام رخ داده است', FlashMessage::WARNING);
        return $this->request->redirect('login');
    }
    public function logout()
    {
        Auth::logout();
        return $this->request->redirect('');
    }
    public function token()
    {
        $request = $this->request->input('token');
        Auth::is_token($request);
        return ;
    }
}
