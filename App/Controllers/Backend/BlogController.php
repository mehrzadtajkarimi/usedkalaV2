<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Photo;
use App\Models\Blog;
use App\Models\Blog_tag;
use App\Models\Category;
use App\Models\Category_blog;
use App\Models\Tag;
use App\Models\Taggable;
use App\Services\Upload\UploadedFile;
use App\Utilities\FlashMessage;
use App\Utilities\Tinyint;

class BlogController extends Controller
{

    public $blogModel;
    public $photoModel;
    public $categoryModel;
    public $blogCategoriesModel;
    public $tagModel;
    public $taggableModel;

    public function __construct()
    {
        parent::__construct();
        $this->photoModel          = new Photo();
        $this->blogModel           = new Blog();
        $this->taggableModel       = new Taggable();
        $this->tagModel            = new Tag();
        $this->categoryModel       = new Category();
        $this->blogCategoriesModel = new Category_blog();
    }

    public function index()
    {
        $data = array(
            'blogs'      => $this->blogModel->read_blog(),

        );
        return view('Backend.blog.index', $data);
    }

    public function create()
    {
        $data = array(
            'blogs'      => $this->blogModel->read_blog(),
            'tags'       => $this->tagModel->read_tag(),
            'categories' => $this->categoryModel->read_category_by_type(1),   //1=blog
            'robots'     => Tinyint::category_robots(),
        );
        return view('Backend.blog.create', $data);
    }

    public function store()
    {
        $params = $this->request->params();

        $params_create = array(
            'title'           => $params['title'],
            'slug'            => create_slug($params['slug']),
            'value'           => $params['value'],
            'seo_H1'          => $params['seo-H1'],
            'seo_canonical'   => $params['seo-canonical'],
            'seo_title'       => $params['seo-title'],
            'seo_robot'       => $params['seo-robot'],
            'seo_description' => $params['seo-description'],
            'meta_title'      => $params['blog-meta'],
        );

        $file = $this->request->files();
        if (isset($file)) {
            $file_tmp_name = $file['image_blog']['tmp_name'];
            $files_param   = $file['image_blog'];

            $check_file_param_exists = !empty($file_tmp_name[0]);
            if ($check_file_param_exists) {
                $file       = new UploadedFile($files_param);
                $file_paths = $file->save();
            }
        }
        $categories_id = $params['blog-category'];
        $tags_id       = $params['blog-tag'];
        $blog_id       = $this->blogModel->create_blog($params_create);

        foreach ($categories_id as $category_id) {
            $this->blogCategoriesModel->create_blogCategories([
                'blog_id'     => $blog_id,
                'category_id' => $category_id,
            ]);
        }
        foreach ($tags_id as  $tag_id) {
            $this->taggableModel->create_taggable([
                'tag_id'      => $tag_id,
                'entity_id'   => $blog_id,
                'entity_type' => 'Blog'
            ]);
        }

        if ($file_paths) {
            $this->photoModel->create_photo('Blog', $blog_id, $file_paths[0], 'image_blog');

            FlashMessage::add("مقادیر با موفقیت در دیتابیس ذخیره شد");
            return $this->request->redirect('admin/blog');
        }
        FlashMessage::add("مقادیر بدونه عکس با موفقیت در دیتابیس ذخیره شد", FlashMessage::WARNING);
        return $this->request->redirect('admin/blog');
    }

    public function edit()
    {
        $id = $this->request->get_param('id');
        $categories_selected = $this->blogCategoriesModel->read_categoryBlog($id) ?: [];
        $tags_selected       = $this->taggableModel->read_taggable($id) ?: [];

        $photoObj = $this->photoModel->read_single_photo_by_id(0, $id, 'Blog');
        // print_r($photoObj);
        // die();

        $selectedCats = [];
        foreach ($categories_selected as $selectedCatRow) {
            $selectedCats[$selectedCatRow['id']] = $selectedCatRow;
        }

        $selectedTags = [];
        foreach ($tags_selected as $selectedTagRow) {
            $selectedTags[$selectedTagRow['tag_id']] = $selectedTagRow;
        }
        $breadcrumbArr = [
            "بلاگها"             => "blog",
            "ویرایش پست بلاگ" => "#",
        ];

        $data = array(
            'tags'                => $this->tagModel->read_tag(),
            'categories'          => $this->categoryModel->category_tree_for_backend(0, '', 1),
            'blog'                => $this->blogModel->read_blog($id),
            'categories_selected' => $selectedCats,
            'tags_selected'       => $selectedTags,
            'robots'              => Tinyint::category_robots(),
            'breadcrumb'          => $breadcrumbArr
        );
        if (isset($photoObj[0])) $data['photo'] = $photoObj[0];
        view('Backend.blog.edit', $data);
    }

