<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\PageMeta;
use App\Utilities\FlashMessage;

class PageMetaController extends Controller
{

    public $pageMetaModel;

    public function __construct()
    {
        parent::__construct();
        $this->pageMetaModel = new PageMeta();
    }

    public function index()
    {
        $data = array(
            'pageMeta'    => $this->pageMetaModel->read_pageMeta(),
        );
        return view('Backend.pageMeta.index', $data);
    }

    public function edit()
    {
        $id = $this->request->get_param('id');
        $data = array(
            'pageMeta' => $this->pageMetaModel->read_pageMeta($id),
        );
        view('Backend.pageMeta.edit', $data);
    }
	
    public function update()
    {
        $param = $this->request->params();
        $id = $this->request->get_param('id');

        $this->pageMetaModel->update([
            'html_title'   => $param['html_title'],
            'html_desc' => $param['html_desc'],
            'robots' => $param['robots'],
            'canonical' => $param['canonical']
        ], ['id' => $id]);
        FlashMessage::add("تغییرات با موفقیت ثبت شد.");
        return $this->request->redirect('admin/pagemeta/'.$id.'/edit');
    }
}
