<?php

namespace App\Services\Auth\providers;

use App\Models\User;
use App\Services\Auth\contract\AuthProvider;
use App\Utilities\FlashMessage;

class SessionProvider extends AuthProvider
{
    const AUTH_KEY = 'auth';


    public  function login( $data, $password = null)
    {

        echo'<pre>';var_dump($data);die;
        if ( $user_id_get = $this->user_model->get('*',['phone',$data['phone']])) {
           var_dump( $user_id_get);
        }else{
            echo 'dd'; 
        };

        // user already exists
        // data validation


        if (!$this->is_valid_phone($data['phone'])) {
            FlashMessage::add('شماره وارد شده صحیح نیست', FlashMessage::WARNING);
            return false;
        }

        if (!$this->is_valid_email($data['email'])) {
            FlashMessage::add('ایمیل وارد شده صحیح نیست', FlashMessage::WARNING);
            return false;
        }

        if ($this->user_model->already_exists($data)) {
            FlashMessage::add('کاربری با این نام وجود دارد', FlashMessage::WARNING);
            return false;
        }
        $user_id = $this->user_model->create($data);

        if ($user_id) {
            $_SESSION['user_id'] = $user_id;
            FlashMessage::add('ثبت نام با موفقیت انجام شپ', FlashMessage::SUCCESS);
        } else {
            FlashMessage::add('مشکلی در هنگام ثبت تام رخ داده است', FlashMessage::WARNING);
        }
    }
    public  function is_login()
    {
        return $_SESSION[self::AUTH_KEY] ?? false;
    } //id user
    public  function logout()
    {
        if (isset($_SESSION[self::AUTH_KEY])) {
            unset($_SESSION[self::AUTH_KEY]);
        }
        return true;
    }
}
