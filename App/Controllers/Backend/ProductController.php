<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Brand;
use App\Models\Product;
use App\Models\Category;
use App\Models\Photo;
use App\Services\Auth\Auth;
use App\Services\Upload\UploadedFile;
use App\Utilities\FlashMessage;

class ProductController extends Controller
{
    private $productModel;
    private $categoryModel;
    private $brandModel;
    private $photoModel;

    public function __construct()
    {
        parent::__construct();
        $this->productModel  = new Product();
        $this->categoryModel = new Category();
        $this->brandModel    = new Brand();
        $this->photoModel    = new Photo();
    }

    public function index()
    {
        $data = array(
            'products'   => $this->productModel->read_product(),
            'brands'     => $this->brandModel->read_brand(),
            'categories' => $this->categoryModel->category_tree(),
            'photo'      => $this->photoModel->read_photo(),
        );
        view('Backend.product.index', $data);
    }

    public function create()
    {
    }

    public function store()
    {
        $params = $this->request->params();

        $params_create = array(
            'user_id'     => Auth::is_login(),
            'title'       => $params['product-name'],
            'slug'        => $params['product-slug'],
            'price'       => $params['product-price'],
            'sale_price'  => $params['product-sale'],
            'category_id' => $params['product-category'],
            'brand_id'    => $params['product-brand'],
            'sku'         => $params['product-sku'],
            'weight'      => $params['product-weight'],
            'quantity'    => $params['product-quantity'],
            'meta_title'  => $params['product-meta'],
            'description' => $params['product-description'],
            'featured'    => $params['product-featured'] ?? 0,
        );




        $files_param = $this->request->files();

        // echo '<pre>';
        // var_dump($files_repair);
        // echo '</pre><br>';
        // echo '<pre>';

        // echo '<pre>';
        // var_dump(array_keys($files)[0]);
        // echo '</pre><br>';
        // echo '<pre>';

        // echo '<pre>';
        // var_dump(is_array($files));
        // echo '</pre><br>';
        // echo '<pre>';
        // echo '<pre>';
        // var_dump($files[array_keys($files)[0]]['tmp_name']);
        // echo '</pre><br>';
        // echo '<pre>';
        // echo '<pre>';
        // var_dump(array_values($files));
        // echo '</pre><br>';
        // echo '<pre>';




        // die;
        // array_keys($files_param)[0] output : name input file
        if (!empty($files_param[array_keys($files_param)[0]]['tmp_name'][0])) {
            $is_create_product = $this->productModel->create_product($params_create);

            $file = new UploadedFile($files_param);
            $file_url = $file->save();
            if ($file_url) {

                $is_create_photo   = $this->photoModel->create_photo('Product', $is_create_product, $file_url, 'product_image');

                if ($is_create_product) {
                    FlashMessage::add("ایجاد محصول موفقیت انجام شد");
                } elseif ($is_create_photo) {
                    FlashMessage::add(" ایجاد تصویر موفقیت انجام شد", FlashMessage::ERROR);
                } else {
                    FlashMessage::add(" مشکلی در ایجاد محصول رخ داد ", FlashMessage::ERROR);
                }
                return $this->request->redirect('admin/product');
            }
        } else {
            $this->productModel->create_product($params_create);
            FlashMessage::add("مقادیر بدونه ضمیمه عکس با موفقیت در دیتابیس ذخیره شد", FlashMessage::WARNING);
            return $this->request->redirect('admin/product');
        }
    }

    public function show()
    {
    }

    public function edit()
    {
        $id = $this->request->get_param('id');
        $data = array(
            'products'   => $this->productModel->read_product(['id' => $id]),
            'brands'     => $this->brandModel->read_brand(),
            'categories' => $this->categoryModel->category_tree(),
            'photo'      => $this->photoModel->read_photo($id),
        );
        view('Backend.product.edit', $data);
    }


    public function update()
    {
        $id = $this->request->get_param('id');
        $params = $this->request->params();

        $files = $this->request->files();
        if (!empty($files['product_image']['tmp_name'])) {
            $file = new UploadedFile('product_image');
            $file_url = $file->save();
            if ($file_url) {
                $is_update_photo = $this->photoModel->update_photo('Product', $id, $file_url, 'product_image');

                if ($is_update_photo) {
                    FlashMessage::add("ویرایش محصول بندی موفقیت انجام شد");
                } else {
                    FlashMessage::add(" مشکلی در ویرایش محصول بندی رخ داد ", FlashMessage::ERROR);
                }
            }
        } else {
            $this->productModel->update_product([
                'user_id'     => Auth::is_login(),
                'title'       => $params['product-name'],
                'slug'        => $params['product-slug'],
                'price'       => $params['product-price'],
                'sale_price'  => $params['product-sale'],
                'category_id' => $params['product-category'],
                'brand_id'    => $params['product-brand'],
                'sku'         => $params['product-sku'],
                'weight'      => $params['product-weight'],
                'quantity'    => $params['product-quantity'],
                'meta_title'  => $params['product-meta'],
                'description' => $params['product-description'],
                'featured'    => $params['product-featured'] == 'on' ? 1 : 0,
                'status'      => $params['product-status'] == 'on' ? 1 : 0,
            ], $id);
            FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
        }
        return $this->request->redirect('admin/product');
    }


    public function destroy()
    {
        $id = $this->request->get_param('id');
        $is_deleted_product = $this->productModel->delete_product($id);
        $is_deleted_photo   = $this->photoModel->delete_photo($id);
        if ($is_deleted_product && $is_deleted_photo) {
            # code...
            FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
            return $this->request->redirect('admin/product');
        }
        FlashMessage::add(" مشکلی در حذف محصول پیش آمده است", FlashMessage::ERROR);
        return $this->request->redirect('admin/product');
    }
}
