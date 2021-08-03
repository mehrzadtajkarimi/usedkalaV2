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
    public function create_productDiscount(array $params)
    {
        $this->connection->insert('product_discounts', $params);
        return  $this->connection->id();
    }
    public function update_productDiscount(array $params , $id)
    {
        return  $this->connection->update('product_discounts', $params,$id);
    }
    public function read_product($id = null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->first(['id' => $id]);
    }
    public function read_productDiscount_by_id($id = null)
    {
        $product_id =  $this->connection->select('product_discounts', 'product_id', ['discount_id' => $id]);
        return $this->get(['id', 'title'], ['id' => $product_id]);
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
            "*",
            "categories",
            "category_id",
            "id",
            "products.category_id=$id",
        );
    }
    public function join_product_to_photo($id)
    {
        return $this->inner_join(
            "products.*,
            photos.path,
            photos.alt",
            "photos",
            "id",
            "entity_id",
            "products.category_id=$id",
            "photos.type=0",
            "photos.entity_type='Product'",
        );
    }
    public function join_product_to_brand($id)
    {
        return $this->inner_join(
            "*",
            "brands",
            "brand_id",
            "id",
            "products.id=$id",
        );
    }
    public function join_product__with_category_and_brand_and_photo($id)
    {
        return $this->inner_join_tree(
            "products.*,
             photos.path,
             photos.alt,
             categories.name AS category_name,
             brands.name AS brand_name", // column
            "categories",                // -- table categories
            "category_id",               // products.category_id
            "id",                        // categories.id
            "brands",                    // -- table brands
            "brand_id",                  // products.brand_id
            "id",                        // brands.id
            "photos",                    // -- table photos
            "id",                        // products.id
            "entity_id",                 // photos.entity_id
            "products.category_id=$id",
            "photos.entity_type='Product'",
        );
    }
    public function join_product__with_brand_and_photo($id)
    {
        return $this->inner_join_two(
            "products.*,
             photos.path,
             photos.alt",                 // column
            "brands",                     // -- table brands
            "brand_id",                   // products.brand_id
            "id",                         // brands.id
            "photos",                    // -- table photos
            "id",                        // products.id
            "entity_id",                 // photos.entity_id
            "photos.entity_type='Product'",
            "products.id=$id",
        );
    }
    public function join_product__with_brand($id)
    {
        return $this->inner_join(
            "*",                         // column
            "brands",                    // -- table brands
            "brand_id",                  // products.brand_id
            "id",                        // brands.id
            "products.id=$id",
        );
    }
}
