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
        return $this->first(['id' => $id]);
    }
	public function product_brand($id=null)
	{
		if ($id!=null)
			return $this->query("SELECT * FROM `products` as pro INNER JOIN `brands` as brand ON brand.`id` = pro.`brand_id`
			LEFT JOIN `photos` as photo ON photo.`entity_type` = 'Brand' AND photo.`entity_id` = brand.`id`
			WHERE pro.`id` = $id ORDER BY photo.`created_at` DESC LIMIT 0,1");
		else
			return false;
	}
    public function read_product_limit_by_price($start_price, $finish_price)
    {

        return $this->get(
            '*',
            [
                'price[<>]' => [$start_price, $finish_price]
            ],
        );
    }
    public function latest_product()
    {
        return  $this->select(
            '*',
            [
                'ORDER'   => ['created_at' => 'DESC'],
            ]
        );
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
    public function join_product_to_photo()
    {
        return $this->inner_join_order(
            "*",
            "photos",
            "id",
            "entity_id",
            "photos.type=0",
            "photos.entity_type='Product'",
            "products.created_at",
        );
    }
    public function join_product_to_photo__for_latest_product()
    {
        return $this->inner_join_limit(
            "products.*,products.id AS product_id,photos.path,photos.alt",
            "photos",
            "id",
            "entity_id",
            "photos.type=0",
            "photos.entity_type='Product'",
            "3",
            "products.created_at",
        );
    }
    public function join_product_to_photo__for_sale_product()
    {
        return $this->inner_join_sale(
            "products.*,
            products.id AS product_id,
            photos.path,
            photos.alt",
            "photos",
            "id",
            "entity_id",
            "photos.type=0",
            "photos.entity_type='Product'",
            "products.sale=1",
            "20",
        );
    }
    public function join_product_to_photo__for_featured_product()
    {
        return $this->inner_join_featured(
            "*",
            "photos",
            "id",
            "entity_id",
            "photos.type=0",
            "photos.entity_type='Product'",
            "products.featured=1",
            "3",
        );
    }
    public function join_product_to_photo_by_brand_id($brand_id)
    {
        return $this->inner_join_order(
            "*",
            "photos",
            "id",
            "entity_id",
            "photos.type=0",
            "photos.entity_type='Product'",
            "products.created_at",
            "products.brand_id=$brand_id",
        );
    }
    public function join_product_to_photo_by_category_id($category_id)
    {
        return $this->inner_join(
            "products.*,
            photos.path,
            photos.alt",
            "photos",
            "id",
            "entity_id",
            "photos.type=0",
            "photos.entity_type='Product'",
        );
    }
    public function join_product_to_photo_by_id($product_id)
    {
        return $this->inner_join(
            "products.*,
            photos.path,
            photos.alt",
            "photos",
            "id",
            "entity_id",
            "products.id=$product_id",
            "photos.entity_type='Product'",
            "photos.type=0",
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

    public function join_product__with_productDiscounts_discounts($id)
    {
        $exists_productDiscount_by_product_id = (new Product_discount())->read_productDiscount_by_product_id($id);
        if ($exists_productDiscount_by_product_id) {
            return $this->connection->query("
                SELECT
                products.*,
                discounts.title AS discounts_title,
                discounts.percent AS discounts_percent,
                discounts.id AS discounts_id,
                discounts.status AS discounts_status
                FROM products
                INNER JOIN product_discounts
                ON products.id = product_discounts.product_id
                INNER JOIN discounts
                ON product_discounts.discount_id = discounts.id
                AND products.id ={$id['id']}
                ")->fetchAll();
        }
        return false;
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

    public function join_product__with_comment($id)
    {
        return $this->inner_join(
            "*", // column
            "comments",                // -- table categories
            "id",                        // categories.id
            "entity_id",               // products.category_id
            "comments.entity_id=$id",
            "comments.entity_type='Product'",
            "comments.status='1'",
        );
    }
    public function join_product__with_photo_by_brand_id($brand_id)
    {
        return $this->inner_join(
            "products.id ,
             products.title AS product_title,
             photos.path AS photo_path,
             photos.alt AS photo_alt",                 // column
            "photos",                    // -- table photos
            "id",                        // products.id
            "entity_id",                 // photos.entity_id
            "products.brand_id=$brand_id",
            "photos.type=0",
            "photos.entity_type='Product'",
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
    public function join_product__with_single_photo_by_category_id()
    {
        return $this->inner_join(
            "products.*,
            photos.id AS photo_id,
            photos.alt,
            photos.path",                         // column
            "photos",                    // -- table photos
            "id",                        // products.id
            "entity_id",                       // brands.id
            "photos.type=0",
            "photos.entity_type='Product'",
        );
    }
}
