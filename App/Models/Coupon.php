<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Coupon extends MysqlBaseModel
{
    protected $table = 'coupons';

    public function create_coupon(array $params)
    {
        return $this->create($params);
    }
    public function read_coupon($id = null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->first(['id' => $id]);
    }
    public function is_coupon($code)
    {
        $code= $this->first(['code' => $code]);
        $start_at = strtotime($code['start_at'])<time();
        $finish_at = strtotime($code['finish_at'])>time();

        if($start_at && $finish_at){
            return $code;
        }
        return false;
    }
    public function update_coupon(array $params, $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_coupon($id)
    {
        return $this->delete(['id' => $id]);
    }


    public function join_coupon__with_category($id)
    {
        return $this->inner_join(
            "coupons.*,
            category_coupons.id AS category_coupons_id,
            category_coupons.category_id",
            "category_coupons",
            "id",
            "coupon_id",
            "coupons.id=$id",
        );
    }

    public function join_coupon__with_productCoupons_products_photo()
    {

        return $this->connection->query("
        SELECT

        coupons.title AS coupon_title,
        products.id AS product_id,
        products.price AS product_price,
        products.title AS product_title,
        photos.path AS photo_path,
        photos.alt AS photo_alt

        FROM coupons

        INNER JOIN product_coupons
        ON coupons.id = product_coupons.coupon_id
        INNER JOIN products
        ON products.id = product_coupons.product_id
        INNER JOIN photos
        ON products.id = photos.entity_id

        AND photos.type=0
        AND photos.entity_type='Product'

        ")->fetchAll();
    }
}
