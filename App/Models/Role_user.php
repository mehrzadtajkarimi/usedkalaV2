<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Role_user extends MysqlBaseModel
{
    protected $table = 'role_users';

    public function create_roleUser($params)
    {
        return $this->create($params);
    }

    public function read_roleUser($id=null)
    {
        $permission_id =  $this->get('permission_id', ['role_id' => $id]) ?? '';
        return $permission_id ? $this->connection->select('permissions', ['id'], ['id' => $permission_id]) : false;
    }

    public function exist_roleUser($param,$user_id)
    {
        if (isset($param)) {
            # code...
            foreach ($param as  $role_id) {
    
               $result =+ $this->count([
                    'role_id' => $role_id,
                    'user_id' => $user_id,
                ]);
            }
            return $result;
        }
        return false;
    }

    public function update_roleUser($params ,$role_id)
    {
        return $this->update($params, ['role_id' => $role_id]);
    }

    public function delete_roleUser($id)
    {
        return $this->delete(['id' => $id]);
    }

    public function join_roleUser_role($id)
    {
        return $this->inner_join(
            'roles.name,roles.label,role_users.id',
            'roles',
            'role_id',
            'id',
            "role_users.user_id=$id"
        );
    }

}
