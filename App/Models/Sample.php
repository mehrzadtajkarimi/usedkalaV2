<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Sample extends MysqlBaseModel
{
    protected $table = 'samples';

    public function create_sample(array $params)
    {
        return $this->create($params);
    }
    public function read_sample($id = null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->first(['id' => $id]);
    }
    public function update_sample(array $params, $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_sample($id)
    {
        return $this->delete(['id' => $id]);
    }


    public function join_sample__with_category($id)
    {
        return $this->inner_join(
            "samples.*,
             category_samples.id AS category_samples_id,
             category_samples.category_id",
            "category_samples",
            "id",
            "sample_id",
            "samples.id=$id",
        );
    }

    public function join_sample__with_productSamples_products_photo()
    {

        return $this->connection->query("
        SELECT

        samples.title AS sample_title,
        products.id AS product_id,
        products.price AS product_price,
        products.title AS product_title,
        photos.path AS photo_path,
        photos.alt AS photo_alt

         FROM samples

        INNER JOIN product_samples
        ON samples.id = product_samples.sample_id
        INNER JOIN products
        ON products.id = product_samples.product_id
        INNER JOIN photos
        ON products.id = photos.entity_id

        AND photos.type=0
        AND photos.entity_type='Product'

        ")->fetchAll();
    }
}
