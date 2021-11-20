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
    public function join_taggable_to_photo()
    {
        return $this->inner_join(
            "tags.id AS tag_id , tags.* , photos.*",
            "photos",
            "id",
            "entity_id",
            "photos.entity_type='tag'",
        );
    }

    public function join_taggable__with_comment($id)
    {
        return $this->inner_join(
            "*", // column
            "comments",                // -- table categories
            "id",                        // categories.id
            "entity_id",               // products.category_id
            "comments.entity_id=$id",
            "comments.entity_type='tag'",
            "comments.status='1'",
        );
    }
    public function join_taggable_to_photo_by_taggable_id($tag_id = null)
    {
        return $this->inner_join(
            "tags.id AS tag_id , tags.* , photos.*",
            "photos",
            "id",
            "entity_id",
            "tags.id={$tag_id['id']}",
            "photos.entity_type='tag'",
        );
    }
    public function join_taggable_to_photo_and_category_taggable($category_id = null)
    {
        return $this->inner_join_two(
            "tags.id AS tag_id ,
            category_taggables.category_id AS category_taggable_id ,
            tags.* ,
            photos.*",
            "photos",
            "id",
            "entity_id",
            "category_taggables",
            "id",
            "tag_id",
            "category_taggables.category_id={$category_id['id']}",
            "photos.entity_type='tag'",
        );
    }
}
