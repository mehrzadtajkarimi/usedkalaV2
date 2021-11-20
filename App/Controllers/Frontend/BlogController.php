<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Blog;
use App\Models\Blog_tag;
use App\Models\Category;
use App\Models\Comment;
use App\Models\Taggable;
use App\Models\Wish_list;
use App\Services\Session\SessionManager;

class BlogController extends Controller
{

    private $blogModel;
    private $categoryModel;
    private $commentModel;
    private $taggableModel;
    private $wishListModel;

    public function __construct()
    {
        parent::__construct();
        $this->blogModel     = new Blog();
        $this->categoryModel = new Category();
        $this->commentModel  = new Comment();
        $this->taggableModel = new Taggable();
        $this->wishListModel = new Wish_list();
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
        $params = $this->request->params();

        $blog        = $this->blogModel->join_blog_to_photo_by_blog_id($params['id']);
        $blogComment = $this->blogModel->join_blog__with_comment($params['id']) ?? '';
        foreach ($blogComment as $key => $comment) {
            $blogComment[$key]['reply'] = $this->commentModel->read_comment_replies($comment['id'], $params['id'], 'Blog');
        }
        $blogTag   = $this->taggableModel->join_taggable('blogs',$params['id']) ?? '';
        $wish_list = $this->wishListModel->read_wishList($params['id'], 'Blog');

        // foreach ($blogComment as $key => $value) {

        //     dd($value);

        // }


        if (is_array($blog)) {
            $data = array(
                'comments'  => $blogComment ?? [],
                'tags'      => $blogTag ?? [],
                'blog'      => $blog[0],
                'wish_list' => !empty($wish_list) ? $wish_list :[],
                'auth'      => SessionManager::get('auth') ?? false,
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
