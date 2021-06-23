<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class User extends MysqlBaseModel
{
    protected $table='users';


public function already_exists(array  $data)
{
    if ($phone=$data['phone']) {
        return $this->find('phone' , $phone);
    }
    if ($email=$data['email']) {
        return $this->find('email' , $email);
    }
}




}
