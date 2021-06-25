<?php

namespace App\Controllers\backend;

use App\Services\Auth\Auth;

class LoginController
{




    public function login()
    {



        global $request;
        return view('backend.user.login', ['request' => $request], true);
    }

    public function is_login()
    {

        global $request;
        $phone_number = $request->input('phone-number');
        $user_id = Auth::login(['phone' => $phone_number]);

        die;
    }
}
