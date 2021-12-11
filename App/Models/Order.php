<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Order extends MysqlBaseModel
{
    protected $table = 'orders';

    public function create_order(array $params)
    {
        return $this->create($params);
    }

    public function read_order($id = null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->first(['id' => $id]);
    }

    
    public function read_order_by_user_id($user_id, $id = null)
    {
        if (is_null($id)) {
            return $this->get('*',['user_id' => $user_id]);
        }
        return $this->get_all(['user_id' => $user_id, 'id' => $id]);
    }

    public function update_order(array $params, $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_order($id)
    {
        return $this->delete(['id' => $id]);
    }
}
