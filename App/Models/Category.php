<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Category extends MysqlBaseModel
{
    protected $table = 'categories';

    public $property_category_array = [];
    public $children                = [];

    public function category_tree($parent_id = 0, $sub_mark = '')
    {
        $get_categories = $this->get('*', ['parent_id' => $parent_id ]);
        if (is_array($get_categories)) {
            foreach ($get_categories as  $value) {
                array_push(
                    $this->property_category_array,
                    array(
                        'name'   => $sub_mark . $value['name'],
                        'id'     => $value['id'],
                        'parent' => $value['parent_id'],
                        'slug'   => $value['slug'],
                        // 'is_cat' =>  $this->count(['parent_id'=> $value['parent_id']])  ? 'd-block' : 'd-none',
                    )
                );
                $this->category_tree($value['id'], $sub_mark . ' <b> &#10010; </b> ');
            }
        }
        return $this->property_category_array;
    }
}
