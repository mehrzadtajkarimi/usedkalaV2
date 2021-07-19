<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Product extends MysqlBaseModel
{
    protected $table = 'products';

    public function create_product(array $params)
    {
        return $this->create($params);
    }
    public function read_product($id = null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->first($id);
    }
    public function read_product_by_category($id = null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->get('*', ['category_id' => $id]);
    }

    public function update_product(array $params, $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_product($id)
    {
        return $this->delete(['id' => $id]);
    }
    public function join_product_to_category($id)
    {
        return $this->inner_join(
            "categories",
            "category_id",
            "id",
            "products.category_id=$id",
        );
    }
    public function join_product_to_photo($id)
    {
        return $this->inner_join(
            "photos",
            "id",
            "entity_id",
            "products.id=$id",
            "photos.entity_type='Product'"
        );
    }
    public function join_product_to_brand($id)
    {
        return $this->inner_join(
            "brands",
            "brand_id",
            "id",
            "products.id=$id",
        );
    }
    public function two_join_product_to_photo($id)
    {
        return $this->inner_join_two(
            "photos",
            "id",
            "entity_id",
            "brands",
            "brand_id",
            "id",
            "products.id=$id",
        );
    }
}
