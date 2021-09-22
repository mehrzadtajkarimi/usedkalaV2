<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use App\Utilities\FlashMessage;

class SettingController extends Controller
{


    public function __construct()
    {
        parent::__construct();

    }

    public function about()
    {
        $slug = $this->request->get_param('slug');
    
        $setting = $this->settingModel->join_setting_to_photo();

    
    
        if (is_array($setting)) {
            $data = array(
                'settings'    => $setting,
            );
            return view('Frontend.about.index', $data);
        }
    }
    public function post()
    {
    }
    public function rule()
    {
    }

}
