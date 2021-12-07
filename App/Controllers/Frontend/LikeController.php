<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Like;
use App\Models\Comment;
use App\Services\Session\SessionManager;

class LikeController extends Controller
{
    private $likeModel;
    private $commentModel;

    public function __construct()
    {
        parent::__construct();
        $this->likeModel    = new Like();
        $this->commentModel = new Comment();
    }

    public function like()
    {
        $params   = $this->request->params();
        if (SessionManager::get('auth')) {
            $where = [
                'entity_id' => $params['entity_id'],
                'user_id'   => SessionManager::get('auth'),
            ];

            $alreadyExists = $this->likeModel->count_like($where);

            if (!$alreadyExists && SessionManager::get('auth')) {
                $this->likeModel->create_like([
                    'entity_id' => $params['entity_id'],
                    'type'      => 'like',
                    'user_id'   => SessionManager::get('auth')
                ]);
                $this->commentModel->update_comment([
                    "like[+]"    => 1,
                ], $params['entity_id']);

                echo json_encode(['like' => $this->commentModel->read_comment($params['entity_id'])['like']]);
            } else {
                echo json_encode(['error' => 'رای شما قبلا ثبت گردیده است.']);
            }
        } else if (!SessionManager::get('auth')) {
            $where = [
                'entity_id'  => $params['entity_id'],
                'session_id' => session_id(),
            ];

            $alreadyExists = $this->likeModel->count_like($where);

            if (!$alreadyExists) {
                $this->likeModel->create_like([
                    'entity_id'  => $params['entity_id'],
                    'type'       => 'like',
                    'session_id' => session_id(),
                ]);

                $this->commentModel->update_comment([
                    "like[+]"    => 1,
                ], $params['entity_id']);

                echo json_encode(['like' => $this->commentModel->read_comment($params['entity_id'])['like']]);
            } else {
                echo json_encode(['error' => 'رای شما قبلا ثبت گردیده است.']);
            }
        }
    }

    public function dislike()
    {
        $params   = $this->request->params();
        if (SessionManager::get('auth')) {
            $where = [
                'entity_id' => $params['entity_id'],
                'user_id'   => SessionManager::get('auth'),
            ];

            $alreadyExists = $this->likeModel->count_like($where);

            if (!$alreadyExists) {
                $this->likeModel->create_like([
                    'entity_id' => $params['entity_id'],
                    'type'      => 'dislike',
                    'user_id'   => SessionManager::get('auth')
                ]);
                $this->commentModel->update_comment([
                    "dislike[+]" => 1,
                ], $params['entity_id']);

                echo json_encode(['dislike' => $this->commentModel->read_comment($params['entity_id'])['dislike']]);
            } else {
                echo json_encode(['error' => 'رای شما قبلا ثبت گردیده است.']);
            }
        } else if (!SessionManager::get('auth')) {
            $where = [
                'entity_id'  => $params['entity_id'],
                'session_id' => session_id(),
            ];

            $alreadyExists = $this->likeModel->count_like($where);

            if (!$alreadyExists) {
                $this->likeModel->create_like([
                    'entity_id'  => $params['entity_id'],
                    'type'       => 'dislike',
                    'session_id' => session_id(),
                ]);

                $this->commentModel->update_comment([
                    "dislike[+]"    => 1,
                ], $params['entity_id']);

                echo json_encode(['dislike' => $this->commentModel->read_comment($params['entity_id'])['dislike']]);
            } else {
                echo json_encode(['error' => 'رای شما قبلا ثبت گردیده است.']);
            }
        }
    }
}
