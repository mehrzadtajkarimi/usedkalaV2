<?php

namespace App\Services\Auth\Providers;

use App\Models\User;
use App\Services\Auth\Contract\AuthProvider;
use App\Utilities\FlashMessage;
use App\Services\Auth\Notification;

class SessionProvider extends AuthProvider
{
    const AUTH_KEY = 'auth';
    const TIME_EXPIRED = 10;

    public  function login($param, $user_level = 0)
    {
        $user  = $this->user_model->already_exists($param);
        $token = rand(1000, 9999);
        if (empty($user)) {
            if ($this->notification_email_or_mobile($token, $param)) {
                $user_id = $this->user_model->create($param);
                $this->generate_active_code($user_id, $token, $param);
            }
        }
        $this->has_time($user);
        if ($this->notification_email_or_mobile($token, $param)) {
            $this->generate_active_code($user['id'], $token, $param);
        }
    }

    public function is_login()
    {
        return $_SESSION[self::AUTH_KEY] ?? false;
    }

    public function logout()
    {
        if (isset($_SESSION[self::AUTH_KEY])) {
            unset($_SESSION[self::AUTH_KEY]);
        }
        $this->request->redirect('');
    }

    public function is_token($token)
    {
        // unset($_SESSION);
        // dd($_SESSION['phone']);
        if (isset($_SESSION['phone'])) {
            $user = $this->user_model->first(['phone' => $_SESSION['phone']]);
            unset($_SESSION['phone']);
        }
        if (isset($_SESSION['email'])) {
            $user = $this->user_model->first(['email' => $_SESSION['email']]);
            unset($_SESSION['email']);
        }
        // dd($user);
        // unset($_SESSION);
        $is_code =  $this->active_code_model->is_code($token, $user['id']);
        if ($is_code) {
            $this->active_code_model->delete(['user_id' => $user['id']]);
            $_SESSION[self::AUTH_KEY] ?? $_SESSION[self::AUTH_KEY] = $user['id'];
            FlashMessage::add('ثبت نام با موفقیت انجام شد');
            $this->request->redirect('profile');
        } else {
            FlashMessage::add('کد ارسالی رو مجدد بررسی و ارسال نمایید', FlashMessage::WARNING);
            $this->request->redirect('token');
        }
    }

    public function notification_email_or_mobile($token, $param)
    {
        if (isset($param['phone'])) {
            $send = $this->notification_model->send_token_by_ghasedakSms($token, $param['phone']);
            return $send->result->message == 'success' ? true : false;
        }
        if (isset($param['email'])) {
            $send = $this->notification_model->send_token_by_email($token, $param['email']);
            dd($send, 'notification_email_or_mobile');
        }
    }

    public function set_session_for_next_request($param)
    {
        if (isset($param['phone'])) {
            $_SESSION['phone'] = $param['phone'];
        }
        if (isset($param['email'])) {
            $_SESSION['email'] = $param['email'];
        }
    }

    public function send_message($is_active_code)
    {
        if ($is_active_code) {
            FlashMessage::add('ارسال با موفقیت انجام شد');
            $this->request->redirect('token');
        } else {
            FlashMessage::add('مشکلی رخ داده است', FlashMessage::WARNING);
            $this->request->redirect('login');
        }
    }

    public function has_time($user)
    {
        $expired_at       = strtotime($this->active_code_model->get_expired_at($user['id']));
        $now              = strtotime(date('Y-m-d H:i:s'));
        $token_expired_at = $expired_at - $now;
        // dd($this->active_code_model->get_expired_at($user['id']), date('Y-m-d H:i:s'), $token_expired_at,  self::TIME_EXPIRED);
        if ($token_expired_at > 0 && self::TIME_EXPIRED > $token_expired_at) {
            FlashMessage::add(' کد ارسالی قبلی ' . gmdate("i:s", $token_expired_at) . ' ثانیه دیگر اعتبار دارد ', FlashMessage::WARNING);
            $this->request->redirect('login');
        }
    }

    public function create_code_active_code($user_id, $token)
    {
        $created = $this->active_code_model->create_active_code(
            [
                'user_id'    => $user_id,
                'code'       => $token,
                'expired_at' => date('Y-m-d H:i:s', time() + self::TIME_EXPIRED),
            ]
        );
        return isset($created) ? true : false;
    }

    public function generate_active_code($user_id, $token, $param)
    {
        $is_active_code = $this->create_code_active_code($user_id, $token, $param);
        if ($is_active_code) {
            $this->set_session_for_next_request($param);
        }
        $this->send_message($is_active_code);
    }
}
