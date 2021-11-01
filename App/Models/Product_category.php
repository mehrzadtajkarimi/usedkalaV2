<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Product_category extends MysqlBaseModel
{
    protected $table = 'product_categories';

    public function create_productCategories($params)
    {
        return $this->create($params);
    }
    public function replace_productCategories(array $params, $id)
    {
        $discount_id = ['discount_id' => $id];
        if (!empty($this->get('*', $discount_id))) {
            $this->delete($discount_id);
        }
        return  $this->create($params);
    }

    public function read_productCategories($product_id = null)
    {
        $category_id =  $this->get('category_id', ['product_id' => $product_id]);

        foreach ($category_id as $value) {
            $categories[] =$this->connection->select('categories', ['id', 'name'], ['id' => $value])[0];
        }

        return $categories;
    }



    public function update_productCategories($category_id, $product_id)
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

    public function read_productCategories_by_product_id(int $product_id)
    {
        return $this->has(['product_id' => $product_id]);
    }
    public function delete_productCategories_by_product_id(int $product_id)
    {
        return   $this->delete(['product_id' => $product_id]);

    }
}
