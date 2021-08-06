<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Category_discount extends MysqlBaseModel
{
    protected $table = 'category_discounts';

    public function delete_categoryDiscount_by_category_id($category_id)
    {
        return   $this->delete(['discount_id' => $category_id]);
    }
    public function delete_categoryDiscount_by_discount_id($discount_id)
    {
        return   $this->delete(['discount_id' => $discount_id]);
    }
    public function create_categoryDiscount(array $params)
    {
        return  $this->create($params);
    }

    public function read_categoryDiscount($id = null)
    {
        $category_id =  $this->get('category_id', ['discount_id' => $id]) ?? '';
        return $this->connection->select('categories', ['id'], ['id' => $category_id]) ?? false;
    }
}
