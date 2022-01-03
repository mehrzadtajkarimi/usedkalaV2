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
use App\Utilities\TimeUtil;

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
        $this->jDateObj    = new TimeUtil();
    }

    public function index()
    {
        $slug = $this->request->get_param('slug');

        $blog = $this->blogModel->join_blog_to_photo();
		foreach($blog as $postKey=>$postRow)
			$blog[$postKey]['jDate']=$this->jDateObj->jalaliDate($postRow['created_at']);

        if (is_array($blog)) {
            $data = array(
                'blogs'                 => $blog,
                'categories'            => $this->categoryModel->read_category_by_type(1),   //1=blog
				'home_page_active_menu' => "right-sidebar"
            );
            return view('Frontend.blog.index', $data);
        }
    }
    public function show()
    {
        $params       = $this->request->params();
        $blog         = $this->blogModel->read_blog_by_slug(urldecode($params['slug']));
		$params['id'] = $blog[0]['id'];
		
        $blogTag     = $this->taggableModel->join_taggable('blogs',$params['id']) ?? '';
        $blog        = $this->blogModel->join_blog_to_photo_by_blog_id($params['id']);
        $blogComment = $this->blogModel->join_blog__with_comment($params['id']) ?? '';

        foreach ($blogComment as $key => $comment) {
            $blogComment[$key]['reply'] = $this->commentModel->read_comment_replies($comment['id'], $params['id'], 'Blog');
        }
        $wish_list = $this->wishListModel->read_wishList($params['id'], 'Blog');
      
        if (is_array($blog)) {
            $data = array(
				'categories'            => $this->categoryModel->read_category_by_type(1),   //1=blog
                'comments'				=> $blogComment ?? [],
                'tags'					=> $blogTag ?? [],
                'blog'					=> $blog[0],
                'wish_list'				=> !empty($wish_list) ? $wish_list :[],
                'auth'					=> SessionManager::get('auth') ?? false,
				'home_page_active_menu'	=> "right-sidebar single single-post",
				'postDate'				=> $this->jDateObj->jalaliDate($blog[0]['created_at'])
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
