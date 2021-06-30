<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Category extends MysqlBaseModel
{
    protected $table = 'categories';


    public  function child()
    {
       return (object) $this->inner_join('categories', 'parent_id', 'id');
    }
}
