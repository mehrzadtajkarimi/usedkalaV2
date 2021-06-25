<?php

namespace App\Services\Auth\providers;

use App\Models\User;
use App\Services\Auth\contract\AuthProvider;
use App\Utilities\FlashMessage;

class SessionProvider extends AuthProvider
{
    const AUTH_KEY = 'auth';


    public  function login($data, $password = null)
    {



        if ($id = $this->user_model->already_exists($data)) {
            echo '<pre>';
            var_dump($id);
            echo '</pre><br>';
            // if expired time  > now() get token show massage second expired time
            // else generate token save token to database set time expired 3 min send new sms





        }
        // show form get code
        // generate token
        // send sms
        // check token exists




        $user_id = $this->user_model->create($data);

        if ($user_id) {
            $_SESSION['user_id'] = $user_id;
            FlashMessage::add('ثبت نام با موفقیت انجام شپ', FlashMessage::SUCCESS);
        } else {
            FlashMessage::add('مشکلی در هنگام ثبت تام رخ داده است', FlashMessage::WARNING);
        }


        // user already exists
        // data validation


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
