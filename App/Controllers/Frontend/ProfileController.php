<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Photo;
use App\Models\User;
use App\Services\Auth\Auth;
use App\Services\Basket\Basket;
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


        $cart_items = Basket::items();


        foreach ($cart_items as  $value) {
            $cart_total[] = $value['count'] * $value['price'];
        }
        // if (!is_array($cart_total)) {
        //     $this->request->redirect('profile');
        // }
        // dd($user_id);
        
        if (Auth::is_login()) {
            $data = array(
                'data' => $this->userModel->join_user_to_photo($user_id),
                'cart_total' => array_sum($cart_total ?? []),
                'cart_items' => $cart_items
            );
            return view('Frontend.user.profile', $data);
        }
        return $this->request->redirect('login');
    }

    public function update()
    {
        $id = $this->request->get_param('id');
        $params = $this->request->params();
        $files = $this->request->files();
        $files_param             = $files['profile_image'];
        $files_param_tmp_name    = $files_param['tmp_name'];
        $check_file_param_exists = !empty($files_param_tmp_name[0]);
        if ($check_file_param_exists) {
            $file = new UploadedFile($files_param);
            $file_paths = $file->save();
            if ($file_paths) {
                $is_update_photo = $this->photoModel->update_photo('User', $id['id'], $file_paths[0], 'profile_image');

                if ($is_update_photo) {
                    FlashMessage::add("ویرایش اطلاعات کاربری با موفقیت انجام شد.");
                } else {
                    FlashMessage::add(" مشکلی در ویرایش اطلاعات کاربری رخ داد. ", FlashMessage::ERROR);
                }
            }
        } else {
            $this->userModel->update_user([
                'first_name' => $params['profile-name'],
                'last_name'  => $params['profile-family'],
                'phone'      => $params['profile-phone'],
                'email'      => $params['profile-email'],
                'address'    => $params['profile-address'],
            ], $id['id']);
            FlashMessage::add("مقادیر  با موفقیت ذخیره شد.");
        }
        return $this->request->redirect('profile');
    }

    public function photo_edit()
    {
        echo 'open modal photo_edit';
    }
}
