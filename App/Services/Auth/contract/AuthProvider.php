<?php

namespace App\Services\Auth\contract;

use App\Models\User;

abstract class AuthProvider
{
    public static $instance = null;
    public  $user_model;



    public static function instance()
    {
        if (is_null(static::$instance)) {
            //یک شی از همین کلاس ساخته می‌شود
            static::$instance = new static(new User());
        }
        return static::$instance;
    }

    protected function __construct(User $user_model)
    {
        $this->user_model = $user_model;
    }

    // public abstract function register(array $data);
    public abstract function login($data,  $password = null);
    public abstract function is_login(); //id user
    public abstract function logout();



    public function generate_hash($password)
    {
        return password_hash($password, PASSWORD_BCRYPT);
    }

    public function generate_random_password()
    {
        $alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
        $pass = array(); //remember to declare $pass as an array
        $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
        for ($i = 0; $i < 8; $i++) {
            $n = rand(0, $alphaLength);
            $pass[] = $alphabet[$n];
        }
        return implode($pass); //turn the array into a string
    }

    public function is_valid_email($email)
    {
        return filter_var($email, FILTER_VALIDATE_EMAIL);
    }

    public function is_valid_phone($phone)
    {
        $pattern = "//09(0[1-2]|1[0-9]|3[0-9]|2[0-1])-?[0-9]{3}-?[0-9]{4}//u";
        return preg_match($pattern, $phone);
    }

    public function is_strong_password($password)
    {
        if (strlen($password) < 6) {
            return false;
        }
        // add validation
        return true;
    }
}
