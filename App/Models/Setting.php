<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Setting extends MysqlBaseModel
{
    protected $table = 'settings';

    public function create_setting( array $params)
    {
        return $this->create($params);
    }
    public function read_setting($id=null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->find($id);
    }

    public function update_setting(array $params , $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_setting($id)
    {
        return $this->delete(['id' => $id]);
    }


    public function join_setting_to_photo()
    {
        return $this->inner_join(
            "*",
            "photos",
            "id",
            "entity_id",
            "photos.type=0",
            "photos.entity_type='Setting'",
        );
    }

}
