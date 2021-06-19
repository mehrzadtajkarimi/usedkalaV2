<?php

namespace App\Services\Basket;

use App\contracts\Facade;
use App\Services\Basket\providers\SessionProvider;

class Basket extends Facade
{
    protected static $provider;

    public static function set_provider()
    {
        self::$provider = SessionProvider::instance();
    }
}
