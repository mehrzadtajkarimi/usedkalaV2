<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;
use App\Utilities\FlashMessage;

class Photo extends MysqlBaseModel
{
    protected $table = 'photos';

    public function create_photo(string $entity_type, int $entity_id, $file_path, string $name)
    {
        return $this->create([
            'entity_type' => $entity_type,
            'entity_id' => $entity_id,
            'path' =>  $file_path,
            'alt' =>  $name,

        ]);
    }

    public function read_photo($id = null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->first(['entity_id' => $id]);
    }
    public function read_photo_by_id($entity_id,$entity_type)
    {
        return $this->get(['entity_id' => $entity_id]);
    }

    public function update_photo(string $entity_type, int $entity_id, $file_path, string $name)
    {
        return $this->update_create([
            'entity_type' => $entity_type,
            'entity_id' => $entity_id,
            'path' =>  $file_path,
            'alt' =>  $name,

        ], ['entity_id' => $entity_id]);
    }

    public function delete_photo($id)
    {
        $categoryModel = $this->delete(['entity_id' => $id]);
        return $categoryModel;
    }
}
