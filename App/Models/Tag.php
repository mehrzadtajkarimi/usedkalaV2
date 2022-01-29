<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Tag extends MysqlBaseModel
{
    protected $table = 'tags';

    public function create_tag(array $params)
    {
        return $this->create($params);
    }
    public function read_tag($id=null)
    {
        if (is_null($id)) {
            return $this->get_all();
        }
        return  $this->get( '*', [
            'id'   => $id,
        ]);
    }
    public function read_tag_entity($entity_id, $entity_type)
    {
        return  $this->get( '*', [
            'entity_id'   => $entity_id,
            'entity_type' => $entity_type,
        ]);
    }
    public function join_tag_to_photo_by_limit($limit)
    {
        return $this->connection->query("
        SELECT tags.id AS tag_id , tags.* , photos.* FROM tags
        INNER JOIN photos
        ON tags.id = photos.entity_id
        LIMIT $limit
        ")->fetchAll();
    }
    public function read_tag_by_key($key = null)
    {
        if (is_null($key)) {
            return $this->all();
        }
        return $this->get('*', ['key' => $key]);
    }

    public function update_tag(array $params, $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_tag($id)
    {
        return $this->delete(['id' => $id]);
    }
    public function join_tag_to_photo()
    {
        return $this->inner_join(
            "tags.id AS tag_id , tags.* , photos.*",
            "photos",
            "id",
            "entity_id",
            "photos.entity_type='tag'",
        );
    }

    public function join_tag__with_comment($id)
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
    public function join_tag_to_photo_by_tag_id($tag_id = null)
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
    public function join_tag_to_photo_and_category_tag($category_id = null)
    {
        return $this->inner_join_two(
            "tags.id AS tag_id ,
            category_tags.category_id AS category_tag_id ,
            tags.* ,
            photos.*",
            "photos",
            "id",
            "entity_id",
            "category_tags",
            "id",
            "tag_id",
            "category_tags.category_id={$category_id['id']}",
            "photos.entity_type='tag'",
        );
    }
}
