<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Core\Request;
use App\Models\City;
use App\Models\Province;
use App\Models\User;
use App\Utilities\FlashMessage;

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
            'users'     => $this->UserModel->join__whit_province_city() ?? [],
            'provinces' => $this->ProvinceModel->read_province(),
        ];
        return view('Backend.user.index', $data);
    }
    public function get_city()
    {
        $province_id = $this->request->get_param('id');
        $city        = $this->CityModel->get_city_by_province_id($province_id);
        echo  json_encode($city);
    }


    public function update()
    {
        $id = $this->request->get_param('id');
        $params = $this->request->params();


        $param = [
            'first_name'    => $params['user-first_name'],
            'last_name'     => $params['user-last_name'],
            'national_code' => $params['user-national_code'],
            'province_id'   => $params['user-province_id'],
            'city_id'       => $params['user-city_id'],
            'postal_code'   => $params['user-postal_code'],
            'address'       => $params['user-address'],
            'email'         => $params['user-email'],
            'status'        => $params['user-status'] ?? 0,
        ];
        $is_user_update = $this->UserModel->update_user($param, $id['id']);


        if ($is_user_update) {
            FlashMessage::add("ویرایش اطلاعات کاربر با موفقیت انجام شد");
            return     $this->request->redirect('admin/users');
        }
        FlashMessage::add(" مشکلی در ویرایش اطلاعات کاربر رخ داد ", FlashMessage::ERROR);
        return     $this->request->redirect('admin/users');
    }


    public function destroy()
    {
        $id= $this->request->get_param('id');

        $is_deleted_product= $this->UserModel->delete_user($id);

        if ($is_deleted_product) {
            FlashMessage::add("کاربر با موفقیت از دیتابیس حذف شد");
            return $this->request->redirect('product', FlashMessage::WARNING);
        }
        FlashMessage::add(" مشکلی در حذف کاربر پیش آمده است", FlashMessage::ERROR);
        return $this->request->redirect('admin/users');
    }
}
