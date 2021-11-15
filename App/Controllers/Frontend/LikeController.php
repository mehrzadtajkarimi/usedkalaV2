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
        $params   = $this->request->params();
        $data = [
            'entity_id'   => $params['entity_id'],
            'entity_type' => $params['entity_type'],
            'user_id'     => SessionManager::get('auth'),
            'like'        => true,
        ];
        $alreadyExists = $this->likeModel->count_like($data);

        if (!$alreadyExists) {
            $this->likeModel->create_like($data);
        }

        $class_name = '\\App\\Models\\' . $params['entity_type'];


        $entity_model = new $class_name;


        $method_update = "update_" . lcfirst($params['entity_type']);
        $method_read = "read_" . lcfirst($params['entity_type']);
        $entity_model->$method_update(
            [
                'likes[+]' => 1
            ],
            $params['entity_id']
        );

        // if (SessionManager::has('like')) {
        //     return ;
        // }


        // $ObjSessionManager = SessionManager::set('like', 1);


        // $this->likeModel->update_like([
        //     'like[+]'    => $ObjSessionManager->get('dislike'),
        //     'dislike[-]' => $ObjSessionManager->remove('like') ? 1 : 0,
        // ], $where);
        echo  $this->$entity_model->$method_read($params['entity_id'])['likes'];
    }

    public function dislike()
    {
        $params   = $this->request->params();

        if (SessionManager::has('dislike')) {
            return;
        }

        $where = [
            'entity_id'   => $params['entity_id'],
            'entity_type' => $params['entity_type'],
            'user_id'     => SessionManager::get('auth'),
        ];

        $ObjSessionManager = SessionManager::set('dislike', 1);

        $alreadyExists = $this->likeModel->count_like($where);

        if (!$alreadyExists) {
            $this->likeModel->create_like([
                'entity_id'   => $params['entity_id'],
                'entity_type' => $params['entity_type'],
                'user_id'     => SessionManager::get('auth'),
                'dislike[+]' => $ObjSessionManager->get('dislike'),
            ]);
        }

        $this->likeModel->update_like([
            'like[-]'    => $ObjSessionManager->remove('like') ? 1 : 0,
            'dislike[+]' => $ObjSessionManager->get('dislike'),
        ], $where);

        echo  $this->likeModel->read_like($where)['dislike'];
    }
}
