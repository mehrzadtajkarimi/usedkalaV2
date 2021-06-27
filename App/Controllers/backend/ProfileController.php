<?php

namespace App\Controllers\backend;

class ProfileController
{
    public function manege_two_factor()
    {
        global $request;
        if ($request->input('sms')) {
            # code...
        }
        if ($request->input('email')) {
            # code...
        }
    }

    public function index()
    {
        $data = array();
        return view('backend.user.profile',$data);
    }

    public function photo_edit()
    {
        echo 'open modal photo_edit';
    }


}
