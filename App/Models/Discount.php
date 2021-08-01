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
    public function read_discount_by_category($id = null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->get('*', ['category_id' => $id]);
    }

    public function update_discount(array $params, $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_discount($id)
    {
        return $this->delete(['id' => $id]);
    }
    public function join_discount_to_category($id)
    {
        return $this->inner_join(
            "*",
            "categories",
            "category_id",
            "id",
            "discounts.category_id=$id",
        );
    }
    public function join_discount_to_photo($id)
    {
        return $this->inner_join(
            "discounts.*,
            photos.path,
            photos.alt",
            "photos",
            "id",
            "entity_id",
            "discounts.category_id=$id",
            "photos.type=0",
            "photos.entity_type='discount'",
        );
    }
    public function join_discount_to_brand($id)
    {
        return $this->inner_join(
            "*",
            "brands",
            "brand_id",
            "id",
            "discounts.id=$id",
        );
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
    public function join_discount__with_brand_and_photo($id)
    {
        return $this->inner_join_two(
            "discounts.*,
             photos.path,
             photos.alt",                 // column
             "brands",                     // -- table brands
             "brand_id",                   // discounts.brand_id
             "id",                         // brands.id
             "photos",                    // -- table photos
             "id",                        // discounts.id
             "entity_id",                 // photos.entity_id
            "photos.entity_type='discount'",
            "discounts.id=$id",
        );
    }
    public function join_discount__with_brand($id)
    {
        return $this->inner_join(
            "*",                         // column
            "brands",                    // -- table brands
            "brand_id",                  // discounts.brand_id
            "id",                        // brands.id
            "discounts.id=$id",
        );
    }
}
