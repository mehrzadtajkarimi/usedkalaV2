<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Product extends MysqlBaseModel
{
    protected $table = 'products';

    public function create_product($params)
    {
        return $this->create([
            'name'      => $params['product-name'],
            'sort'      => $params['product-sort'],
        ]);
    }
    public function read_product($id=null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->find($id);
    }

    public function update_product($params , $id)
    {
        return $this->update([
            'name'      => $params['product-name'],
            'sort'      => $params['product-sort'],
        ], ['id' => $id]);
    }

    public function delete_product($id)
    {
        return $this->delete(['id' => $id]);
    }
}
