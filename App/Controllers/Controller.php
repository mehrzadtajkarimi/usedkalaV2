<?php

namespace App\Controllers;

use App\Core\Request;
use App\Models\Category;

class Controller
{
    public $request;
    public $model;
    public function __construct() {
        $this->request = new Request;
        $this->model = new Category;
    }
}
