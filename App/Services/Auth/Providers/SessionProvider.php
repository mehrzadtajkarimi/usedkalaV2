<?php

namespace App\Services\Auth\Providers;

use App\Models\User;
use App\Services\Auth\Contract\AuthProvider;
use App\Utilities\FlashMessage;
use App\Services\Auth\Notification;

class SessionProvider extends AuthProvider
{
    const AUTH_KEY = 'auth';
    const TIME_EXPIRED = 130;

    public  function login($param, $user_level = 0)
    {
        $notification = new Notification;

        $user  = $this->user_model->already_exists($param);
        do {
            $token = rand(1000, 9999);
        } while (isset($user) ? $this->user_model->has(['token' => $token]) : '');


        if (empty($user)) {
            $param += [
                'token'            => rand(1, 9999),
                'token_expired_at' => date('Y-m-d H:i:s', time() + self::TIME_EXPIRED),
                'user_level'       => $user_level,
            ];

            if (isset($param['phone'])) {
                $result = $notification->send_sms_by_ghasedak($token, $user);
                $_SESSION['phone'] = $param['phone'];
            }
            if (isset($param['email'])) {
                $result = $notification->send_sms_by_email($token, $user, $param);
                $_SESSION['email'] = $param['email'];
            }

            if ($result) {
                $this->user_model->create($param);
                FlashMessage::add('ارسال با موفقیت انجام شد');
                $this->request->redirect('token');
            } else {
                FlashMessage::add('مشکلی رخ داده است', FlashMessage::WARNING);
                $this->request->redirect('login');
            }
        }


        $expired_at       = strtotime($user['token_expired_at']);
        $now              = strtotime(date('Y-m-d H:i:s'));
        $token_expired_at = $expired_at - $now;
        // dd($user['token_expired_at'], date('Y-m-d H:i:s'), $token_expired_at,  self::TIME_EXPIRED);
        if ($token_expired_at > 0 && self::TIME_EXPIRED > $token_expired_at) {
            FlashMessage::add(' کد ارسالی قبلی ' . gmdate("i:s", $token_expired_at) . ' ثانیه دیگر اعتبار دارد ', FlashMessage::WARNING);
            $this->request->redirect('login');
        }

        if (isset($param['phone'])) {
            $result = $notification->send_sms_by_ghasedak($token, $user);
            $_SESSION['phone'] = $param['phone'];
        }
        if (isset($param['email'])) {
            $result = $notification->send_sms_by_email($token, $user, $param);
            $_SESSION['email'] = $param['email'];
        }
        if ($result) {
            $update = $this->user_model->update(
                [
                    'token'            => $token,
                    'token_expired_at' => date('Y-m-d H:i:s', time() + self::TIME_EXPIRED),
                ],
                ['id' => $user['id']]
            );

            if ($update) {
                FlashMessage::add('ارسال با موفقیت انجام شد');
                $this->request->redirect('token');
            } else {
                FlashMessage::add('مشکلی رخ داده است', FlashMessage::WARNING);
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
        $this->request->redirect('');
    }
    public  function is_token($token)
    {
        $user = $this->user_model->first(['token' => $token]);
        if ($user) {
            $_SESSION[self::AUTH_KEY] ?? $_SESSION[self::AUTH_KEY] = $user['id'];
            if (isset($_SESSION['phone'])) {
                unset($_SESSION['phone']);
            }
            if (isset($_SESSION['email'])) {
                unset($_SESSION['email']);
            }

            FlashMessage::add('ثبت نام با موفقیت انجام شد');
            $this->request->redirect('profile');
        } else {
            FlashMessage::add('کد ارسالی رو مجدد بررسی و ارسال نمایید', FlashMessage::WARNING);
            $this->request->redirect('token');
        }
    }
}
