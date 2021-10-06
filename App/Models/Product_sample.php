<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Product_sample extends MysqlBaseModel
{
    protected $table = 'product_samples';

    public function delete_productSample_by_sample_id($sample_id)
    {
        return   $this->delete(['sample_id' => $sample_id]);
    }
    public function delete_productSample_by_product_id($product_id)
    {
        return   $this->delete(['product_id' => $product_id]);
    }
    public function create_productSample(array $params)
    {
        return  $this->create($params);
    }

    public function read_productSample($id = null)
    {
        $product_id =  $this->get('product_id', ['sample_id' => $id]) ?? '';
        return $this->connection->select('products', ['id'], ['id' => $product_id]) ?? false;
    }
}
