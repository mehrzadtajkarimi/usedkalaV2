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

    // public function read_orderItem_get_product_by_order_id($order_id)
    // {
    //     $product_ids =  $this->get(['product_id', 'quantity', 'price'], ['order_id' => $order_id]);
    //     //  دریافت قیمت در حال حاضر از جدول محصول انجام میشود باید از quantity و price و discount
    //     foreach ($product_ids as $key => $value) {
    //         $products[] = $this->connection->select('products', ['title', 'price'], ['id' => $value['product_id']]);
    //     }
    //     return $products;


    // }
    public function join__orderItem_whit_product_by_order_id($order_id)
    {
        $products = $this->inner_join_two(
            "products.title,
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
