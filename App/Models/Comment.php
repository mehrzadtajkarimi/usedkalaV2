<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;

class Comment extends MysqlBaseModel
{
    protected $table = 'comments';

    public function create_comment(array $params)
    {
        return $this->create($params);
    }
    public function read_comment($id = null)
    {
        if (is_null($id)) {
            return $this->all();
        }
        return $this->find_by_id($id);
    }
    public function read_comment_by_key($key = null)
    {
        if (is_null($key)) {
            return $this->all();
        }
        return $this->get('*', ['key' => $key]);
    }

    public function update_comment(array $params, $id)
    {
        return $this->update($params, ['id' => $id]);
    }
    public function status_down(array $param, $id)
    {
        return $this->update($param, ['id' => $id]);
    }
    public function status_up(array $params, $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_comment($id)
    {
        return $this->delete(['id' => $id]);
    }
    public function join_comment_to_user($type)
    {
        return $this->inner_join(
            "*",
            "users",
            "entity_id",
            "id",
            "comments.status=1",
            "comments.entity_type=$type",
        );
    }
    public function join_all_comment_to_user()
    {
        return  $this->connection->query("
        SELECT
        *
        FROM users
        INNER JOIN comments
        ON  users.id=comments.user_id
        ORDER BY
        comments.id DESC
        ")->fetchAll();
    }
    public function join_comment_to_user_by_comment_id($comment_id = null)
    {
        return $this->inner_join(
            "comments.id AS comment_id , comments.* , users.*",
            "users",
            "id",
            "entity_id",
            "comments.id={$comment_id['id']}",
            "comments.entity_type='comment'",
        );
    }
}
