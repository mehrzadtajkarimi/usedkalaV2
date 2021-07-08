<?php

namespace App\Controllers;


class Controller
{
    protected $request;

    public function __construct()
    {
        global $request;
        $this->request = $request;

    }


    public function str_rtrim($string, $param)
    {
        return array_shift(explode($param, $string));
    }
}
