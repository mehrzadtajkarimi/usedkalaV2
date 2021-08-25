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
    const TIME_EXPIRED = 130;

    public  function login($param, $user_level = 0)
    {
        $code       = rand(1000, 9999);
        $user       = $this->user_model->already_exists($param);
        $expired_at = strtotime($user['token_expired_at']);
        $now        = strtotime(date('Y-m-d H:i:s'));

        $token_expired_at = $expired_at - $now;

        if (empty($user)) {
            dd('(empty($user)) ** SessionProvider');
            $param += [
                'token'            => rand(1, 9999),
                'token_expired_at' => date('Y-m-d H:i:s', time() + self::TIME_EXPIRED),
                'user_level'       => $user_level,
            ];

            $user_id = $this->user_model->create($param);

            if ($user_id) {

                $_SESSION[self::AUTH_KEY] = $user_id;

                FlashMessage::add('ارسال با موفقیت انجام شد');
                $this->request->redirect('token');
            } else {

                FlashMessage::add('مشکلی در هنگام ثبت تام رخ داده است', FlashMessage::WARNING);
            }
        }

        $_SESSION[self::AUTH_KEY] ?? $_SESSION[self::AUTH_KEY] = $user['id'];

        // dd($user['token_expired_at'], date('Y-m-d H:i:s'), $token_expired_at,  self::TIME_EXPIRED);
        if ($token_expired_at > 0 && self::TIME_EXPIRED > $token_expired_at) {

            FlashMessage::add(' کد ارسالی قبلی ' . gmdate("i:s", $token_expired_at) . ' ثانیه دیگر اعتبار دارد ', FlashMessage::WARNING);
            return $this->request->redirect('login');
        }

        try {
            $send_sms = new GhasedakApi($_ENV['GHASEDAK_TOKEN']);
            $result   = $send_sms->SendSimple($user['phone'], "کدتایید usedkala\n$code", "10008566");
        } catch (\Ghasedak\Exceptions\ApiException $e) {
            echo $e->errorMessage();
        } catch (\Ghasedak\Exceptions\HttpException $e) {
            echo $e->errorMessage();
        }
        if ($result) {

            $become = $this->user_model->update(
                [
                    'token'            => $code,
                    'token_expired_at' => date('Y-m-d H:i:s', time() + self::TIME_EXPIRED),
                ],
                ['id' => $user['id']]
            );

            if ($become) {

                FlashMessage::add('ارسال با موفقیت انجام شد');
                $this->request->redirect('token');
            } else {

                FlashMessage::add('مشکلی در هنگام ویرایش کد رخ داده است', FlashMessage::WARNING);
                $this->request->redirect('login');
            }
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
    }
    public  function is_token($token)
    {
        $has_token = $this->user_model->has(['token' => $token]);
        $session = $_SESSION[self::AUTH_KEY];
        if ($has_token && isset($session)) {
            unset($session);
        }
        return $has_token;
    }
}
