<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Role extends MysqlBaseModel
{
    protected $table = 'roles';

    public function create_role($params)
    {
        return $this->create($params);
    }

    public function read_role($id=null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->first(['id' => $id]);
    }

    public function update_role($params ,$id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_role($id)
    {
        return $this->delete(['id' => $id]);
    }
}
