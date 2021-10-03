<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Photo;
use App\Models\Setting;
use App\Services\Upload\UploadedFile;
use App\Utilities\FlashMessage;

class SettingController extends Controller
{

    public $settingModel;
    public $photoModel;

    public function __construct()
    {
        parent::__construct();
        $this->settingModel = new Setting();
        $this->photoModel = new Photo();
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



        $files = $this->request->files();
        // dd($params);
        if (isset($files)) {
            foreach ($this->request->files() as  $value) {
                $files_tmp_name    = $files['file']['tmp_name'];

                $check_file_param_exists = !empty($files_tmp_name[0]);
                if ($check_file_param_exists) {
                    $file = new UploadedFile($value);
                    $file->save();
                }
            }
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
    public function upload()
    {
        $file   = $this->request->files();
        $fileUploadedCkeditor    = $file['upload'];
        $file_tmp_name           = $file['upload']['tmp_name'];
        $check_file_param_exists = !empty($file_tmp_name[0]);
        if ($check_file_param_exists) {
            $file = new UploadedFile($fileUploadedCkeditor);
            $file->save();
            $function_number = 1;
            // $function_number = $_GET['CKEditorFuncNum'];
            $url = $file->get_paths_for_database();
            $message = '';
            echo "<script>window.parent.CKEDITOR.tools.callFunction('" . $function_number . "','" . $url . "','" . $message . "');</script>";
        }
    }
}
