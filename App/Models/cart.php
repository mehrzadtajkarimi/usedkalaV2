<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Cart extends MysqlBaseModel
{
    protected $table = 'carts';

    public function create_cart(array $params)
    {
        return $this->create($params);
    }
    public function read_cart($id = null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->first(['id' => $id]);
    }
    public function update_cart(array $params, $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_cart($id)
    {
        return $this->delete(['id' => $id]);
    }


    public function join_cart__with_category($id)
    {
        return $this->inner_join(
            "carts.*,
             category_carts.id AS category_carts_id,
             category_carts.category_id",
            "category_carts",
            "id",
            "cart_id",
            "carts.id=$id",
        );
    }

}
