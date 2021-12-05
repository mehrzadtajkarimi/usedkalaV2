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

    public function read_rolePermission($role_id = null)
    {
        $permission_id =  $this->get('permission_id', ['role_id' => $role_id]) ?? '';
        return $permission_id ? $this->connection->select('permissions', ['id'], ['id' => $permission_id]) : false;
    }

    public function update_rolePermission($params, $role_id)
    {
        return $this->update($params, ['role_id' => $role_id]);
    }

    public function delete_rolePermission($role_id)
    {
        return $this->delete(['role_id' => $role_id]);
    }



    public function get_permissions($role_id)
    {
        $permission_id =  $this->get('permission_id', ['role_id' => $role_id]) ?? '';
        return $permission_id ? $this->connection->select('permissions', '*', ['id' => $permission_id]) : false;
    }


    public function join_rolePermission_with_roles_by_role_name_and_get_permissions($role_id)
    {
        $permission_ids =  $this->get('permission_id', ['role_id' => $role_id]) ?? '';


        // dd($permission_ids);
        $products =  $this->inner_join_two(
            '*',
            'roles',
            'role_id',
            'id',
            'permissions',
            'permission_id',
            'id',
            "role_permissions.role_id={$role_id}",
        );
        return $products;
    }
}
