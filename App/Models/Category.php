<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Category extends MysqlBaseModel
{
    protected $table = 'categories';

    public $property_category_tree_for_backend  = [];
    public $property_category_tree_for_frontend = [];
    public $children                            = [];

    public function category_tree_for_backend($parent_id = 0, $sub_mark = '')
    {
        $get_categories = $this->get('*', ['parent_id' => $parent_id]);
        if (is_array($get_categories)) {
            foreach ($get_categories as  $value) {
                array_push(
                    $this->property_category_tree_for_backend,
                    array(
                        'name'   => $sub_mark . $value['name'],
                        'id'     => $value['id'],
                        'parent' => $value['parent_id'],
                        'slug'   => $value['slug'],
                        // 'is_cat' =>  $this->count(['parent_id'=> $value['parent_id']])  ? 'd-block' : 'd-none',
                    )
                );
                $this->category_tree_for_backend($value['id'], $sub_mark . ' <b> &#10010; </b> ');
            }
        }
        return $this->property_category_tree_for_backend;
    }

    public function category_tree_for_frontend($parent_id = 0,$slug=NULL)
    {
        global $request;
        $value = $this->inner_join("categories.*,photos.path,photos.alt", "photos", "id", "entity_id", "categories.parent_id={$parent_id}",  "categories.id=photos.entity_id");
        if (!empty($value)) {
            array_push(
                $this->property_category_tree_for_frontend,
                array(
                    'name'        => $value[0]['name'],
                    'id'          => $value[0]['id'],
                    'parent'      => $value[0]['parent_id'],
                    'slug'        => $value[0]['slug'],
                    'path'        => $value[0]['path'],
                    'alt'         => $value[0]['alt'],
                    'description' => $value[0]['description'],
                )
            );
            return $this->property_category_tree_for_frontend;
        } else {

            return $request::redirect("product/category/$parent_id/$slug");
        }
    }


    public function create_category(array $params)
    {
        return $this->create($params);
    }
    public function create_categoryDiscount(array $params)
    {
        $this->connection->insert('category_discounts', $params);
        return  $this->connection->id();
    }
    public function replace_categoryDiscount(array $params, $id)
    {
       $this->connection->delete('category_discounts', ['discount_id'=>$id]);
        return  $this->connection->insert('category_discounts', $params);
    }
    public function read_category($id = null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->first(['id' => $id]);
    }

    public function update_category(array $params, $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_category($id)
    {
        return $this->delete(['id' => $id]);
    }
    public function join_category_to_photo($id)
    {
        return $this->inner_join(
            "categories.id AS categories_id , categories.* , photos.*",
            "photos",                      // -- table photos
            "id",                          // categories.id
            "entity_id",                   // photos.entity_id
            "categories.id = $id",
            "photos.entity_type='Category'",

        );
    }
    public function left_join_category_to_photo($id)
    {
        return $this->left_join(
            "categories.id AS categories_id , categories.* , photos.*",
            "photos",                      // -- table photos
            "id",                          // categories.id
            "entity_id",                   // photos.entity_id
            "categories.id = $id",
            "photos.entity_type='Category'",

        );
    }
}
