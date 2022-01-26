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
    public function read_discount_all($id = null)
    {
        if (is_null($id)) {
            return $this->get_all();
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

    public function join_discount__with_productDiscounts_products_photo()
    {

        return $this->connection->query("
        SELECT

        discounts.title AS discount_title,
        products.id AS product_id,
        products.price AS product_price,
        products.title AS product_title,
        photos.path AS photo_path,
        photos.alt AS photo_alt

        FROM discounts

        INNER JOIN product_discounts
        ON discounts.id = product_discounts.discount_id
        INNER JOIN products
        ON products.id = product_discounts.product_id
        INNER JOIN photos
        ON products.id = photos.entity_id

        AND photos.type=0
        AND photos.entity_type='Product'

        ")->fetchAll();
    }
}
