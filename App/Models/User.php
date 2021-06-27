<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class User extends MysqlBaseModel
{
    protected $table = 'users';


    public function already_exists(array  $data)
    {
        if ($phone = $data['phone']) {
            return  $this->first(['phone' => $phone]);
        }

        if ($email = $data['email']) {
            return $this->first(['email' => $email]);
        }
    }

    public function photo()
    {
        return $this->has_one(Phone::class);
    }
}
