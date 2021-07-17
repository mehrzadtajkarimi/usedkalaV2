<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Product extends MysqlBaseModel
{
    protected $table = 'products';

    public function create_product(array $params)
    {
        return $this->create($params);
    }
    public function read_product($id = null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->first($id);
    }

    public function update_product(array $params, $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_product($id)
    {
        return $this->delete(['id' => $id]);
    }
}
