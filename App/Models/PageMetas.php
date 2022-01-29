<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class PageMetas extends MysqlBaseModel
{
    protected $table = 'pagemetas';

    public function read_pageMeta($id=null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->find_by_id($id);
    }
    public function update_pageMeta(array $params , $id)
    {
        return $this->update($params, ['id' => $id]);
    }
}
