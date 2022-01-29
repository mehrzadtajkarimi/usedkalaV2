<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Photo;
use App\Models\StaticPage;
use App\Services\Upload\UploadedFile;
use App\Utilities\FlashMessage;

class StaticPageController extends Controller
{

    public $staticPageModel;
    public $photoModel;

    public function __construct()
    {
        parent::__construct();
        $this->staticPageModel = new StaticPage();
        $this->photoModel = new Photo();
    }

    public function index()
    {
        $data = array(
            'staticPage'    => $this->staticPageModel->read_staticPage(),
        );
        return view('Backend.staticPage.index', $data);
    }

    public function create()
    {
		 $data = array(
            'staticPage'    => $this->staticPageModel->read_staticPage(),
        );
        return view('Backend.staticPage.create', $data);
    }

    public function store()
    {
        $params = $this->request->params();

        $params_create = array(
            'key'   => $params['key'],
            'value' => $params['value'],
            'slug'  => create_slug($params['slug'])
        );

        $files = $this->request->files();
        // dd($params);
        if (isset($files)) {
            foreach ($this->request->files() as  $value) {
                $files_tmp_name    = $files['file']['tmp_name'];

                $check_file_param_exists = !empty($files_tmp_name[0]);
                if ($check_file_param_exists) {
                    $file = new UploadedFile($value);
                    $file->save();
                }
            }
        }

        $this->staticPageModel->create_staticPage($params_create);

        FlashMessage::add("مقادیر با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/staticpage');
    }

    public function edit()
    {
        $id = $this->request->get_param('id');
        $data = array(
            'staticPage' => $this->staticPageModel->read_staticPage($id),

        );
        view('Backend.staticPage.edit', $data);
    }
    public function update()
    {
        $param = $this->request->params();
        $id = $this->request->get_param('id');

        $this->staticPageModel->update([
            'key'   => $param['key'],
            'value' => $param['value'],
            'slug'  => create_slug($param['slug']),
			'html_title'   => $param['html_title'],
            'html_desc' => $param['html_desc'],
            'robots' => $param['robots'],
            'canonical' => $param['canonical']
        ], ['id' => $id]);
        FlashMessage::add("مقادیر باموفقیت  ضمیمه شد ");
        return $this->request->redirect('admin/staticpage');
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

        $is_deleted_staticPage =  $this->staticPageModel->delete_staticPage($id);

        if ($is_deleted_staticPage) {
            FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
            return $this->request->redirect('admin/staticpage');
        }
        FlashMessage::add(" مشکلی در حذف محصول پیش آمده است", FlashMessage::ERROR);
        return $this->request->redirect('admin/staticpage');
    }
}