<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Blog;
use App\Models\Category;
use App\Models\Comment;
use App\Services\Session\SessionManager;

class BlogController extends Controller
{

    private $blogModel;
    private $categoryModel;
    private $commentModel;

    public function __construct()
    {
        parent::__construct();
        $this->blogModel     = new Blog();
        $this->categoryModel = new Category();
        $this->commentModel  = new Comment();

    }

    public function index()
    {
        $slug = $this->request->get_param('slug');

        $blog = $this->blogModel->join_blog_to_photo();


        if (is_array($blog)) {
            $data = array(
                'blogs'      => $blog,
                'categories' => $this->categoryModel->read_category_by_type(1),   //1=blog

            );
            return view('Frontend.blog.index', $data);
        }
    }
    public function show()
    {
        $slug    = $this->request->get_param('slug');
        $blog_id = $this->request->get_param('id');




        $blog        = $this->blogModel->join_blog_to_photo_by_blog_id($blog_id);
        $blogComment = $this->blogModel->join_blog__with_comment($blog_id['id'])?? '';

        if (is_array($blog)) {
            $data = array(
                'comments' => $blogComment ?? [],
                'blog'     => $blog[0],
                'auth'     => SessionManager::get('auth')??null,
            );
            return view('Frontend.blog.show', $data);
        }
    }
    public function add_comment()
    {
        $id = $this->request->get_param('id');
        $this->commentModel->create([
            'entity_id'   => $id['id'],
            'entity_type' => 'Blog',
            'user_id'     => SessionManager::get('auth'),
            'message'     => $this->request->params()['blog_title'],
            'title'       => $this->request->params()['blog_title'],
            'ip'          => $this->request->ip(),
        ]);
        return true;
    }
    public function category()
    {
        $slug        = $this->request->get_param('slug');
        $category_id = $this->request->get_param('id');


        $blog = $this->blogModel->join_blog_to_photo_and_category_blog($category_id);

        if (is_array($blog)) {
            $data = array(
                'blog'    => $blog[0],
            );
            return view('Frontend.blog.show', $data);
        }
    }
}
