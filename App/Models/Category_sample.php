<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Category_sample extends MysqlBaseModel
{
    protected $table = 'category_samples';

    public function delete_categoryDiscount_by_category_id($category_id)
    {
        return   $this->delete(['discount_id' => $category_id]);
    }
    public function delete_categorySample_by_sample_id($discount_id)
    {
        return   $this->delete(['discount_id' => $discount_id]);
    }
    public function create_categorySample(array $params)
    {
        return  $this->create($params);
    }

    public function read_categorySample($id = null)
    {
        $category_id =  $this->get('category_id', ['sample_id' => $id]) ?? '';
        return $this->connection->select('categories', ['id'], ['id' => $category_id]) ?? false;
    }
}
