<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Category;
use App\Models\Photo;
use App\Services\Upload\UploadedFile;
use App\Utilities\FlashMessage;
use App\Utilities\Tinyint;

class CategoryController extends Controller
{
    private $categoryModel;
    private $photoModel;
    private $get_param;

    public function __construct()
    {
        parent::__construct();
        $this->categoryModel = new Category;
        $this->photoModel    = new Photo;
        $this->get_param     = $this->request->get_param();
    }

    public function index()
    {
        $get_param = $this->get_param;
        $get_type  = $get_param['type'] ?? false;
        $type_key  = $get_type ? $this->type_amounts($get_type) : false;


        $folder_type = is_array($get_param) ? implode($get_param) : $get_param;
        if ($type_key) {
            $data = array(
                'categories' => $this->categoryModel->category_tree_for_backend_by_type($type_key),
                'robots'     => Tinyint::category_robots(),
            );
            return view("Backend.category.$folder_type.index", $data);
        }

        $data = array(
            'categories' => $this->categoryModel->category_tree_for_backend(),
            'robots'     => Tinyint::category_robots(),
        );
        return view('Backend.category.product.index', $data);
    }


    public function create()
    {
        $get_param = $this->get_param;
        $get_type  = $get_param['type'] ?? false;
        $type_key  = $get_type ?: $this->type_amounts($get_type) ;



        if ($get_type) {
            $category = $this->categoryModel->first([
                'id'   => $get_param['id'],
            ]) ?? 0;

            $data = array(
                'category' => $category,
                'robots'   => Tinyint::category_robots(),
            );
            return view("Backend.category.$get_type.create", $data);
        }

        $category = $this->categoryModel->first([
            'id' => $get_param['id']
        ]) ?? 0;
        $data = array(
            'category' => $category,
            'robots'   => Tinyint::category_robots(),
        );
        return view('Backend.category.product.create', $data);
    }


    public function store()
    {
        $get_param = $this->get_param;
        $get_type  = $get_param['type'] ?? false;
        $type_key  = $get_type ? $this->type_amounts($get_type) : 0;


        $request = array(
            'type'        => $type_key,
            'parent_id'   => $get_param['id'],
            'name'        => $get_param['name'],
            'H1'          => $get_param['H1'],
            'robot'      => $get_param['robot'],
            'canonical'   => $get_param['canonical'],
            'description' => $get_param['description'],
            'status'      => $get_param['status'] ?? '0',
            'slug'        => create_slug($get_param['slug']),
        );
        $files                = $this->request->files();
        $files_param          = $files['image_category'];
        $files_param_tmp_name = $files_param['tmp_name'];
        $file_param_exists    = !empty($files_param_tmp_name[0]);
        if ($file_param_exists) {
            $is_create_category = $this->categoryModel->create_category($request);
            $file               = new UploadedFile($files_param);
            $file_paths         = $file->save();
            if ($file_paths) {

                $is_create_photo = $this->photoModel->create_photo('Category', $is_create_category, $file_paths[0], 'image_category');


                if ($is_create_category) {
                    FlashMessage::add("ایجاد محصول موفقیت انجام شد");
                } elseif ($is_create_photo) {
                    FlashMessage::add(" ایجاد تصویر موفقیت انجام شد", FlashMessage::ERROR);
                } else {
                    FlashMessage::add(" مشکلی در ایجاد محصول رخ داد ", FlashMessage::ERROR);
                }
                if ($get_type) {
                    return $this->request->redirect("admin/category/$get_type");
                }
                return $this->request->redirect('admin/category');
            }
        } else {
            $this->categoryModel->create_category($request);
            FlashMessage::add("مقادیر بدونه ضمیمه عکس با موفقیت در دیتابیس ذخیره شد", FlashMessage::WARNING);
            if ($get_type) {
                return $this->request->redirect("admin/category/$get_type");
            }
            return $this->request->redirect('admin/category');
        }
    }



    public function edit()
    {
        $id = $this->request->get_param('id');
        $get_type  = $get_param['type'] ?? false;
        $type_key  = $get_type ? $this->type_amounts($get_type) : 0;

        $data = array(
            'category' => $this->categoryModel->first(['id' => $id]),
            'photo'    => $this->photoModel->first(['entity_id' => $id]),
            'robots'   => Tinyint::category_robots(),
        );
        if ($get_type) {
            return view("Backend.category.$type_key.edit", $data);

        }
        return view('Backend.category.product.edit', $data);
    }



    public function update()
    {
        $params = $this->request->params();

        $id                   = $this->request->get_param('id');
        $files                = $this->request->files();
        $files_param          = $files['image_category'];
        $files_param_tmp_name = $files_param['tmp_name'];
        $file_param_exists    = !empty($files_param_tmp_name[0]);
        if ($file_param_exists) {
            $file       = new UploadedFile($files_param);
            $file_paths = $file->save();
            if ($file_paths) {

                $is_update_photo = $this->photoModel->update_photo('Category', $id, $file_paths[0], 'image_category');

                if ($is_update_photo) {
                    FlashMessage::add("ویرایش دسته بندی موفقیت انجام شد");
                } else {
                    FlashMessage::add(" مشکلی در ویرایش دسته بندی رخ داد ", FlashMessage::ERROR);
                }
            }
        } else {
            $this->categoryModel->update_category([
                'slug'        => create_slug($params['slug']),
                'name'        => $params['name'],
                'H1'          => $params['H1'],
                'robot'       => $params['robot'],
                'canonical'   => $params['canonical'],
                'description' => $params['description'],
                'status'      => $params['status'] == 'on' ? 1 : 0,
            ], $id);
            FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
        }
        return $this->request->redirect('admin/category');
    }



    public function destroy()
    {
        $id     = $this->request->get_param('id');
        $is_cat = $this->categoryModel->has(['parent_id' => $id]);
        if ($is_cat == false) {
            $this->categoryModel->delete_category($id);
            $this->photoModel->delete_photo($id);

            FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
            return $this->request->redirect('admin/category');
        }
        FlashMessage::add("به دلیل وجود زیر دسته امکان حذف وجود ندارد", FlashMessage::ERROR);
        return $this->request->redirect('admin/category');
    }


    public function type_amounts($type)
    {
        $amounts = array(
            1 => 'blog',
            2 => 'comment'
        );
        if (in_array($type, $amounts)) {
            $key = array_keys($amounts, $type);
            return $key[0];
        }
        return 0;
    }
}
