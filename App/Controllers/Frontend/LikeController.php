<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Like;
use App\Services\Session\SessionManager;

class LikeController extends Controller
{
    private $likeModel;

    public function __construct()
    {
        parent::__construct();
        $this->likeModel     = new Like();
    }

    public function like()
    {
        $id   = $this->request->get_param('id');
        $type = $this->request->get_param('type');


        if (SessionManager::has('like')) {
            return;
        }

        $where = [
            'entity_id'   => $id['id'],
            'entity_type' => $type['type'],
            'user_id'     => SessionManager::get('auth'),
        ];
        $like  = $this->likeModel->read_like($where) ?? '';

        $ObjSessionManager = SessionManager::set('like', 1);

        $alreadyExists = $this->likeModel->count_like($where);

        if (!$alreadyExists) {
            $this->likeModel->create_like([
                'entity_id'   => $id['id'],
                'entity_type' => $type['type'],
                'user_id'     => SessionManager::get('auth'),
                '_like[+]'    => $ObjSessionManager->get('like'),
            ]);
        }

        $this->likeModel->update_like([
            '_like[+]'    => $ObjSessionManager->get('dislike'),
            '_dislike[-]' => $ObjSessionManager->remove('like') ? 1 : 0,
        ], $where);

        echo  $like['like'];
    }

    public function dislike()
    {
        $id   = $this->request->get_param('id');
        $type = $this->request->get_param('type');


        if (SessionManager::has('dislike')) {
            return;
        }

        $where = [
            'entity_id'   => $id['id'],
            'entity_type' => $type['type'],
            'user_id'     => SessionManager::get('auth'),
        ];
        $like  = $this->likeModel->read_like($where) ?? '';

        $ObjSessionManager = SessionManager::set('dislike', 1);

        $alreadyExists = $this->likeModel->count_like($where);

        if (!$alreadyExists) {
            $this->likeModel->create_like([
                'entity_id'   => $id['id'],
                'entity_type' => $type['type'],
                'user_id'     => SessionManager::get('auth'),
                '_dislike[+]' => $ObjSessionManager->get('dislike'),
            ]);
        }

        $this->likeModel->update_like([
            '_like[-]'    => $ObjSessionManager->remove('like') ? 1 : 0,
            '_dislike[+]' => $ObjSessionManager->get('dislike'),
        ], $where);

        echo  $like['dislike'];
    }
}
