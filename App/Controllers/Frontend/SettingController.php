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
		$slug = urldecode($slug['slug']);
		// var_dump($slug);
		// die();
        $setting_about = $this->settingModel->read_setting_by_slug($slug);
		// print_r($setting_about);
		// die();
        if (is_array($setting_about)) {
            $data = array(
                'setting'    => $setting_about[0]??[],
				'home_page_active_menu' => 'single single-post full-width'
            );
            return view('Frontend.about.show', $data);
        }
    }
    public function post()
    {
        $slug = $this->request->get_param('slug');

        $setting_post = $this->settingModel->read_setting_by_key('post');

        if (is_array($setting_post)) {
            $data = array(
                'setting'    => $setting_post[0]??[],
            );
            return view('Frontend.about.post', $data);
        }
    }
    public function rule()
    {
        $slug = $this->request->get_param('slug');

        $setting_rule = $this->settingModel->read_setting_by_key('rule');

        if (is_array($setting_rule)) {
            $data = array(
                'setting'    => $setting_rule[0]??[],
            );
            return view('Frontend.about.rule', $data);
        }
    }
    public function contact()
    {
        $slug = $this->request->get_param('slug');

        $setting_contact = $this->settingModel->read_setting_by_key('contact');

        if (is_array($setting_contact)) {
            $data = array(
                'setting'				=> $setting_contact[0]??[],
				'home_page_active_menu'	=> 'page home page-template-default'
            );
            return view('Frontend.about.contact', $data);
        }
    }
}
