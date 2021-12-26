<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Product_coupon extends MysqlBaseModel
{
    protected $table = 'product_coupons';

    public function create_productCoupon($params)
    {
        return $this->create($params);
    }
    public function replace_productCoupon(array $params, $id)
    {
        $discount_id = ['discount_id' => $id];
        if (!empty($this->get('*', $discount_id))) {
            $this->delete($discount_id);
        }
        return  $this->create($params);
    }

    public function read_productCoupon($id)
    {
        return  $this->inner_join(
            '*',
            'coupons',
            'coupon_id',
            'id',
            "product_coupons.coupon_id={$id}"   
        );
    }

    public function read_products_by_category_id($category_id = null)
    {
        $products =  $this->inner_join(
            '*',
            'products',
            'product_id',
            'id',
            "product_coupons.category_id={$category_id}",
        );
        return $products;
    }



    public function update_productCoupon($category_id, $product_id)
    {
        $this->delete(['product_id' => $product_id]);
        return $this->update_delete(
            [
                'category_id' => $category_id,
                'product_id' => $product_id
            ],
            ['product_id' => $category_id]
        );
    }

    public function read_productCoupon_by_product_id(int $product_id)
    {
        return $this->has(['product_id' => $product_id]);
    }
    public function delete_productCoupon_by_coupon_id(int $coupon_id)
    {
        return $this->delete(['coupon_id' => $coupon_id]);

    }
}
