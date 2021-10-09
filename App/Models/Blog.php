<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Blog extends MysqlBaseModel
{
    protected $table = 'blogs';

    public function create_blog(array $params)
    {
        return $this->create($params);
    }
    public function read_blog($id = null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->find_by_id($id);
    }
    public function read_blog_by_key($key = null)
    {
        if (is_null($key)) {
            return $this->all();
        }
        return $this->get('*', ['key' => $key]);
    }

    public function update_blog(array $params, $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_blog($id)
    {
        return $this->delete(['id' => $id]);
    }
    public function join_blog_to_photo()
    {
        return $this->inner_join(
            "blogs.id AS blog_id , blogs.* , photos.*",
            "photos",
            "id",
            "entity_id",
            "photos.entity_type='Blog'",
        );
    }
    public function join_blog_to_photo_by_blog_id($blog_id = null)
    {
        return $this->inner_join(
            "blogs.id AS blog_id , blogs.* , photos.*",
            "photos",
            "id",
            "entity_id",
            "blogs.id=$blog_id",
            "photos.entity_type='Blog'",
        );
    }
}
