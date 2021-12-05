<?php

namespace App\Models;

use App\Models\Contracts\MysqlBaseModel;
use App\Services\Session\SessionManager;

class Wish_list extends MysqlBaseModel
{
    protected $table = 'wish_lists';

    public function create_wishList(array $params)
    {
        return $this->create($params);
    }
    public function read_wishList($entity_id ,$entity_type)
    {
        return $this->get('*',[
            'entity_id'   => $entity_id,
            'entity_type' => $entity_type,
            'user_id' => SessionManager::get('auth')
        ])??NULL;
    }

    public function read_all_wishList_items($entity_type)
    {
        return $this->get('*',[
            'entity_type' => $entity_type,
            'user_id' => SessionManager::get('auth')
        ]);
    }

    public function count_WishList($where)
    {
        return $this->count($where);
    }
    public function join_wishList_to_photo_by_limit($limit)
    {
        return $this->connection->query("
        SELECT wish_lists.id AS wishList_id , wishLists.* , photos.* FROM wishLists
        INNER JOIN photos
        ON wish_lists.id = photos.entity_id
        LIMIT $limit
        ")->fetchAll();
    }
    public function read_wishList_by_key($key = null)
    {
        if (is_null($key)) {
            return $this->all();
        }
        return $this->get('*', ['key' => $key]);
    }

    public function update_wishList(array $params, $id)
    {
        return $this->update($params, ['id' => $id]);
    }

    public function delete_wishList_by_id($id)
    {
        return $this->delete(['id' => $id]);
    }
    public function delete_wishList($where)
    {
        return $this->delete($where);
    }
    public function join_wishList_to_photo()
    {
        return $this->inner_join(
            "wish_lists.id AS wishList_id , wishLists.* , photos.*",
            "photos",
            "id",
            "entity_id",
            "photos.entity_type='wishList'",
        );
    }

    public function join_wishList__with_comment($wishList_id)
    {
        return $this->inner_join(
            "
            comments.*,
            wish_lists.id AS wishList_id
            ", // column
            "comments",
            "id",
            "entity_id",
            "comments.status='1'",
            "comments.entity_id=$wishList_id",
            "comments.entity_type='wishList'",
        );
    }

    public function join_wishList__with_comment_replies($id)
    {
        return $this->inner_join(
            "*", // column
            "comment_replies",                // -- table categories
            "id",                        // categories.id
            "entity_id",               // products.category_id
            "comments.status='1'",
            "comments.parent_id=$id",
            "comments.entity_type='wishList'",
        );
    }
    public function join_wishList_to_photo_by_wishList_id($wishList_id = null)
    {
        return $this->inner_join(
            "wish_lists.id AS wishList_id , wishLists.* , photos.*",
            "photos",
            "id",
            "entity_id",
            "wish_lists.id=$wishList_id",
            "photos.entity_type='wishList'",
        );
    }
    public function join_wishList_to_photo_and_category_wishList($category_id = null)
    {
        return $this->inner_join_two(
            "wish_lists.id AS wishList_id ,
            category_wishLists.category_id AS category_wishList_id ,
            wishLists.* ,
            photos.*",
            "photos",
            "id",
            "entity_id",
            "category_wishLists",
            "id",
            "wishList_id",
            "category_wishLists.category_id={$category_id['id']}",
            "photos.entity_type='wishList'",
        );
    }
}
