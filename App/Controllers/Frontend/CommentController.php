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
        $id   = $this->request->get_param('id');
        $type = $this->request->get_param('type');


        $this->commentModel->create([
            'entity_id'   => $id['id'],
            'entity_type' => $type['type'],
            'message'     => $params['comment'],
            'title'       => $params['title'],
            'user_id'     => SessionManager::get('auth'),
        ]);
        FlashMessage::add(" با موفقیت انجام شد.");
        return $this->request->redirect( lcfirst($type['type']).'/'.$id['id'].'/slog');;
    }
}
