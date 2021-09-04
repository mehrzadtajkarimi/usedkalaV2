<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Category;
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


    public function __construct()
    {
        parent::__construct();

        $this->sliderModel   = new Slider();
        $this->categoryModel = new Category();
        $this->productModel  = new Product();
    }

    public function index()
    {
        $data = array(
            'sliders'    => $this->sliderModel->read_slider(),
            'categories' => $this->categoryModel->read_category(),
            'products'   => $this->productModel->read_product(),
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
            'product_id'  => $params['product_id'],
            'category_id' => $params['category_id'],
            'small_text'  => $params['slider-small'],
            'description' => $params['slider-description'],
            'status'      => $params['slider-status'] ?? 0,
        );


        $files                   = $this->request->files();
        dd($files);
        $files_param             = $files['slider_image'];
        $files_param_tmp_name    = array_filter($files_param['tmp_name']);
        $check_file_param_exists = !empty($files_param_tmp_name[0]);
        if ($check_file_param_exists) {
            $is_create_slider = $this->sliderModel->create_slider($params_create);
            $file = new UploadedFile($files_param);
            $file_paths = $file->save();
            if ($file_paths) {
                foreach ($file_paths as $key => $path) {
                    $is_create_photo   = $this->photoModel->create_photo('slider', $is_create_slider, $path, 'slider_image', $key);
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
            'slider'   => $this->sliderModel->read_slider($id),
            'sliders' => $this->sliderModel->read_slider(),

        );
        view('Backend.slider.edit', $data);
    }


    public function update()
    {
        $params = $this->request->params();
        $id = $this->request->get_param('id');

        $params_update = array(
            'user_id'     => Auth::is_login(),
            'start_at'    => date("Y-m-d H:i:s", $params['start_at']),
            'finish_at'   => date("Y-m-d H:i:s", $params['finish_at']),

            'title'       => $params['slider-title'],
            'description' => $params['slider-description'],

            'status'      => $params['slider-status'] == 'on' ? 1 : 0,
        );
        $this->sliderModel->update_slider($params_update, $id);



        FlashMessage::add("مقادیر باموفقیت  ضمیمه شد و با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/slider');
    }


    public function destroy()
    {
        $id = $this->request->get_param('id');

        $is_deleted_slider =  $this->sliderModel->delete_slider($id);

        FlashMessage::add(" مشکلی در حذف اسلایدر پیش آمده است", FlashMessage::ERROR);
        return $this->request->redirect('admin/slider');
    }
}
