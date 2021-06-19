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
    public abstract function is_login(): int; //id user
    public abstract function logout($email, $password);
}
