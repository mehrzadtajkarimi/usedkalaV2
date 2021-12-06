<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Comment;
use App\Services\Session\SessionManager;
use App\Utilities\FlashMessage;

class CommentController extends Controller
{
    private $commentModel;

    public function __construct()
    {
        parent::__construct();
        $this->commentModel = new Comment();
    }

    public function add()
    {
        $params =$this->request->params();

        $this->commentModel->create([
            'entity_id'   => $params['id'],
            'entity_type' => $params['type'],
            'message'     => $params['comment'],
            'title'       => $params['title'],
            'user_id'     => SessionManager::get('auth'),
        ]);
        FlashMessage::add(" ثبت دیدگاه با موفقیت انجام شد.");
        return $this->request->redirect( lcfirst($params['type']).'/'.$params['id'].'/' .$params['slug']);
    }
}
