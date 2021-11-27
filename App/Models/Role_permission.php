<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Role_permission extends MysqlBaseModel
{
    protected $table = 'role_permissions';
    public function create_rolePermission($params)
    {
        return $this->create($params);
    }

    public function read_rolePermission($role_id=null)
    {
        $permission_id =  $this->get('permission_id', ['role_id' => $role_id]) ?? '';
        return $permission_id ? $this->connection->select('permissions', ['id'], ['id' => $permission_id]) : false;
    }

    public function update_rolePermission($params ,$role_id)
    {
        return $this->update($params, ['role_id' => $role_id]);
    }

    public function delete_rolePermission($role_id)
    {
        return $this->delete(['role_id' => $role_id]);
    }

}
