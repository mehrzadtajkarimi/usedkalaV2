<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Related extends MysqlBaseModel
{
    protected $table = 'relateds';

    public function create_related(array $params)
    {
        return $this->create($params);
    }
    public function read_related($id = null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->first(['id' => $id]);
    }
    public function update_related(array $params, $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_related($id)
    {
        return $this->delete(['id' => $id]);
    }

    public function get_related_by_entity_id($entity)
    {
        return $this->get("*", $entity);
    }

    public function update_related_by_entity_id(array $params, $id)
    {
        return $this->update($params, ['entity_id' => $id]);
    }

    public function delete_related_by_entity_id($id)
    {
        return $this->delete(['entity_id' => $id]);
    }
}
