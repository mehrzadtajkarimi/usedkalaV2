<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Category_discount extends MysqlBaseModel
{
    protected $table = 'category_discounts';

    public function create_categoryDiscount(array $params)
    {
        return  $this->create($params);
    }
    public function replace_categoryDiscount(array $params, $id)
    {
        $discount_id = ['discount_id' => $id];
        if (!empty($this->get('*', $discount_id))) {
            $this->delete($discount_id);
        }
        return  $this->create($params);
    }
}
