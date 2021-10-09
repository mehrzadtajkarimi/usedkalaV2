<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Blog;

class BlogController extends Controller
{

    public $blogModel;

    public function __construct()
    {
        parent::__construct();
        $this->blogModel = new Blog();
    }

    public function index()
    {
        $slug = $this->request->get_param('slug');

        $blog = $this->blogModel->join_blog_to_photo();


        if (is_array($blog)) {
            $data = array(
                'blogs'    => $blog,
            );
            return view('Frontend.blog.index', $data);
        }
    }
    public function show()
    {
        $slug = $this->request->get_param('slug');
        $blog_id = $this->request->get_param('id');


        $blog = $this->blogModel->join_blog_to_photo_by_blog_id($blog_id);

        if (is_array($blog)) {
            $data = array(
                'blog'    => $blog[0],
            );
            return view('Frontend.blog.show', $data);
        }
    }
}
