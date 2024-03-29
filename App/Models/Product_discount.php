<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Product_discount extends MysqlBaseModel
{
    protected $table = 'product_discounts';
    public function delete_productDiscount_by_category_id($category_id)
    {
        return   $this->delete(['discount_id' => $category_id]);
    }

    public function create_productDiscount(array $params)
    {
        return $this->create( $params);
    }
    public function replace_productDiscount(array $params , $id)
    {
        $discount_id = ['discount_id' => $id];
        if (!empty($this->get('*', $discount_id))) {
            $this->delete($discount_id);
        }
        return  $this->create($params);
    }

    public function read_productDiscount($discount_id = null)
    {
		// var_dump($discount_id);
        $product_id =  $this->get('product_id', ['discount_id' => $discount_id]);
		// var_dump($product_id);
		// die();
        return $this->connection->select('products',['id', 'title'], ['id' => $product_id[0]]);
    }

    public function join__with__productDiscount__product($discount_id = null)
    {
        return $this->inner_join(
            "products.title,products.id",
            "products",
            "product_id",
            "id",
            "product_discounts.discount_id = $discount_id",
        );
        
    }

    public function read_productDiscount_by_product_id( $product_id)
    {
        return $this->has(['product_id' => $product_id]);
    }


}
