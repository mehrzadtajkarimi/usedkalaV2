<?php

namespace App\Controllers\Frontend;

// **************************************************************** add namespace
use App\Controllers\Controller;
use App\Models\City;
use App\Utilities\FlashMessage;

class CityController  extends Controller
{
    private $cityModel;

    public function __construct()
    {
        parent::__construct();
        $this->cityModel = new City();
    }

    public function index()
    {
        $province_id = $this->request->get_param('id');
        $city = $this->cityModel->get_city_by_province_id($province_id);
        $city= json_encode($city);
        echo $city;
        // $data = array(
        //     'Examples' => 'Examples',
        // );
        // return view('Backend.examples.index', $data);
    }
}
