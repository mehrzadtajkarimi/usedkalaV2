<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Setting;
use App\Services\Upload\UploadedFile;
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

    public function create()
    {
        $data = array(
            'settings'    => $this->settingModel->read_setting(),
        );
        return view('Backend.setting.create', $data);
    }

    public function store()
    {
        $params = $this->request->params();





        $params_create = array(
            'key'   => $params['key'],
            'value' => $params['value'],
            'slug'  => $params['slug'],
        );




        $files                   = $this->request->files();
        $files_param             = $files['setting_image'];
        if ($files_param['size'] < 150000) {
            FlashMessage::add("حجم عکس باید بالا 150 k ", FlashMessage::WARNING);
            return $this->request->redirect('admin/setting');
        }
        $files_param_tmp_name    = $files_param['tmp_name'];
        $check_file_param_exists = !empty($files_param_tmp_name[0]);
        if ($check_file_param_exists) {
            $is_create_slider = $this->sliderModel->create_slider($params_create);
            $file = new UploadedFile($files_param);
            $file_paths = $file->save();
            if ($file_paths) {
                foreach ($file_paths as $key => $path) {
                    $is_create_photo   = $this->photoModel->create_photo('Setting', $is_create_slider, $path, 'setting_image', $key);
                }

                if ($is_create_slider) {
                    FlashMessage::add("ایجاد اسلایدر با موفقیت انجام شد");
                } elseif ($is_create_photo) {
                    FlashMessage::add(" ایجاد تصویر موفقیت انجام شد", FlashMessage::ERROR);
                } else {
                    FlashMessage::add(" مشکلی در ایجاد اسلایدر رخ داد ", FlashMessage::ERROR);
                }
                return $this->request->redirect('admin/setting');
            }
        } else {
            $this->sliderModel->create_slider($params_create);
            FlashMessage::add("مقادیر بدونه ضمیمه عکس با موفقیت در دیتابیس ذخیره شد", FlashMessage::WARNING);
            return $this->request->redirect('admin/slider');
        }



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
