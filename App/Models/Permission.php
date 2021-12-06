<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;
use App\Utilities\FlashMessage;

class Permission extends MysqlBaseModel
{
    protected $table = 'permissions';

    public function create_permission($params)
    {
        return $this->create($params);
    }

    public function read_permission($id=null)
    {
        if (is_null($id)) {
            return $this->get_order_asc();
        }
        return $this->first(['id' => $id]);
    }

    public function update_permission($params ,$id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_permission($id)
    {
        return $this->delete(['id' => $id]);
    }


}
