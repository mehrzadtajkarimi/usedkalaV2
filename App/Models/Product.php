<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Product extends MysqlBaseModel
{
    protected $table = 'products';

    public function read_product()
    {
        return $this->get('*');
    }
}
