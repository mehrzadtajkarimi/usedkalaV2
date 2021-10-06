<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Product;
use App\Models\Product_sample;
use App\Models\Category;
use App\Models\Category_sample;
use App\Models\Sample;
use App\Services\Auth\Auth;
use App\Utilities\FlashMessage;

class SampleController extends Controller
{
    private $productModel;
    private $categoryModel;
    private $sampleModel;
    private $productSampleModel;
    private $categorySampleModel;

    public function __construct()
    {
        parent::__construct();
        $this->productModel        = new Product();
        $this->categoryModel       = new Category();
        $this->sampleModel         = new Sample();
        $this->productSampleModel  = new Product_sample();
        $this->categorySampleModel = new Category_sample();
    }

    public function index()
    {
        $data = array(
            'products'   => $this->productModel->read_product(),
            'samples'    => $this->sampleModel->read_sample(),
            'categories' => $this->categoryModel->category_tree_for_backend(),
        );
        view('Backend.sample.index', $data);
    }

    public function create()
    {
        $data = array(
            'products'   => $this->productModel->read_product(),
            'samples'    => $this->sampleModel->read_sample(),
            'categories' => $this->categoryModel->category_tree_for_backend(),
        );
        view('Backend.sample.create', $data);
    }

    public function store()
    {
        $params = $this->request->params();
        $params_create = array(
            'user_id'     => Auth::is_login(),
            'start_at'    => date("Y-m-d H:i:s", $params['start_at']),
            'finish_at'   => date("Y-m-d H:i:s", $params['finish_at']),
            'code'        => $params['code'],
            'title'       => $params['sample-title'],
            'description' => $params['sample-description'],
            'percent'     => $params['sample-percent'],
            'status'      => $params['product-status'] ?? 0,
        );
        $sample_id =  $this->sampleModel->create_sample($params_create);
        foreach ($params['sample-category'] as  $value) {
            $this->categorySampleModel->create_categorySample([
                'sample_id'   => $sample_id,
                'category_id' => $value,
            ]);
        }
        foreach ($params['sample-product'] as  $value) {
            $this->productSampleModel->create_productSample([
                'sample_id'  => $sample_id,
                'product_id' => $value,
            ]);
        }
        FlashMessage::add("مقادیر باموفقیت  ضمیمه شد و با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/sample');
    }

    public function show()
    {
    }

    public function edit()
    {
        $id               = $this->request->get_param('id');
        $categories_by_id = $this->categorySampleModel->read_categorySample($id);
        $products_by_id   = $this->productSampleModel->read_productSample($id);

        if ($categories_by_id) {
            foreach ($categories_by_id as  $value) {
                $categories_selected[] = $value['id'];
            }
        }
        if ($products_by_id) {
            foreach ($products_by_id as  $value) {
                $products_selected[] = $value['id'];
            }
        }

        $data = array(
            'sample'              => $this->sampleModel->read_sample($id),
            'categories'          => $this->categoryModel->category_tree_for_backend(),
            'products'            => $this->productModel->read_product(),
            'products_selected'   => $products_selected ?? [],
            'categories_selected' => $categories_selected ?? [],
        );
        view('Backend.sample.edit', $data);
    }


    public function update()
    {
        $params = $this->request->params();
        $id = $this->request->get_param('id');




        $params_update = array(
            'user_id'     => Auth::is_login(),
            'start_at'    => date("Y-m-d H:i:s", $params['start_at']),
            'finish_at'   => date("Y-m-d H:i:s", $params['finish_at']),
            'code'        => $params['sample-code'],
            'title'       => $params['sample-title'],
            'description' => $params['sample-description'],
            'percent'     => $params['sample-percent'],
            'status'      => $params['sample-status'] == 'on' ? 1 : 0,
        );
        $this->sampleModel->update_sample($params_update, $id);


        if (!empty($params['sample-category'])) {
            $this->categorySampleModel->delete_categorySample_by_sample_id($id);
            foreach ($params['sample-category'] as  $category_id) {
                $this->categorySampleModel->create_categorySample([
                    'sample_id' => $id,
                    'category_id' => $category_id,
                ]);
            }
        }
        if (!empty($params['sample-product'])) {
            $this->productSampleModel->delete_productSample_by_category_id($id);
            foreach ($params['sample-product'] as  $value) {
                $this->productSampleModel->create_productSample([
                    'sample_id'  => $id,
                    'product_id' => $value,
                ], $id);
            }
        }
        FlashMessage::add("مقادیر باموفقیت  ضمیمه شد و با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/sample');
    }


    public function destroy()
    {
        $id = $this->request->get_param('id');

        $is_deleted_categorySample = $this->categorySampleModel->delete_categorySample_by_sample_id($id);
        $is_deleted_productSample  = $this->productSampleModel->delete_productSample_by_category_id($id);
        $is_deleted_sample         = $this->sampleModel->delete_sample($id);

        if ($is_deleted_categorySample && $is_deleted_productSample && $is_deleted_sample) {
            # code...
            FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
            return $this->request->redirect('admin/sample');
        }
        FlashMessage::add(" مشکلی در حذف محصول پیش آمده است", FlashMessage::ERROR);
        return $this->request->redirect('admin/sample');
    }
}
