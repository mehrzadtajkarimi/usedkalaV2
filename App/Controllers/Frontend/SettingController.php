<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Setting;

class SettingController extends Controller
{

    public $settingModel;

    public function __construct()
    {
        parent::__construct();
        $this->settingModel = new Setting();
    }

    public function about()
    {
        $slug = $this->request->get_param('slug');

        $setting = $this->settingModel->join_setting_to_photo();

        dd($setting);

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
