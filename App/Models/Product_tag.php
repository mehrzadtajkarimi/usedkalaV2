<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Product_tag extends MysqlBaseModel
{
    protected $table = 'product_tags';

    public function create_productTag($params)
    {
        return $this->create($params);
    }
    public function replace_productTag(array $params, $id)
    {
        $tag_id = ['tag_id' => $id];
        if (!empty($this->get('*', $tag_id))) {
            $this->delete($tag_id);
        }
        return  $this->create($params);
    }

    public function read_productTag($product_id )
    {
        $tags =  $this->inner_join(
            '*',
            'tags',
            'tag_id',
            'id',
            "product_tags.product_id={$product_id['id']}",
        );
        return $tags;
    }



    public function update_productTag($tag_id, $product_id)
    {
        $this->delete(['product_id' => $product_id]);
        return $this->update_delete(
            [
                'tag_id' => $tag_id,
                'product_id' => $product_id
            ],
            ['product_id' => $tag_id]
        );
    }

    public function read_productTag_by_product_id(int $product_id)
    {
        return $this->has(['product_id' => $product_id]);
    }
    public function delete_productTag_by_product_id(int $product_id)
    {
        return   $this->delete(['product_id' => $product_id]);

    }
}
