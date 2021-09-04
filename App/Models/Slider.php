<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Slider extends MysqlBaseModel
{
    protected $table = 'sliders';

    public function create_slider(array $params)
    {
        return $this->create($params);
    }
    public function read_slider($id = null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->first(['id' => $id]);
    }
    public function update_slider(array $params, $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_slider($id)
    {
        return $this->delete(['id' => $id]);
    }



}
