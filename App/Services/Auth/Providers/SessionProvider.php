<?php

namespace App\Services\Auth\Providers;

use App\Models\User;
use App\Services\Auth\Contract\AuthProvider;
use App\Services\SmsIR_VerificationCode;
use App\Utilities\FlashMessage;
use Ghasedak\GhasedakApi;

class SessionProvider extends AuthProvider
{
    const AUTH_KEY = 'auth';


    public  function login($data, $user_level = null)
    {
        try {
            $message = "تست ارسال وب سرویس قاصدک";
            $lineNumber = "10008566";
            $receptor = "09128897603";
            $api = new \Ghasedak\GhasedakApi('a5e283c01b4da80b682e844c21ce7c64116e59ed3b08e947ef1bd6056a29d48f');
            $api->SendSimple($receptor, $message, $lineNumber);
        } catch (\Ghasedak\Exceptions\ApiException $e) {
            echo 'dddddd'.$e->errorMessage();
        } catch (\Ghasedak\Exceptions\HttpException $e) {
            echo  'fffff'.$e->errorMessage();
        }




        $user = $this->user_model->already_exists($data);
        if (!empty($user)) {

            $_SESSION[self::AUTH_KEY] ?? $_SESSION[self::AUTH_KEY] = $user['id'];
            return $user;

            // $code_expired_at = $user['token_expired_at'];

            // if ($code_expired_at > date('Y-m-d H:i:s')) {
            //     echo "کد ارسالی قبلی تا معتبر است...";
            // } else {


            $code = rand(1000, 9999);


            try {
                $message = "کد تایید usedkala ";
                $lineNumber = "10008566";
                $receptor = "09128897603";
                $api = new GhasedakApi('a5e283c01b4da80b682e844c21ce7c64116e59ed3b08e947ef1bd6056a29d48f');
                $api->SendSimple($receptor, $message, $lineNumber);
            } catch (\Ghasedak\Exceptions\ApiException $e) {
                echo $e->errorMessage();
            } catch (\Ghasedak\Exceptions\HttpException $e) {
                echo $e->errorMessage();
            }








            $send_sms = new GhasedakApi('a5e283c01b4da80b682e844c21ce7c64116e59ed3b08e947ef1bd6056a29d48f');
            $result = $send_sms->SendSimple($user['phone'], 'کد تایید usedkala' . $code);
            echo '<pre>';
            var_dump($result);
            echo '</pre><br>';
            if ($result) {
                echo send_sms('9128897603 ', '1234');
                $this->user_model->update(
                    [
                        'token' => $code,
                        'token_expired_at' => date('Y-m-d H:i:s', time() + 180),
                    ],
                    ['id' => $user['id']]
                );
            }
            echo 'send ok';
            // }
        }


        // show form get code
        // generate token
        // send sms
        // check token exists


        $data += [
            'token'            => rand(1, 9999),
            'token_expired_at' => date('Y-m-d H:i:s', time() + 180),
            'user_level' => $user_level,
        ];

        $user_id = $this->user_model->create($data);

        if ($user_id) {
            $_SESSION[self::AUTH_KEY] = $user_id;
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
    }
    public  function is_token($token)
    {
        $get_token = $this->user_model->get('token,');
        if (isset($_SESSION[self::AUTH_KEY])) {
            unset($_SESSION[self::AUTH_KEY]);
        }
    }
}
