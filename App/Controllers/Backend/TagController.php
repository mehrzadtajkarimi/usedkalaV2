<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Tag;
use App\Models\Taggable;
use App\Utilities\FlashMessage;

class TagController extends Controller
{

    public $tagModel;
    public $taggableModel;
    public $photoModel;
    public $categoryModel;
    public $category_tagModel;

    public function __construct()
    {
        parent::__construct();
        $this->tagModel      = new Tag();
        $this->taggableModel = new Taggable();
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

        $params_tag = array(
            'tag' => $params['tag'],
        );

        $tag_id = $this->tagModel->create_tag($params_tag);

        if ($tag_id) {
            FlashMessage::add("مقادیر باموفقیت  ضمیمه شد ");
            return $this->request->redirect('admin/tag');
        }
        FlashMessage::add("مشکلی در هنگام ایجاد تگ رخ داد ", FlashMessage::ERROR);
        return $this->request->redirect('admin/tag');
    }

    public function edit()
    {
        $params = $this->request->params();

        $data = array(
            'tag' => $this->tagModel->read_tag_id($params['id'])[0],
        );
        view('Backend.tag.edit', $data);
    }

    public function update()
    {
        $params = $this->request->params();
        $id    = $this->request->get_param('id');

        $this->tagModel->update([
            'tag'         => $params['tag'],
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
