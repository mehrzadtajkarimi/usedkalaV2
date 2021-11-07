<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Blog_tag extends MysqlBaseModel
{
    protected $table = 'blog_tags';


    public function create_blogTag($params)
    {
        $this->create($params);
    }

    public function read_tagBlog($id = null)
    {
        $tag_id =  $this->get('tag_id', ['blog_id' => $id]) ?? '';

        return $tag_id ? $this->connection->select('tags', ['id'], ['id' => $tag_id]) : false;
    }

    public function delete_blogTags_by_blog_id($blog_id)
    {
        return   $this->delete(['blog_id' => $blog_id]);
    }
}
