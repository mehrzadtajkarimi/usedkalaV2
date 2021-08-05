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

    public function join_discount__with_category_and_brand_and_photo($id)
    {
        return $this->inner_join_tree(
            "discounts.*,
             photos.path,
             photos.alt,
             categories.name AS category_name,
             brands.name AS brand_name", // column
            "categories",                // -- table categories
            "category_id",               // discounts.category_id
            "id",                        // categories.id
            "brands",                    // -- table brands
            "brand_id",                  // discounts.brand_id
            "id",                        // brands.id
            "photos",                    // -- table photos
            "id",                        // discounts.id
            "entity_id",                 // photos.entity_id
            "discounts.category_id=$id",
            "photos.entity_type='discount'",
        );
    }
    public function join_discount__with_category_and_product($id)
    {
        return $this->inner_join_two(
            "*",
             "category_discounts",
             "id",
             "discount_id",
             "product_discounts",
             "id",
             "discount_id",
            "discounts.id=$id",
        );
    }

}
