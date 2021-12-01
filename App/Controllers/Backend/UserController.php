<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\User;

class UserController  extends Controller
{
    public $categoryModel;
    public $UserModel;

    public function __construct()
    {
        parent::__construct();
        $this->UserModel = new User();
    }
    public function index()
    {


        $data = [
            'users' => $this->UserModel->join__whit_province_city(),
        ];
        return view('Backend.user.index', $data);
    }
}
