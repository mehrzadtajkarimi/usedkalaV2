<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\PageMetas;
use App\Utilities\FlashMessage;

class PageMetasController extends Controller
{

    public $pageMetasModel;

    public function __construct()
    {
        parent::__construct();
        $this->pageMetasModel = new PageMetas();
    }

    public function index()
    {
        $data = array(
            'pageMetas'    => $this->pageMetasModel->read_pageMeta(),
        );
        return view('Backend.pageMetas.index', $data);
    }

    public function edit()
    {
        $id = $this->request->get_param('id');
        $data = array(
            'pageMeta' => $this->pageMetasModel->read_pageMeta($id),
        );
        view('Backend.pageMetas.edit', $data);
    }
	
    public function update()
    {
        $param = $this->request->params();
        $id = $this->request->get_param('id');

        $this->pageMetasModel->update([
            'html_title'   => $param['html_title'],
            'html_desc' => $param['html_desc'],
            'robots' => $param['robots'],
            'canonical' => $param['canonical']
        ], ['id' => $id]);
        FlashMessage::add("تغییرات با موفقیت ثبت شد.");
        return $this->request->redirect('admin/pagemetas/'.$id.'/edit');
    }
}
