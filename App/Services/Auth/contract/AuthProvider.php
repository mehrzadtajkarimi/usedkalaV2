<?php

namespace App\Services\Auth\contract;

abstract class AuthProvider
{
    public static $instance = null;


    public static function instance()
    {
        if (is_null(static::$instance)) {
            static::$instance = new static();
        }
        return static::$instance;
    }



    public abstract function register(array $data);
    public abstract function login($phone, $email = null, $password = null);
    public abstract function is_login(); //id user
    public abstract function logout();



    public function generate_hash($password)
    {
        return password_hash($password , PASSWORD_BCRYPT);
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

    // public function is_valid_email($email)
    // {
    //     return filter_var($email, FILTER_VALIDATE_EMAIL);
    // }

    // public function is_strong_password($password)
    // {
    //     if (strlen($password) < 6) {
    //         return false;
    //     }
    //     // add validation
    //     return true;
    // }
}
