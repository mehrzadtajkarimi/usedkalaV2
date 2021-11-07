<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Tag;
use App\Utilities\FlashMessage;

class TagController extends Controller
{

    public $tagModel;
    public $photoModel;
    public $categoryModel;
    public $category_tagModel;

    public function __construct()
    {
        parent::__construct();
        $this->tagModel          = new Tag();
    }

    public function index()
    {
        $data = array(
            'tags'      => $this->tagModel->read_tag(),

        );
        return view('Backend.tag.index', $data);
    }


    public function store()
    {
        $params = $this->request->params();

        $params_create = array(
            'tag'   => $params['tag'],
        );

        $tag_id = $this->tagModel->create_tag($params_create);

        if ($tag_id) {
            FlashMessage::add("مقادیر باموفقیت  ضمیمه شد ");
            return $this->request->redirect('admin/tag');
        }
        FlashMessage::add("مشکلی در هنگام ایجاد تگ رخ داد ", FlashMessage::ERROR);
        return $this->request->redirect('admin/tag');

    }

    public function edit()
    {
        $id = $this->request->get_param('id');
        $data = array(
            'tag' => $this->tagModel->read_tag($id),
        );
        view('Backend.tag.edit', $data);
    }

    public function update()
    {
        $param = $this->request->params();
        $id    = $this->request->get_param('id');

        $this->tagModel->update([
            'tag'   => $param['tag'],
        ], ['id' => $id]);
        FlashMessage::add("مقادیر باموفقیت  ضمیمه شد ");
        return $this->request->redirect('admin/tag');
    }

    public function upload()
    {
    }

    public function destroy()
    {
        $id = $this->request->get_param('id');

        $is_deleted_tag =  $this->tagModel->delete_tag($id);

        if ($is_deleted_tag) {
            FlashMessage::add("مقادیر  با موفقیت از دیتابیس حذف شد");
            return $this->request->redirect('admin/tag');
        }
        FlashMessage::add(" مشکلی در حذف محصول پیش آمده است", FlashMessage::ERROR);
        return $this->request->redirect('admin/tag');
    }
}
