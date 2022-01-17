<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Core\Request;
use App\Models\Comment;
use App\Models\User;
use App\Services\Auth\Auth;
use App\Services\Session\SessionManager;
use App\Utilities\FlashMessage;

class CommentController extends Controller
{
    private $commentModel;
    private $userModel;

    public function __construct()
    {
        parent::__construct();
        $this->commentModel = new Comment();
        $this->userModel    = new User();
    }

    public function add()
    {
        $params = $this->request->params();

        $this->commentModel->create([
            'entity_id'   => $params['id'],
            'entity_type' => $params['type'],
            'message'     => $params['comment'],
            'title'       => $params['title'],
            'user_id'     => SessionManager::get('auth'),
        ]);
        FlashMessage::add(" ثبت دیدگاه با موفقیت انجام شد.");
        return $this->request->redirect(lcfirst($params['type']) . '/' . $params['slug']);
    }

    public function index()
    {
        $user_id = Auth::is_login();
        $user    = $this->userModel->join_user_to_photo($user_id);

        if (!$user_id) {
            FlashMessage::add(" جهت مشاهده نظرات ابتدا باید وارد شوید", FlashMessage::ERROR);
            Request::redirect('');
        }
        $comments = $this->commentModel->read_comment__by__user_id_entity_type($user_id, 'Product');
        if ($comments) {
            $data = [
                'comments' => $comments,
                'user'     => $user,
            ];
            return view('Frontend.profile.comment.index', $data);
        }
        FlashMessage::add("دیدگاه ثبت نشده !!! ");
        return $this->request->redirect('profile');
    }

    public function show()
    {
        $product_id = $this->request->get_param('id');
        $user_id    = Auth::is_login();
        $user    = $this->userModel->join_user_to_photo($user_id);

        if (!$user_id) {
            FlashMessage::add(" جهت مشاهده نظر ابتدا باید وارد شوید", FlashMessage::ERROR);
            Request::redirect('');
        }
        $comment_by_entity_id = $this->commentModel->read_comment__by__user_id_entity_type($user_id, 'Product',$product_id);

        if ($comment_by_entity_id) {
            $data = [
                'comments' => $comment_by_entity_id,
                'user'     => $user,
            ];
            return view('Frontend.profile.comment.show', $data);
        }
        FlashMessage::add("دیدگاه شما نبود احتمالا مشکلی رخ داده!!! ");
        return $this->request->redirect('profile');
    }
}
