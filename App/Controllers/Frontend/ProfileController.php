<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Services\Auth\Auth;

class ProfileController extends Controller
{
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
        $data = array();
        if (Auth::is_login()) {
            return view('Frontend.user.profile',$data);
        }
        return $this->request->redirect('login');
    }

    public function photo_edit()
    {
        echo 'open modal photo_edit';
    }
}
