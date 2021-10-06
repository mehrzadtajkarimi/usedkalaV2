<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Photo;
use App\Models\Blog;
use App\Services\Upload\UploadedFile;
use App\Utilities\FlashMessage;

class BlogController extends Controller
{

    public $blogModel;
    public $photoModel;

    public function __construct()
    {
        parent::__construct();
        $this->blogModel = new Blog();
        $this->photoModel = new Photo();
    }

    public function index()
    {
        $data = array(
            'blogs'    => $this->blogModel->read_blog(),
        );
        return view('Backend.blog.index', $data);
    }

    public function create()
    {
        $data = array(
            'blogs'    => $this->blogModel->read_blog(),
        );
        return view('Backend.blog.create', $data);
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
            $file_tmp_name = $file['image_blog']['tmp_name'];
            $files_param   = $file['image_blog'];

            $check_file_param_exists = !empty($file_tmp_name[0]);
            if ($check_file_param_exists) {
                $file       = new UploadedFile($files_param);
                $file_paths = $file->save();
            }
        }

        $blog_id = $this->blogModel->create_blog($params_create);
        $this->photoModel->create_photo('Blog', $blog_id, $file_paths[0], 'image_blog');

        FlashMessage::add("مقادیر با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/blog');
    }

    public function edit()
    {
        $id = $this->request->get_param('id');
        $data = array(
            'blog' => $this->blogModel->read_blog($id),
            'photo' => $this->photoModel->read_photo($id),

        );
        view('Backend.blog.edit', $data);
    }

    public function update()
    {
        $param = $this->request->params();
        $id    = $this->request->get_param('id');

        $this->blogModel->update([
            'key'   => $param['key'],
            'value' => $param['value'],
            'slug'  => $param['slug'],
        ], ['id' => $id]);
        FlashMessage::add("مقادیر باموفقیت  ضمیمه شد ");
        return $this->request->redirect('admin/blog');
    }

    public function upload()
    {
        $file   = $this->request->files();
        $fileUploadedCkeditor    = $file['upload'];
        $file_tmp_name           = $file['upload']['tmp_name'];
        $check_file_param_exists = !empty($file_tmp_name[0]);
        if ($check_file_param_exists) {
            $file = new UploadedFile($fileUploadedCkeditor);
            $file->save();
            $function_number = 1;
            // $function_number = $_GET['CKEditorFuncNum'];
            $url = $file->get_paths_for_database();
            $message = '';
            echo "<script>window.parent.CKEDITOR.tools.callFunction('" . $function_number . "','" . $url . "','" . $message . "');</script>";
        }
    }

    public function destroy()
    {
        $id = $this->request->get_param('id');

        $is_deleted_blog =  $this->blogModel->delete_blog($id);

        if ($is_deleted_blog) {
            FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
            return $this->request->redirect('admin/blog');
        }
        FlashMessage::add(" مشکلی در حذف محصول پیش آمده است", FlashMessage::ERROR);
        return $this->request->redirect('admin/blog');
    }
}
