<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class StaticPages extends MysqlBaseModel
{
    protected $table = 'staticpages';

    public function create_staticPages( array $params)
    {
        return $this->create($params);
    }
    public function read_staticPages($id=null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->find_by_id($id);
    }
    public function get_staticPages($key)
    {
        return $this->get('value',['key'=>$key])[0];
    }
    public function read_staticPages_by_slug($slug=null)
    {
        if (is_null($slug)) {
            return false;
        }
        return $this->get('*',['slug'=>$slug]);
    }
    public function read_staticPages_by_key($key=null)
    {
        if (is_null($key)) {
            return $this->all();
        }
        return $this->get('*',['key'=>$key]);
    }
    public function update_staticPages(array $params , $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_staticPages($id)
    {
        return $this->delete(['id' => $id]);
    }




}
