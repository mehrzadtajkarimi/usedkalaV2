<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Photo;
use App\Models\Blog;
use App\Models\Blog_tag;
use App\Models\Category;
use App\Models\Category_blog;
use App\Models\Tag;
use App\Services\Upload\UploadedFile;
use App\Utilities\FlashMessage;
use App\Utilities\Tinyint;

class BlogController extends Controller
{

    public $blogModel;
    public $photoModel;
    public $categoryModel;
    public $blogCategoriesModel;
    public $blogTagModel;

    public function __construct()
    {
        parent::__construct();
        $this->tagModel            = new Tag();
        $this->photoModel          = new Photo();
        $this->blogModel           = new Blog();
        $this->blogTagModel        = new Blog_tag();
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
            'key'             => $params['key'],
            'value'           => $params['value'],
            'slug'            => $params['slug'],
            'seo_H1'          => $params['seo-H1'],
            'seo_canonical'   => $params['seo-canonical'],
            'seo_title'       => $params['seo-title'],
            'seo_robot'       => $params['seo-robot'],
            'seo_description' => $params['seo-description'],
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


        // dd($categories_id,$tags_id);

        $blog_id = $this->blogModel->create_blog($params_create);

        foreach ($categories_id as $category_id) {
            # code...
            $this->blogCategoriesModel->create_blogCategories([
                'blog_id'     => $blog_id,
                'category_id' => $category_id,
            ]);
        }
        foreach ($tags_id as  $tag_id ) {
            # code...
            $this->blogTagModel->create_blogTag([
                'blog_id' => $blog_id,
                'tag_id'  => $tag_id,
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
        $tags_selected       = $this->blogTagModel->read_tagBlog($id) ?: [];


        $selectedCats = [];
        foreach ($categories_selected as $selectedCatRow) {
            $selectedCats[$selectedCatRow['id']] = $selectedCatRow;
        }
        $selectedTags = [];
        foreach ($tags_selected as $selectedTagRow) {
            $selectedTags[$selectedTagRow['id']] = $selectedTagRow;
        }


        $data = array(
            'tags'                => $this->tagModel->read_tag(),
            'categories'          => $this->categoryModel->read_category(),
            'blog'                => $this->blogModel->read_blog($id),
            'photo'               => $this->photoModel->read_photo($id),
            'categories_selected' => $selectedCats,
            'tags_selected'       => $selectedTags,
            'robots'              => Tinyint::category_robots(),

        );
        view('Backend.blog.edit', $data);
    }

    public function update()
    {
        $param = $this->request->params();
        $id    = $this->request->get_param('id');



        if (!empty($param['blog-category'])) {
            $this->blogCategoriesModel->delete_blogCategories_by_blog_id($id['id']);
            foreach ($param['blog-category'] as  $category_id) {
                $this->blogCategoriesModel->create_blogCategories([
                    'blog_id'     => $id['id'],
                    'category_id' => $category_id,
                ]);
            }
        }
        if (!empty($param['blog-tag'])) {
            $this->blogTagModel->delete_blogTags_by_blog_id($id['id']);
            foreach ($param['blog-tag'] as  $tag_id) {
                $this->blogTagModel->create_blogTag([
                    'blog_id' => $id['id'],
                    'tag_id'  => $tag_id,
                ]);
            }
        }

        $this->blogModel->update([
            'key'             => $param['key'],
            'value'           => $param['value'],
            'slug'            => $param['slug'],
            'seo_H1'          => $param['seo-H1'],
            'seo_canonical'   => $param['seo-canonical'],
            'seo_title'       => $param['seo-title'],
            'seo_robot'       => $param['seo-robot'],
            'seo_description' => $param['seo-description'],
        ], ['id' => $id['id']]);




        $files                   = $this->request->files();
        $files_param             = $files['image_blog'];
        $check_file_param_exists = !empty($files_param);
        if ($check_file_param_exists) {
            $file       = new UploadedFile($files_param);
            $file_paths = $file->save();
            if ($file_paths) {

                $is_update_photo = $this->photoModel->update_photo('Blog', $id['id'], $file_paths[0], 'image_blog');

                if ($is_update_photo) {
                    FlashMessage::add("ویرایش محصول بندی موفقیت انجام شد");
                } else {
                    FlashMessage::add(" مشکلی در ویرایش محصول بندی رخ داد ", FlashMessage::ERROR);
                }
            }
        }
        FlashMessage::add("مقادیر باموفقیت  ضمیمه شد ");
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

        $is_deleted_blog =  $this->blogModel->delete_blog($id);

        if ($is_deleted_blog) {
            FlashMessage::add("مقادیر  با موفقیت از دیتابیس حذف شد");
            return $this->request->redirect('admin/blog');
        }
        FlashMessage::add(" مشکلی در حذف محصول پیش آمده است", FlashMessage::ERROR);
        return $this->request->redirect('admin/blog');
    }
}
