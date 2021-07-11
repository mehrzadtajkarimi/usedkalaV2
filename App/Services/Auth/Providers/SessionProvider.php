<?php

namespace App\Services\Auth\Providers;

use App\Models\User;
use App\Services\Auth\Contract\AuthProvider;
use App\Services\SmsIR_VerificationCode;
use App\Utilities\FlashMessage;

class SessionProvider extends AuthProvider
{
    const AUTH_KEY = 'auth';


    public  function login($data, $password = null)
    {
        $user = $this->user_model->already_exists($data);
        if (!empty($user)) {

            $_SESSION[self::AUTH_KEY] ?? $_SESSION[self::AUTH_KEY] = $user['id'];
            return $user;

            //     $code_expired_at = $user['token_expired_at'];

            //     if ($code_expired_at > date('Y-m-d H:i:s')) {
            //         echo "کد ارسالی قبلی تا معتبر است...";
            //     } else {
            //         $code = rand(1000, 9999);
            //         $send_sms = new SmsIR_VerificationCode('4d1f9207ec72287f7c43b42e', 'usedkala', 'https://ws.sms.ir/api/MessageSend');
            //         $result= $send_sms->verificationCode('کد تایید usedkala' . $code, $user['phone']);
            //         echo '<pre>';
            //         var_dump($result);
            //         echo '</pre><br>';
            //         if ($result) {
            //             echo send_sms('9128897603 ', '1234');
            //             $this->user_model->update(
            //                 [
            //                     'token' => $code,
            //                     'token_expired_at' => date('Y-m-d H:i:s', time() + 180),
            //                 ],
            //                 ['id' => $user['id']]
            //             );
            //         }
            //         echo 'send ok';
            //     }
        }


        // show form get code
        // generate token
        // send sms
        // check token exists


        $data += [
            'token'            => rand(1, 9999),
            'token_expired_at' => date('Y-m-d H:i:s', time() + 180),
        ];

        $user_id = $this->user_model->create($data);

        if ($user_id) {
            $_SESSION[self::AUTH_KEY] = $user_id;
            FlashMessage:: add('ثبت نام با موفقیت انجام شپ', FlashMessage::SUCCESS);
        } else {
            FlashMessage:: add('مشکلی در هنگام ثبت تام رخ داده است', FlashMessage::WARNING);
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
    }
}
