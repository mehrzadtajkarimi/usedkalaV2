<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Blog;
use App\Models\Blog_tag;
use App\Models\Category;
use App\Models\Comment;
use App\Services\Session\SessionManager;

class BlogController extends Controller
{

    private $blogModel;
    private $categoryModel;
    private $commentModel;
    private $blogTagModel;

    public function __construct()
    {
        parent::__construct();
        $this->blogModel     = new Blog();
        $this->categoryModel = new Category();
        $this->commentModel  = new Comment();
        $this->blogTagModel  = new Blog_tag();
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
        $blogComment = $this->blogModel->join_blog__with_comment_and_like($blog_id['id']) ?? '';
        foreach ($blogComment as $key => $comment) {
            $blogComment[$key]['reply'] = $this->commentModel->read_comment_replies($comment['comment_id'], $blog_id['id'], 'Blog');
        }
        $blogTag     = $this->blogTagModel->join_blog__with_tag($blog_id['id']) ?? '';


        // foreach ($blogComment as $key => $value) {

        //     dd($value,empty($value['reply']), is_array($value['reply'][0]));

        // }

        if (is_array($blog)) {
            $data = array(
                'comments'       => $blogComment ?? [],
                'tags'           => $blogTag ?? [],
                'blog'           => $blog[0],
                'auth'           => SessionManager::get('auth') ?? null,
            );
            return view('Frontend.blog.show', $data);
        }
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
