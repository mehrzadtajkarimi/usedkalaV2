<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Photo;
use App\Models\User;
use App\Services\Auth\Auth;
use App\Services\Session\SessionManager;
use App\Services\Upload\UploadedFile;
use App\Utilities\FlashMessage;

class ProfileController extends Controller
{
    private $userModel;
    private $photoModel;

    public function __construct()
    {
        parent::__construct();
        $this->userModel = new User();
        $this->photoModel = new Photo();
    }
    public function manege_two_factor()
    {
        if ($this->request->input('sms')) {
            # code...
        }
        if ($this->request->input('email')) {
            # code...
        }
    }

    public function is_login()
    {
        $user_id = SessionManager::get('auth');
        if (Auth::is_login()) {
            $data = array(
                'data' => $this->userModel->join_user_to_photo($user_id),
            );
            return view('Frontend.user.profile', $data);
        }
        return $this->request->redirect('login');
    }

    public function update()
    {
        $params = $this->request->params();

        $user_id = $this->request->get_param('id');


        $params_updated = array(
            'first_name' => $params['profile-name'],
            'last_name'  => $params['profile-family'],
            'phone'      => $params['profile-phone'],
            'email'      => $params['profile-email'],

        );
        $this->userModel->update_user($params_updated, $user_id['id']);

        $files                   = $this->request->files();
        $files_param             = $files['user_image'];
        $check_file_param_exists = !empty($files_param);
        if ($check_file_param_exists) {
            $file       = new UploadedFile($files_param);
            $file_paths = $file->save();
            if ($file_paths) {

                $is_update_photo = $this->photoModel->update_photo('User', $user_id, $file_paths[0], 'user_image');

                if ($is_update_photo) {
                    FlashMessage::add("ویرایش پروفایل با موفقیت انجام شد");
                } else {
                    FlashMessage::add(" مشکلی در ویرایش پروفایل رخ داد ", FlashMessage::ERROR);
                }
            }
        }
        FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('profile');
    }

    public function photo_edit()
    {
        echo 'open modal photo_edit';
    }

}
