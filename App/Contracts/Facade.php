<?php

namespace App\Contracts;

abstract class Facade
{

    protected static function set_provider(){
        throw new \RuntimeException('Facade dose not implemented set provider method');
    }
    public static function __callStatic($name , $arguments)
    {
        static::set_provider();
        return static::$provider->$name(... $arguments);
    }
}
