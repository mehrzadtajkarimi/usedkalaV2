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

    public function __construct()
    {
        parent::__construct();
        $this->categoryModel = new Category;
        $this->photoModel    = new Photo;
    }

    public function index()
    {
        $get_param = $this->request->get_param();
        if (!isset($get_param['type'])) $get_param['type'] = 'product';
        $type_key  = $this->type_amounts($get_param['type'])['type_key'];
        $type_persian = $this->type_amounts($get_param['type'])['type_persian'];
        $folder_type = $get_param['type'];
        $data = array(
            'categories'   => $this->categoryModel->category_tree_for_backend(0, '', $type_key),
            'robots'       => Tinyint::category_robots(),
            'type_persian' => $type_persian
        );
        return view("Backend.category.index", $data);
    }


    public function create()
    {
        $get_param = $this->request->get_param();
        if (!isset($get_param['type'])) $get_param['type'] = 'product';

        $category = $this->categoryModel->first([
            'id' => $get_param['id']
        ]) ?? 0;
        $data = array(
            'category'     => $category,
            'type_amounts' => $this->type_amounts($get_param['type']),
            'robots'       => Tinyint::category_robots(),
        );
        return view('Backend.category.create', $data);
    }


    public function store()
    {
        $get_param = $this->request->get_param();
        $get_type = $this->request->get_param('type');

        if (!isset($get_param['type'])) $get_param['type'] = 'product';

        $type_key  = $this->type_amounts($get_param['type'])['type_key'];

        $request = array(
            'type'            => $type_key,
            'seo_description' => $get_param['seo_description'],
            'seo_title'       => $get_param['seo_title'],
            'parent_id'       => $get_param['id'],
            'name'            => $get_param['name'],
            'H1'              => $get_param['H1'],
            'robots'          => $get_param['robot'],
            'canonical'       => $get_param['canonical'],
            'description'     => $get_param['description'],
            'status'          => $get_param['status'] ?? '0',
            'slug'            => create_slug($get_param['slug']),
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
                    FlashMessage::add("ایجاد دسته بندی با موفقیت انجام شد");
                } elseif ($is_create_photo) {
                    FlashMessage::add(" ایجاد تصویر با موفقیت انجام شد", FlashMessage::ERROR);
                } else {
                    FlashMessage::add(" مشکلی در ایجاد دسته بندی رخ داد ", FlashMessage::ERROR);
                }
                if ($get_type) {
                    return $this->request->redirect("admin/category/$get_type");
                }
                return $this->request->redirect('admin/category');
            }
        } else {
            $this->categoryModel->create_category($request);
            FlashMessage::add("مقادیر بدونه ضمیمه عکس با موفقیت  ذخیره شد", FlashMessage::WARNING);
            if ($get_type) {
                return $this->request->redirect("admin/category/$get_type");
            }
            return $this->request->redirect('admin/category');
        }
    }



    public function edit()
    {
        $id = $this->request->get_param('id');
        $data = array();
        $data['category'] = $this->categoryModel->first(['id' => $id]);

        if ($data['category']['type'] == 0)
            $data['type_persian'] = "محصولات";
        else if ($data['category']['type'] == 1)
            $data['type_persian'] = "بلاگ";
        else if ($data['category']['type'] == 2)
            $data['type_persian'] = "دیدگاه ها";
        else
            $data['type_persian'] = "[نامشخص]";

        $data['photo'] = $this->photoModel->first(['entity_id' => $id]);
        $data['robots'] = Tinyint::category_robots();
        return view('Backend.category.edit', $data);
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
                'slug'            => create_slug($params['slug']),
                'seo_description' => $params['seo_description'],
                'seo_title'       => $params['seo_title'],
                'name'            => $params['name'],
                'H1'              => $params['H1'],
                'robots'          => $params['robot'],
                'canonical'       => $params['canonical'],
                'description'     => $params['description'],
                'status'          => $params['status'] == 'on' ? 1 : 0,
            ], $id);
            FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
        }
        return $this->request->redirect('admin/category/' . $id . '/edit');
    }



    public function destroy()
    {
        $id     = $this->request->get_param('id');
        $is_cat = $this->categoryModel->has(['parent_id' => $id]);
        if ($is_cat == false) {
            $this->categoryModel->delete_category($id);
            $this->photoModel->delete_photo($id);

            FlashMessage::add("دسته بندی با موفقیت حذف شد.");
            return $this->request->redirect('admin/category');
        }
        FlashMessage::add("به دلیل وجود زیر دسته امکان حذف وجود ندارد.", FlashMessage::ERROR);
        return $this->request->redirect('admin/category');
    }


    public function type_amounts($type)
    {
        switch ($type) {
            case "blog":
                $key = 1;
                $persian = "وبلاگ";
                break;

            case "comment":
                $key = 2;
                $persian = "دیدگاه ها";
                break;

            default:
                $type = "product";
                $key = 0;
                $persian = "محصولات";
        }
        return ["type_key" => $key, "type_persian" => $persian, "type" => $type];
    }
}
