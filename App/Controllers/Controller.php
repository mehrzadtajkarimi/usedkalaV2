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

    public function model($model_name)
    {
        $model_full_name = 'App\Models\\' . ucfirst($model_name);
        if (class_exists($model_full_name)) {
            return new $model_full_name;
        }
        return null;
    }


    public function str_rtrim($string, $param)
    {
        return array_shift(explode($param, $string));
    }
}
