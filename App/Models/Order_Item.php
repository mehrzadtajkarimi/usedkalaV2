<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Order_Item extends MysqlBaseModel
{
    protected $table = 'order_items';

    public function create_orderItem(array $params)
    {
        return $this->create($params);
    }

    public function read_orderItem($id = null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->first(['id' => $id]);
    }
    public function read_orderItem_by_order_id($id)
    {
        return $this->get_all(['order_id' => $id]);
    }
    public function join__orderItem_whit_product_by_order_id($order_id)
    {
        $products = $this->inner_join_two(
            "products.title,
            products.id AS product_id,
            order_items.quantity,
            order_items.price,
            order_items.discount,
            orders.address,
            orders.created_at
            ",
            "orders",
            "order_id",
            "id",
            "products",
            "product_id",
            "id",
            "order_items.order_id=$order_id"
        );

        return $products;


    }

    public function update_orderItem(array $params, $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_orderItem($id)
    {
        return $this->delete(['id' => $id]);
    }
}
