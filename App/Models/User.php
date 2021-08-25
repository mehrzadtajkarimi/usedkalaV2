<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class User extends MysqlBaseModel
{
    protected $table = 'users';

    public function already_exists($param)
    {
        if (isset($param['phone'])) {
            return  $this->first(['phone' => $param['phone']])??null;
        }
        if (isset($param['email'])) {
            return $this->first(['email' => $param['email']])??null;
        }
    }

}
