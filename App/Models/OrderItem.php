<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class OrderItem extends MysqlBaseModel
{
    protected $table = 'order_items';

    public function create_orderItem(array $params)
    {
        return $this->create($params);
    }

    public function read_orderItem($id = null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->first(['id' => $id]);
    }

    public function read_orderItem_by_order_id($id)
    {
        return $this->get_all(['order_id' => $id]);
    }

    public function update_orderItem(array $params, $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_orderItem($id)
    {
        return $this->delete(['id' => $id]);
    }
}
