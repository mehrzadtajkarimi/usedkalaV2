<?php

namespace App\Controllers;

use App\Core\Request;
use App\Models\Category;

class Controller
{
    protected $request;


    public function __construct()
    {
        $this->request =  new Request();
    }
}
