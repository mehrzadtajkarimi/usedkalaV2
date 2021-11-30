<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;
use App\Utilities\FlashMessage;

class User extends MysqlBaseModel
{
    protected $table = 'users';

    public function join_user_to_active_codes($id, $token)
    {
        return $this->inner_join(
            "*",
            "active_codes",
            "id",
            "user_id",
            "users.id=$id",
            "active_codes.code=$token",
        );
    }
    public function already_exists($param)
    {
        if (isset($param['phone'])) {
            return  $this->first(['phone' => $param['phone']]) ?? null;
        }
        if (isset($param['email'])) {
            return $this->first(['email' => $param['email']]) ?? null;
        }
    }
    public function read_user($id= null)
    {
        if (is_null($id)) {
            return $this->get('*',[
                'user_level[>]'=> 0
            ]);
        }
        return $this->first(['id' => $id]);
    }

    public function is_admin($user_id = null)
    {
        if (is_null($user_id)) {
            return $this->get('*', [
                'user_level' =>  0
            ]);
        }
        if ($user = $this->first(['id' => $user_id])) {

            return $user['user_level'] == 0 ?: FlashMessage::add("  لطفا از ادمین سایت بخواهید دسترسی به پنل  را برای شما ایجاد کند! ", FlashMessage::WARNING);
        }
    }
    public function get_admin($user_id)
    {
        return $this->first([
            'user_level' => 0,
            'id'         => $user_id
        ]);
    }


    public function update_user(array $params, $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function join_user_to_photo(int $user_id)
    {
        return $this->inner_join(
            "photos.*,users.*,users.id AS user_id",
            "photos",
            "id",
            "entity_id",
            "users.id=$user_id",
            "photos.type=0",
            "photos.entity_type='User'",
        )[0] ??  $this->first(['id' => $user_id]);
    }

    public function join__whit_province_city()
    {
        return $this->inner_join_two(
            "users.*,provinces.name AS province_name ,cities.name AS city_name",
            "cities",
            "city_id",
            "id",
            "provinces",
            "province_id",
            "id",
            "users.user_level>0",
           );
    }
}
