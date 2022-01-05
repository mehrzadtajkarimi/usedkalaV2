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
        parent:: __construct();
        $this->categoryModel = new Category;
        $this->photoModel    = new Photo;
    }

    public function index()
    {
        $get_type = $this->request->get_param('type');

        $type_key     = $this->type_amounts($get_type)['type_key'];
        $type_persian = $this->type_amounts($get_type)['type_persian'];

        $data = array(
            'categories'   => $this->categoryModel->category_tree_for_backend(0, '', $type_key),
            'robots'       => Tinyint::category_robots(),
            'type_persian' => $type_persian
        );
        return view("Backend.category.$get_type.index", $data);
    }


    public function create()
    {
        $get_type = $this->request->get_param('type');
        $get_id   = $this->request->get_param('id');

        if (!isset($get_type)) $get_type = 'product';

        $category = $this->categoryModel->first([
            'id' => $get_id
        ]) ?? 0;
        $data = array(
            'category'     => $category,
            'type_amounts' => $this->type_amounts($get_type),
            'robots'       => Tinyint::category_robots(),
        );
        return view("Backend.category.$get_type.create", $data);
    }


    public function store()
    {
        $params = $this->request->params();

        $get_type = $this->request->get_param('type');

        $type_key = $this->type_amounts($get_type)['type_key'];

        $request = array(
            'type'            => $type_key,
            'seo_description' => $params['seo_description'],
            'seo_title'       => $params['seo_title'],
            'parent_id'       => $params['id'],
            'name'            => $params['name'],
            'H1'              => $params['H1'],
            'robots'          => $params['robot'],
            'canonical'       => $params['canonical'],
            'description'     => $params['description'],
            'status'          => $params['status'] ?? '0',
            'slug'            => create_slug($params['slug']),
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
                    FlashMessage:: add("ایجاد دسته بندی با موفقیت انجام شد");
                } elseif ($is_create_photo) {
                    FlashMessage:: add(" ایجاد تصویر با موفقیت انجام شد", FlashMessage::ERROR);
                } else {
                    FlashMessage:: add(" مشکلی در ایجاد دسته بندی رخ داد ", FlashMessage::ERROR);
                }

                return $this->request->redirect("admin/category/$get_type");
            }
        } else {
            $this->categoryModel->create_category($request);
            FlashMessage:: add("مقادیر بدونه ضمیمه عکس با موفقیت  ذخیره شد", FlashMessage::WARNING);

            return $this->request->redirect("admin/category/$get_type");
        }
    }



    public function edit()
    {
        $id       = $this->request->get_param('id');
        $get_type = $this->request->get_param('type');

        $category = $this->categoryModel->first(['id' => $id]);
        $photo    = $this->photoModel->first([
            'entity_id'   => $id,
            'entity_type' => 'Category',
        ]);

        $data = array(
            'category' => $category,
            'photo'    => $photo,
            'robots'   => Tinyint::category_robots(),
        );

        return view("Backend.category.$get_type.edit", $data);
    }



    public function update()
    {
        $params   = $this->request->params();
        $get_type = $this->request->get_param('type');

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
                    FlashMessage:: add("ویرایش دسته بندی موفقیت انجام شد");
                } else {
                    FlashMessage:: add(" مشکلی در ویرایش دسته بندی رخ داد ", FlashMessage::ERROR);
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
            FlashMessage:: add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
        }
        return $this->request->redirect("admin/category/$id/edit/$get_type");
    }



    public function destroy()
    {
        $get_type = $this->request->get_param('type');

        $id     = $this->request->get_param('id');
        $is_cat = $this->categoryModel->has(['parent_id' => $id]);
        if ($is_cat == false) {
            $this->categoryModel->delete_category($id);
            $this->photoModel->delete_photo($id);

            FlashMessage:: add("دسته بندی با موفقیت حذف شد.");
            return $this->request->redirect("admin/category/$get_type");
        }
        FlashMessage:: add("به دلیل وجود زیر دسته امکان حذف وجود ندارد.", FlashMessage::ERROR);
        return $this->request->redirect("admin/category/$get_type");
    }


    public function type_amounts($type)
    {
        switch ($type) {
            case "blog":
                $type    = "blog";
                $key     = 1;
                $persian = "وبلاگ";
                break;

            case "comment": 
                $type    = "comment";
                $key     = 2;
                $persian = "دیدگاه ها";
                break;

            default: 
                $type    = "product";
                $key     = 0;
                $persian = "محصولات";
        }
        return ["type_key" => $key, "type_persian" => $persian, "type" => $type];
    }
}
