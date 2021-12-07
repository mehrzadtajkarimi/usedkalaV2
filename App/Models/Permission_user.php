<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;
use App\Utilities\FlashMessage;

class Permission_user extends MysqlBaseModel
{
    protected $table = 'permission_users';

    public function create_permissionUser($params)
    {
        return $this->create($params);
    }

    public function read_permissionUser($id)
    {
        return $this->first(['id' => $id]);
    }

    public function has_permissionUser($where)
    {
        return $this->has($where) ? FALSE : TRUE;
    }
    public function has_permission($user_id)
    {
        return $this->has(['user_id' => $user_id]);
    }
    public function exist_permissionUser($param, $user_id)
    {
        foreach ($param as  $permission_id) {
            $result = +$this->count([
                'permission_id' => $permission_id,
                'user_id'       => $user_id,
            ]);
        }
        return $result;
    }

    public function update_permissionUser($params, $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_permissionUser($id)
    {
        return $this->delete(['id' => $id]);
    }
    public function join_permissionUser_permission($id)
    {
        return $this->inner_join(
            'permissions.name,permissions.label,permission_users.id',
            'permissions',
            'permission_id',
            'id',
            "permission_users.user_id=$id"
        );
    }
}
