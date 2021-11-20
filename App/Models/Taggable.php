<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Taggable extends MysqlBaseModel
{
    protected $table = 'taggables';

    public function create_taggable(array $params)
    {
        return $this->create($params);
    }
    public function read_taggable($entity_id=null)
    {
        if (is_null($entity_id)) {
            return $this->all();
        }

        return $this->get('*', [
            'entity_id' => $entity_id,
        ]);
    }
    public function read_taggable_id($id)
    {
        return  $this->get( '*', [
            'id'   => $id,
        ]);
    }
    public function read_taggable_entity($entity_id, $entity_type)
    {
        return  $this->get( '*', [
            'entity_id'   => $entity_id,
            'entity_type' => $entity_type,
        ]);
    }
    public function join_taggable_to_photo_by_limit($limit)
    {
        return $this->connection->query("
        SELECT tags.id AS tag_id , tags.* , photos.* FROM tags
        INNER JOIN photos
        ON tags.id = photos.entity_id
        LIMIT $limit
        ")->fetchAll();
    }
    public function read_taggable_by_key($key = null)
    {
        if (is_null($key)) {
            return $this->all();
        }
        return $this->get('*', ['key' => $key]);
    }

    public function update_taggable(array $params, $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_taggable($id)
    {
        return $this->delete(['entity_id' => $id]);
    }
    public function join_taggable($entity_type , $entity_id)
    {
        $queryStr="
        SELECT * 
        FROM taggables
        INNER JOIN $entity_type
        ON taggables.`entity_id` = $entity_type.`id`
        INNER JOIN tags
        ON taggables.`tag_id` = tags.`id`
        AND $entity_type.`id`='$entity_id'
        ";
        
        return $this->connection->query($queryStr);

    }

}
