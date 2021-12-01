<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\City;
use App\Models\Province;
use App\Models\User;

class UserController  extends Controller
{
    public $categoryModel;
    public $UserModel;
    public $CityModel;
    public $ProvinceModel;

    public function __construct()
    {
        parent::__construct();
        $this->UserModel     = new User();
        $this->CityModel     = new City();
        $this->ProvinceModel = new Province();
    }
    public function index()
    {

        $data = [
            'users'     => $this->UserModel->join__whit_province_city(),
            'provinces' => $this->ProvinceModel->read_province(),
        ];
        return view('Backend.user.index', $data);
    }
    public function get_city()
    {

        $province_id = $this->request->get_param('id');
        $city        = $this->CityModel->get_city_by_province_id($province_id);
        $city        = json_encode($city);
        echo $city;
    }


    public function update()
    {
        $id = $this->request->get_param('id');
        $params = $this->request->params();

        $param = [
            'first_name'    => $params['first_name'],
            'last_name'     => $params['last_name'],
            'national_code' => $params['national_code'],
            'province_id'   => $params['province_id'],
            'province_id'   => $params['province_id'],
        ];
        $data = [
            'users' => $this->UserModel->update_user($param, $id),
        ];
        return view('Backend.user.index', $data);
    }
}
