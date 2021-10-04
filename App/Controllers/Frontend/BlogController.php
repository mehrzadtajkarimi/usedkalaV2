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

        $blog = $this->blogModel->read_blog();

        if (is_array($blog)) {
            $data = array(
                'blogs'    => $blog[0] ?? [],
            );
            return view('Frontend.blog.index', $data);
        }
    }
}
