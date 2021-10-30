<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Like extends MysqlBaseModel
{
    protected $table = 'likes';

    public function create_like(array $params)
    {
        return $this->create($params);
    }
    public function read_like($id = null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->find_by_id($id);
    }
    public function read_like_by_key($key = null)
    {
        if (is_null($key)) {
            return $this->all();
        }
        return $this->get('*', ['key' => $key]);
    }

    public function update_like(array $params, $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_like($id)
    {
        return $this->delete(['id' => $id]);
    }


}
