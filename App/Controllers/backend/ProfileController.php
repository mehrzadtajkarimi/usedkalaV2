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
}
