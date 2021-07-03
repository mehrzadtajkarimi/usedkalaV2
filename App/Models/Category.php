<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Category extends MysqlBaseModel
{
    protected $table = 'categories';



    public $category_array=[];

    public function category_tree($parent_id = 0, $sub_mark = '')
    {
        $get_categories =  $this->get('*', ['parent_id' => $parent_id]);

        if (is_array($get_categories)) {
            foreach ($get_categories as  $value) {

                array_push($this->category_array,   $sub_mark . $value['name']);
                $this->category_tree($value['id'], $sub_mark . ' <b> &#10010; </b> ');
            }
        }
        return $this->category_array;
    }
}
