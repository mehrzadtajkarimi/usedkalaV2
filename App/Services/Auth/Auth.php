<?php

namespace App\Services\Auth;

use App\contracts\Facade;
use App\Services\Auth\providers\SessionProvider;

class Auth extends Facade
{
    protected static $provider;

    public static function set_provider()
    {

        self::$provider = SessionProvider::instance();
    }
}
