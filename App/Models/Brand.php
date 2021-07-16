<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Brand extends MysqlBaseModel
{
    protected $table = 'brands';

    public function create_brand($params)
    {
        return $this->create([
            'name'      => $params['brand-name'],
            'sort'      => $params['brand-sort'],
        ]);
    }
    public function read_brand($id=null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->find($id);
    }

    public function update_brand($params , $id)
    {
        return $this->update([
            'name'      => $params['brand-name'],
            'sort'      => $params['brand-sort'],
        ], ['id' => $id]);
    }

    public function delete_brand($id)
    {
        return $this->delete(['id' => $id]);
    }

}
