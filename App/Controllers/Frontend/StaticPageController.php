<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\StaticPage;
use App\Models\PageMeta;

class StaticPageController extends Controller
{

    public $staticPageModel;
	private $pageMetaModel;

    public function __construct()
    {
        parent::__construct();
        $this->staticPageModel = new StaticPage();
		$this->pageMetaModel         = new PageMeta();
    }

    public function about()
    {
        $slug = $this->request->get_param('slug');
		$slug = urldecode($slug);
        $setting_about = $this->staticPageModel->read_staticPage_by_slug($slug);

        if (is_array($setting_about)) {
            $data = array(
                'setting'    => $setting_about[0]??[],
				'home_page_active_menu' => 'single single-post full-width',
				'headSeoTitle' => $setting_about[0]['html_title'],
				'headSeoDescription' => $setting_about[0]['html_desc'],
				'headSeoRobots' => $setting_about[0]['robots'],
				'headSeoCanonical' => $setting_about[0]['canonical']
            );
            return view('Frontend.about.show', $data);
        }
    }
    public function post()
    {
        $slug = $this->request->get_param('slug');

        $setting_post = $this->staticPageModel->read_staticPage_by_key('post');

        if (is_array($setting_post)) {
            $data = array(
                'setting'    => $setting_post[0]??[],
            );
            return view('Frontend.about.post', $data);
        }
    }
    public function rule()
    {
        $slug = $this->request->get_param('slug');

        $setting_rule = $this->staticPageModel->read_staticPage_by_key('rule');

        if (is_array($setting_rule)) {
            $data = array(
                'setting'    => $setting_rule[0]??[],
            );
            return view('Frontend.about.rule', $data);
        }
    }
    public function contact()
    {
        $slug = $this->request->get_param('slug');
		$pageMetas=$this->pageMetaModel->read_pageMeta(3);

        $setting_contact = $this->staticPageModel->read_staticPage_by_key('contact');

        if (is_array($setting_contact)) {
            $data = array(
                'setting'				=> $setting_contact[0]??[],
				'home_page_active_menu'	=> 'page home page-template-default',
				'headSeoTitle' => $pageMetas['html_title'],
				'headSeoDescription' => $pageMetas['html_desc'],
				'headSeoRobots' => $pageMetas['robots'],
				'headSeoCanonical' => $pageMetas['canonical']
            );
            return view('Frontend.about.contact', $data);
        }
    }
}
