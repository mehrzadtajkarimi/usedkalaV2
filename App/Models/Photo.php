<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;
use App\Utilities\FlashMessage;

class Photo extends MysqlBaseModel
{
    protected $table = 'photos';

    public function create_photo(string $entity_type, int $entity_id, $file_path, string $name)
    {
        $is_create_photo = $this->create([
            'entity_type' => $entity_type,
            'entity_id' => $entity_id,
            'path' =>  $file_path,
            'name' =>  $name,

        ]);
        return $is_create_photo;
    }
    public function update_photo(string $entity_type, int $entity_id, $file_path, string $name)
    {
        $is_create_photo = $this->update_create([
            'entity_type' => $entity_type,
            'entity_id' => $entity_id,
            'path' =>  $file_path,
            'name' =>  $name,

        ],['entity_id'=>$entity_id]);
        return $is_create_photo;
    }

    public function delete_photo($id)
    {
        $categoryModel =$this->delete(['entity_id' => $id]);
        return $categoryModel;
    }
}
