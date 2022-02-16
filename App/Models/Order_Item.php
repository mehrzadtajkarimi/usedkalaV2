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

    public function read_orderItemDisc()
    {
        return $this->get('*', ['discount', '>', 0]);
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
            orders.coupon_id,
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

    public function join__orderItem_whit_product_sort($date, $limit_at = null)
    {
        $as = $date['as'];
        $ta = $date['to'];

        $query = "
        SELECT
        products.slug AS product_slug,
        products.title AS product_name,
        products.id AS product_id,
        products.price AS product_price,
        sum(order_items.price) AS grand_total,
        sum(order_items.quantity) AS quantity_total,
        count(order_items.id) AS count_order_items
        FROM order_items
        INNER JOIN products
        ON order_items.product_id = products.id
        WHERE order_items.created_at <= '$as' AND order_items.created_at >= '$ta'
        GROUP BY order_items.product_id
        ORDER BY grand_total DESC
    ";

        if ($limit_at != null) {
            $query = $query . " LIMIT $limit_at";
        }

        return $this->query($query);
    }

    public function join__orderItem_whit_product()
    {
        $products = $this->inner_join(
            "*",
            "products",
            "product_id",
            "id",
        );

        return $products;
    }

    public function comparison($limit, $comparison)
    {

        $as = $comparison['as'];
        $ta = $comparison['to'];
        $result = $this->query("
                SELECT
                products.id AS product_id,
                products.title AS product_name,
                sum(order_items.price) AS grand_total
                FROM order_items
                INNER JOIN products
                ON order_items.product_id = products.id
                WHERE order_items.created_at BETWEEN '$ta' AND '$as'
                GROUP BY order_items.product_id
                ORDER BY order_items.price DESC
                LIMIT $limit
                ");
        // return array_column($result, 'product_id','grand_total');
        // return array_column($result, 'grand_total','product_name');

        return array_column($result, 'grand_total', 'product_id');
    }

    public function update_orderItem(array $params, $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_orderItem($id)
    {
        return $this->delete(['id' => $id]);
    }

    public function read_order_item_between($comparison)
    {
        $as = $comparison['as'];
        $ta = $comparison['to'];
        return  $this->connection->sum(
            $this->table,
            "price",
            [
                "created_at[<>]" => [$ta, $as]
            ]
        );
    }
}
