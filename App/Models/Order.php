<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;
use Medoo\Medoo;

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
    public function get_orders($as, $to, $total)
    {
        if ($total == 'all') {
            return  $this->connection->select($this->table, ["grand_total", "discount_total", "user_full_name", "address", "created_at"], [
                "created_at[<>]" => [$as, $to],
            ]);
        }
        if ($total == 'discount_total') {
            return  $this->connection->select($this->table, ["grand_total", "discount_total", "user_full_name", "address", "created_at"], [
                "created_at[<>]"    => [$as, $to],
                "discount_total[!]" => 0,
            ]);
        }
        if ($total == 'grand_total') {
            return  $this->connection->select($this->table, ["grand_total", "discount_total", "user_full_name", "address", "created_at"], [
                "created_at[<>]" => [$as, $to],
                "discount_total" => 0,
            ]);
        }
    }
    public function read_order_between($as, $to)
    {
        // dd($as, $to);
        return  $this->connection->select($this->table, ["grand_total", "discount_total", "user_full_name", "address", "created_at"], [
            "created_at[<>]" => [$as, $to]
        ]);
        // WHERE age BETWEEN 200 AND 500
    }
    public function count_order()
    {
        return  $this->connection->count($this->table, "id");
    }
    public function read_avg_grand()
    {
        return  $this->connection->avg($this->table, "grand_total");
    }
    public function read_avg_discount()
    {
        return  $this->connection->avg($this->table, "discount_total");
    }
    public function read_max_total()
    {
        return  $this->connection->max($this->table, "grand_total");
    }
    public function read_max_discount()
    {
        return  $this->connection->max($this->table, "discount_total");
    }
    public function read_min_total()
    {
        return  $this->connection->min($this->table, "grand_total");
    }

    public function comparison($comparison, $total = 'grand_total')
    {
        return  $this->connection->sum($this->table, $total, [
            "created_at[<>]" => [$comparison['to'], $comparison['as']]
        ]);
    }



    public function read_order_by_user_id($user_id, $id = null)
    {
        if (is_null($id)) {
            return $this->get('*', ['user_id' => $user_id]);
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