    public function update()
    {
        $param = $this->request->params();
        $id    = $this->request->get_param('id');

        if (!empty($param['blog-category'])) {
            $this->blogCategoriesModel->delete_blogCategories_by_blog_id($id);
            foreach ($param['blog-category'] as  $category_id) {
                $this->blogCategoriesModel->create_blogCategories([
                    'blog_id'     => $id,
                    'category_id' => $category_id,
                ]);
            }
        }
        if (!empty($param['blog-tag'])) {
            $this->taggableModel->delete_taggable($id);
            foreach ($param['blog-tag'] as  $tag_id) {
                $this->taggableModel->create_taggable([
                    'tag_id'      => $tag_id,
                    'entity_id'   => $id,
                    'entity_type' => 'Blog',
                ]);
            }
        }

        $this->blogModel->update([
            'title'           => $param['title'],
            'value'           => $param['value'],
            'slug'            => create_slug($param['slug']),
            'seo_H1'          => $param['seo-H1'],
            'seo_canonical'   => $param['seo-canonical'],
            'seo_title'       => $param['seo-title'],
            'seo_robot'       => $param['seo-robot'],
            'seo_description' => $param['seo-description'],
            'meta_title'      => $param['blog-meta'],
        ], ['id' => $id]);




        $files                   = $this->request->files();
        $files_param             = $files['image_blog'];
        $check_file_param_exists = !empty($files_param);
        if ($check_file_param_exists) {
            $file       = new UploadedFile($files_param);
            $file_paths = $file->save();
            if ($file_paths) {

                $is_update_photo = $this->photoModel->update_photo('Blog', $id, $file_paths[0], 'image_blog');

                if ($is_update_photo) {
                    FlashMessage::add("ویرایش پست بلاگ با موفقیت انجام شد");
                } else {
                    FlashMessage::add(" مشکلی در ویرایش پست بلاگ رخ داد ", FlashMessage::ERROR);
                }
            }
        }
        FlashMessage::add("مقادیر با موفقیت  ضمیمه شد ");
        return $this->request->redirect('admin/blog');
    }

    public function upload()
    {
        $file   = $this->request->files();
        $fileUploadedCkeditor    = $file['upload'];
        $file_tmp_name           = $file['upload']['tmp_name'];
        $check_file_param_exists = !empty($file_tmp_name[0]);
        if ($check_file_param_exists) {
            $file = new UploadedFile($fileUploadedCkeditor);
            $file->save();
            $function_number = 1;
            // $function_number = $_GET['CKEditorFuncNum'];
            $url = $file->get_paths_for_database();
            $message = '';
            echo "<script>window.parent.CKEDITOR.tools.callFunction('" . $function_number . "','" . $url . "','" . $message . "');</script>";
        }
    }

    public function destroy()
    {
        $id = $this->request->get_param('id');

        $is_deleted_blog = $this->blogModel->delete_blog($id);
        $is_deleted_tag  = $this->taggableModel->delete_taggable($id);

        if ($is_deleted_blog/*  && $is_deleted_tag */) {
            FlashMessage::add("مقادیر  با موفقیت از دیتابیس حذف شد");
            return $this->request->redirect('admin/blog');
        }
        FlashMessage::add(" مشکلی در حذف پست بلاگ پیش آمده است", FlashMessage::ERROR);
        return $this->request->redirect('admin/blog');
    }
}
