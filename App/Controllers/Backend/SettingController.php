<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Setting;
use App\Utilities\FlashMessage;

class SettingController extends Controller
{

    public $settingModel;

    public function __construct()
    {
        parent::__construct();
        $this->settingModel = new Setting();
    }

    public function index()
    {
        $data = array(
            'settings'    => $this->settingModel->read_setting(),
        );
        return view('Backend.setting.index', $data);
    }

    public function store()
    {
        $params = $this->request->params();

        $params_create = array(
            'key'  => $params['key'],
            'value' => $params['value'],
        );

        $this->settingModel->create_setting($params_create);

        FlashMessage::add("مقادیر با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/setting');
    }

    public function edit()
    {
        $id = $this->request->get_param('id');
        $data = array(
            'setting' => $this->settingModel->read_setting($id),

        );
        view('Backend.setting.edit', $data);
    }
    public function update()
    {
        $params = $this->request->params();

        dd($params);
    }
}
