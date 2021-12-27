<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Province extends MysqlBaseModel
{
    protected $table = 'provinces';

    
    public function read_province($id = null)
    {
        if (is_null($id)) {
            return $this->get_all();
        }
        return $this->first(['id' => $id]);
    }
}
