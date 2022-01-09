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
    public function read_product_all($id = null)
    {
        if (is_null($id)) {
            return $this->get_all();
        }
        return $this->first(['id' => $id]);
    }
    public function product_brand($id = null)
    {
        if ($id != null)
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

    public function update_product(array $params, $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_product($id)
    {
        return $this->delete(['id' => $id]);
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
        // return $this->inner_join_limit(
            // "products.*,products.id AS product_id,photos.path,photos.alt",
            // "photos",
            // "id",
            // "entity_id",
            // "photos.type=0",
            // "photos.entity_type='Product'",
            // "3",
            // "products.created_at",
        // );
		return $this->query("SELECT pro.*, img.`path`, img.`alt`, pro.`id` as product_id FROM `products` as pro INNER JOIN `photos` as img
			ON pro.`id` = img.`entity_id` WHERE img.`entity_type` = 'Product' AND img.`type` = 0 ORDER BY pro.`created_at` DESC LIMIT 0, 3");
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
        // return $this->inner_join(
        //     "*",
        //     "photos",
        //     "id",
        //     "entity_id",
        //     "photos.type=0",
        //     "photos.entity_type='Product'",
        //     "products.brand_id=$brand_id",
        // );
        return $this->query("SELECT * FROM `products` as pro INNER JOIN `photos` as img
            ON img.`entity_id` = pro.`id` AND img.`entity_type` = 'Product' AND img.`type` = 0
            WHERE pro.`brand_id` = '$brand_id'");
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
    public function join_product_to_photo__with_productDiscounts_discounts()
    {
        return $this->connection->query("
        SELECT
        products.*,
        discounts.title AS discounts_title,
        discounts.percent AS discounts_percent,
        discounts.id AS discounts_id,
        discounts.status AS discounts_status,
        photos.path AS photos_path,
        photos.alt AS photos_alt
        FROM products
        INNER JOIN photos
        ON products.id = photos.entity_id
        INNER JOIN product_discounts
        ON products.id = product_discounts.product_id
        INNER JOIN discounts
        ON product_discounts.discount_id = discounts.id
        AND photos.entity_type ='Product'
        ")->fetchAll();
    }
    public function join_product_to_single_photo__with__productDiscounts_discounts__productCategory_by_category_id($id)
    {
        return $this->connection->query("
        SELECT
        products.*,
        discounts.percent AS discounts_percent,
        photos.path AS photos_path,
        photos.alt AS photos_alt
        FROM products
        INNER JOIN photos
        ON products.id = photos.entity_id
        LEFT JOIN product_discounts
        ON products.id = product_discounts.product_id
        LEFT JOIN discounts
        ON product_discounts.discount_id = discounts.id
        INNER JOIN product_categories
        ON products.id = product_categories.product_id
        AND photos.entity_type ='Product'
        AND product_categories.category_id =$id
        AND photos.type =0
        ")->fetchAll();
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

    public function join_product__with_productDiscounts_discounts()
    {
        return $this->connection->query("
                SELECT
                products.id AS product_id,
                discounts.percent AS discount_percent,
                discounts.status AS discount_status
                FROM products
                INNER JOIN product_discounts
                ON products.id = product_discounts.product_id
                INNER JOIN discounts
                ON product_discounts.discount_id = discounts.id
                ")->fetchAll() ?? FALSE;
    }

    public function join_product__with_productDiscounts_discounts_by_product_id($id)
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
                AND products.id ={$id}
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

    public function join_product__with_comment_and_like($id)
    {
        // return $this->inner_join_two(
        //     "*", // column
        //     "comments",                // -- table categories
        //     "id",                        // categories.id
        //     "entity_id",               // products.category_id
        //     "likes",                // -- table categories
        //     "id",                        // categories.id
        //     "entity_id",               // products.category_id
        //     "comments.entity_id=$id",
        //     "comments.entity_type='Product'",
        //     "comments.status='1'",
        //     "likes.entity_id=$id",
        //     "likes.entity_type='Product'",
        // );
        return $this->query("SELECT * FROM `products` as `pros` INNER JOIN `comments` as `comments`
        ON `comments`.`entity_id` = pros.`id` WHERE `comments`.`entity_type` = 'Product' AND 
        `comments`.`status` = 1 AND pros.`id` = '$id'");
    }
    public function join_product__with_photo_by_brand_id($brand_id)
    {
        // return $this->inner_join(
        //     "products.id ,
        //      products.slug,
        //      products.price,
        //      products.title AS product_title,
        //      photos.path AS photo_path,
        //      photos.alt AS photo_alt",                 // column
        //     "photos",                    // -- table photos
        //     "id",                        // products.id
        //     "entity_id",                 // photos.entity_id
        //     "products.brand_id=$brand_id",
        //     "photos.type=0",
        //     "photos.entity_type='Product'",
        // );
        return $this->query("SELECT pros.*,img.`path`,img.`alt` FROM `products` as `pros` INNER JOIN `photos` as `img`
        ON `img`.`entity_id` = pros.`id` AND `img`.`entity_type` = 'Product' AND 
        `img`.`type` = 0 WHERE pros.brand_id=$brand_id");
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
    public function join_product__with_single_photo_by_category_id($id = 0)
    {
        return $this->query("
        SELECT
        products.*,
        photos.path AS photos_path,
        photos.alt AS photos_alt
        FROM products
        INNER JOIN product_categories
        ON product_categories.product_id = products.id
        INNER JOIN photos
        ON photos.entity_id = products.id
        AND photos.type = 0
        AND photos.entity_type = 'Product'
        AND product_categories.category_id = $id");
    }

    public function search_product_by_name($name)
    {
        return $this->get('*', ['title[~]' => $name]);
    }

    public function join_products_to_categories_by_cat_id($cat_id, $title)
    {
        return $this->query("SELECT pros.*, pix.path, pix.alt FROM `products` as pros
            INNER JOIN `product_categories` as rels INNER JOIN `photos` as pix 
            ON rels.`product_id` = pros.`id` AND pix.`entity_id` = pros.`id`
            WHERE pix.type = 0 AND pix.`entity_type` = 'Product' AND rels.`category_id` = '$cat_id' AND pros.`title` LIKE '%" . $title . "%' ");
    }
}
