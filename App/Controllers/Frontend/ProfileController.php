<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;

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

    public function index()
    {
        $data = array();
        return view('Frontend.user.profile', $data);
    }

    public function photo_edit()
    {
        echo 'open modal photo_edit';
    }
}
