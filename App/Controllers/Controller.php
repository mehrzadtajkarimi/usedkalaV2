<?php

namespace App\Controllers;



class Controller
{



    public function str_rtrim($string , $param) {
        return array_shift(explode($param,$string));
    }
}
