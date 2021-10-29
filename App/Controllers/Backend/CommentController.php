<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Core\Request;
use App\Models\Photo;
use App\Models\Comment;
use App\Models\Category;
use App\Services\Upload\UploadedFile;
use App\Utilities\FlashMessage;

class CommentController extends Controller
{

    public $commentModel;
    public $photoModel;
    public $categoryModel;
    public $category_commentModel;

    public function __construct()
    {
        parent::__construct();
        $this->commentModel  = new Comment();
        $this->categoryModel = new Category();
        $this->photoModel    = new Photo();
    }

    public function index()
    {
        $data = array(
            'comments' => $this->commentModel->join_all_comment_to_user() ?? [],

        );
        return view('Backend.comment.index', $data);
    }

    public function create()
    {
        $data = array(
            'comments'    => $this->commentModel->read_comment(),
            'categories' => $this->categoryModel->read_category_by_type(1), //1=comment
        );
        return view('Backend.comment.create', $data);
    }

    public function store()
    {
        $params = $this->request->params();

        $params_create = array(
            'key'   => $params['key'],
            'value' => $params['value'],
            'slug'  => $params['slug'],
        );

        $file = $this->request->files();
        if (isset($file)) {
            $file_tmp_name = $file['image_comment']['tmp_name'];
            $files_param   = $file['image_comment'];

            $check_file_param_exists = !empty($file_tmp_name[0]);
            if ($check_file_param_exists) {
                $file       = new UploadedFile($files_param);
                $file_paths = $file->save();
            }
        }
        $categories_id = $params['comment-category'];

        $comment_id = $this->commentModel->create_comment($params_create);
        $this->category_commentModel->create_categorycomment($comment_id, $categories_id);

        if ($file_paths) {
            $this->photoModel->create_photo('comment', $comment_id, $file_paths[0], 'image_comment');

            FlashMessage::add("مقادیر با موفقیت در دیتابیس ذخیره شد");
            return $this->request->redirect('admin/comment');
        }
        FlashMessage::add("مقادیر بدونه عکس با موفقیت در دیتابیس ذخیره شد", FlashMessage::WARNING);
        return $this->request->redirect('admin/comment');
    }

    public function edit()
    {
        $id = $this->request->get_param('id');
        $data = array(
            'comment' => $this->commentModel->read_comment($id),
            'photo' => $this->photoModel->read_photo($id),

        );
        view('Backend.comment.edit', $data);
    }

    public function update()
    {
        $param = $this->request->params();
        $id    = $this->request->get_param('id');

        $this->commentModel->update([
            'title'   => $param['title'],
            'message' => $param['message'],
        ], ['id' => $id]);
        FlashMessage::add("مقادیر باموفقیت  ضمیمه شد ");
        return $this->request->redirect('admin/comment');
    }


    public function destroy()
    {
        $id = $this->request->get_param('id');

        $is_deleted_comment =  $this->commentModel->delete_comment($id);

        if ($is_deleted_comment) {
            FlashMessage::add("مقادیر  با موفقیت از دیتابیس حذف شد");
            return $this->request->redirect('admin/comment');
        }
        FlashMessage::add(" مشکلی در حذف محصول پیش آمده است", FlashMessage::ERROR);
        return $this->request->redirect('admin/comment');
    }

    public function status()
    {
        $id = $this->request->get_param('id');
        $status = $this->request->params();

        $param = array(
            'status' => $status['status'] ? 0 : 1
        );
        $this->commentModel->status_down($param, $id);
        return  Request::redirect('admin/comment');
    }
}
