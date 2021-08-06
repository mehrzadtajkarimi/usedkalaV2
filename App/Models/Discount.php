<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Discount extends MysqlBaseModel
{
    protected $table = 'discounts';

    public function create_discount(array $params)
    {
        return $this->create($params);
    }
    public function read_discount($id = null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->first(['id' => $id]);
    }
    public function update_discount(array $params, $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_discount($id)
    {
        return $this->delete(['id' => $id]);
    }


    public function join_discount__with_category($id)
    {
        return $this->inner_join(
            "discounts.*,
             category_discounts.id AS category_discounts_id,
             category_discounts.category_id",
            "category_discounts",
            "id",
            "discount_id",
            "discounts.id=$id",
        );
    }
}
