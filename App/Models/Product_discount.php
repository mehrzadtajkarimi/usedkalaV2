<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Product_discount extends MysqlBaseModel
{
    protected $table = 'product_discounts';

    public function create(array $params)
    {
        return $this->create( $params);
    }
    public function replace(array $params , $id)
    {
        $this->delete(['discount_id'=>$id]);
        return  $this->create($params);
    }

    public function read($id = null)
    {
        $product_id =  $this->get('product_id', ['discount_id' => $id]);
        return $this->connection->select('products',['id', 'title'], ['id' => $product_id]);
    }


}
