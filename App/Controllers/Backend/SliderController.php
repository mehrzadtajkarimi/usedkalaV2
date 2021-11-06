<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Category;
use App\Models\Photo;
use App\Models\Product;
use App\Models\Slider;
use App\Services\Auth\Auth;
use App\Services\Upload\UploadedFile;
use App\Utilities\FlashMessage;

class SliderController extends Controller
{
    private $sliderModel;
    private $categoryModel;
    private $productModel;
    private $photoModel;


    public function __construct()
    {
        parent::__construct();

        $this->sliderModel   = new Slider();
        $this->categoryModel = new Category();
        $this->photoModel    = new Photo();
        $this->productModel  = new Product();
    }

    public function index()
    {
        $data = array(
            'sliders'    => $this->sliderModel->read_slider(),
            'categories' => $this->categoryModel->read_category(),
            'products'   => $this->productModel->read_product(),
            'photos'     => $this->photoModel->read_photo(),
        );
        view('Backend.slider.index', $data);
    }

    public function create()
    {
    }

    public function store()
    {
        $params = $this->request->params();

        $params_create = array(
            'small_text'  => $params['slider-small'],
            'link'        => $params['slider-link'],
            'product_id'  => $params['product_id']??'',
            'category_id' => $params['category_id']??'',
            'description' => $params['slider-description'],
            'status'      => $params['slider-status'] ?? 0,
        );

        $files                   = $this->request->files();
        $files_param             = $files['slider_image'];
        // if ($files_param['size']< 150000) {
        //     FlashMessage::add("حجم عکس باید بالا 150 k ", FlashMessage::WARNING);
        //     return $this->request->redirect('admin/slider');
        // }
        $files_param_tmp_name    = $files_param['tmp_name'];
        $check_file_param_exists = !empty($files_param_tmp_name[0]);
        if ($check_file_param_exists) {
            $is_create_slider = $this->sliderModel->create_slider($params_create);
            $file = new UploadedFile($files_param);
            $file_paths = $file->save();
            if ($file_paths) {
                foreach ($file_paths as $key => $path) {
                    $is_create_photo   = $this->photoModel->create_photo('Slider', $is_create_slider, $path, 'slider_image', $key);
                }

                if ($is_create_slider) {
                    FlashMessage::add("ایجاد اسلایدر با موفقیت انجام شد");
                } elseif ($is_create_photo) {
                    FlashMessage::add(" ایجاد تصویر موفقیت انجام شد", FlashMessage::ERROR);
                } else {
                    FlashMessage::add(" مشکلی در ایجاد اسلایدر رخ داد ", FlashMessage::ERROR);
                }
                return $this->request->redirect('admin/slider');
            }
        } else {
            $this->sliderModel->create_slider($params_create);
            FlashMessage::add("مقادیر بدونه ضمیمه عکس با موفقیت در دیتابیس ذخیره شد", FlashMessage::WARNING);
            return $this->request->redirect('admin/slider');
        }

    }

    public function show()
    {
    }

    public function edit()
    {
        $id               = $this->request->get_param('id');


        $data = array(
            'slider'     => $this->sliderModel->read_slider($id),
            'photo'      => $this->photoModel->read_photo($id),
            'categories' => $this->categoryModel->read_category(),
            'products'   => $this->productModel->read_product($id),

        );
        view('Backend.slider.edit', $data);
    }


    public function update()
    {
        $params = $this->request->params();
        $id = $this->request->get_param('id');



        $params_update = array(
            'small_text'  => $params['slider-small'],
            'link'        => $params['slider-link'],
            'description' => $params['slider-description'],
            'status'      => $params['slider-status'] == 'on' ? 1 : 0,
            'product_id'  => $params['product_id']??'',
            'category_id' => $params['category_id']??'',
        );
        $this->sliderModel->update_slider($params_update, $id['id']);




        $files                   = $this->request->files();
        $files_param             = $files['slider_image'];
        $check_file_param_exists = !empty($files_param);
        if ($check_file_param_exists) {
            $file = new UploadedFile($files_param);
            $file_paths = $file->save();
            if ($file_paths) {

                $is_update_photo = $this->photoModel->update_photo('Slider', $id, $file_paths[0], 'slider_image');

                if ($is_update_photo) {
                    FlashMessage::add("ویرایش اسلایدر بندی موفقیت انجام شد");
                } else {
                    FlashMessage::add(" مشکلی در ویرایش اسلایدر رخ داد ", FlashMessage::ERROR);
                }
            }
        } else {
            $this->sliderModel->update_slider($params_update, $id);
            FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
        }
        return $this->request->redirect('admin/slider');
    }


    public function destroy()
    {
        $id                = $this->request->get_param('id');
        $is_deleted_slider = $this->sliderModel->delete_slider($id);
        $is_deleted_photo  = $this->photoModel->delete_photo($id);
        if ($is_deleted_slider && $is_deleted_photo) {
            FlashMessage::add("مقادیر  با موفقیت از دیتابیس حذف شد ");
            return $this->request->redirect('admin/slider');
        }
        if ($is_deleted_slider ) {
            FlashMessage::add("اسلایدر بدون عکس با موفقیت از دیتابیس حذف شد", FlashMessage::WARNING);
            return $this->request->redirect('admin/slider');
        }
        FlashMessage::add(" مشکلی در حذف محصول پیش آمده است", FlashMessage::ERROR);
        return $this->request->redirect('admin/slider');
    }
}
