<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Product_discount extends MysqlBaseModel
{
    protected $table = 'product_discounts';

    public function create_productDiscount(array $params)
    {
        return $this->create( $params);
    }
    public function replace_productDiscount(array $params , $id)
    {
        $discount_id = ['discount_id' => $id];
        if (!empty($this->get('*', $discount_id))) {
            $this->delete($discount_id);
        }
        return  $this->create($params);
    }

    public function read_productDiscount($id = null)
    {
        $product_id =  $this->get('product_id', ['discount_id' => $id]);
        return $this->connection->select('products',['id', 'title'], ['id' => $product_id]);
    }


}
