<?php

namespace App\Services\Auth\providers;

use App\Services\Auth\contract\AuthProvider;


class SessionProvider extends AuthProvider
{
    const AUTH_KEY = 'auth';
    public  function register(array $data)
    {
        // user already exists
        // data validation

    }
    public  function login($phone, $email = null, $password = null)
    {
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
