<?php

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
        dd($this->cityModel->join_city__with_province());
        // $data = array(
        //     'Examples' => 'Examples',
        // );
        // return view('Backend.examples.index', $data);
    }
}
