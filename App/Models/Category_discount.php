<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Category_discount extends MysqlBaseModel
{
    protected $table = 'category_discounts';

    public $property_category_tree_for_backend  = [];
    public $property_category_tree_for_frontend = [];
    public $children                            = [];

    public function create(array $params)
    {
        return   $this->create($params);
    }
    public function replace(array $params, $id)
    {
        $this->delete(['discount_id' => $id]);
        return  $this->create($params);
    }
}
