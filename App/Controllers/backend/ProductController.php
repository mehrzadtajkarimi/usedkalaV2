<?php

namespace App\Controllers\backend;

use App\Controllers\Controller;
use App\Models\product;
use App\Models\Category;
use App\Models\Product;
use App\Services\Upload\UploadedFile;
use App\Utilities\FlashMessage;

class ProductController extends Controller
{
    private $productModel;
    private $categoryModel;
    private $productModel;

    public function __construct()
    {
        parent::__construct();
        $this->productModel = new Product();
        $this->categoryModel = new Category();
        $this->productModel = new product();
    }

    public function index()
    {
        $data = array(
            'products' => $this->productModel->read_product(),
            'categories' => $this->categoryModel->category_tree(),
            'products' => $this->productModel->read_product(),
        );
        view('backend.product.index', $data);
    }

    public function create()
    {

    }

    public function store()
    {
        $param=$this->request->params();
        return $this->productModel->create([
            'name' => $param['name'],
            'category_id' => $param['product-category'],
            'brand_id' => $param['product-brand'],
        ]);




        $params = $this->request->params();

        $files = $this->request->files();
        if (!empty($files['product_image']['tmp_name'])) {
            $file = new UploadedFile('product_image');
            $file_url = $file->save();
            if ($file_url) {


                $is_create_product = $this->productModel->create_product($params);
                $is_create_photo = $this->photoModel->create_photo('products', $is_create_product, $file_url, 'product_image');


                if ($is_create_photo && $is_create_product) {
                    FlashMessage::add("ایجاد برند موفقیت انجام شد");
                } else {
                    FlashMessage::add(" مشکلی در ایجاد برند رخ داد ", FlashMessage::ERROR);
                }
                return $this->request->redirect('admin/product');
            }
        } else {
            $this->productModel->create_product($params);
            FlashMessage::add("مقادیر بدونه ضمیمه عکس با موفقیت در دیتابیس ذخیره شد", FlashMessage::WARNING);
            return $this->request->redirect('admin/product');
        }
    }

    public function show()
    {
        $id = $this->request->get_param('id');
        $categories = $this->productModel->inner_join_two('categories', 'photos', 'id', 'entity_id', 'categories.parent_id' . '=' . $id);


        $data = array(
            'categories' => $categories,
        );

        return view('frontend.product.show', $data);
    }

    public function edit()
    {
        //
    }


    public function update()
    {
        //
    }


    public function destroy()
    {
        //
    }
}
