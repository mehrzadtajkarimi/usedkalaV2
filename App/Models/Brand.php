<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Brand extends MysqlBaseModel
{
    protected $table = 'brands';

    public function create_brand( array $params)
    {
        return $this->create($params);
    }
    public function read_brand($id=null)
    {
        if (is_null($id)) {
            return $this->get_all();
        }
        return $this->find($id);
    }

    public function update_brand(array $params , $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_brand($id)
    {
        return $this->delete(['id' => $id]);
    }

}
