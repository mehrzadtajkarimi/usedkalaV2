<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class City extends MysqlBaseModel
{
    protected $table = 'cities';

    public function read_city($id = null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->first(['id' => $id]);
    }

    public function join_city__with_province()
    {

        return $this->inner_join("*",'provinces','province_id','id');
    }
}
