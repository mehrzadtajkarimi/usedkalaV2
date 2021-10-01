<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Brand;
use App\Models\Product;
use App\Models\Category;
use App\Models\Photo;
use App\Models\Product_category;
use App\Services\Auth\Auth;
use App\Services\Upload\UploadedFile;
use App\Utilities\FlashMessage;

class ProductController extends Controller
{
    private $productModel;
    private $categoryModel;
    private $brandModel;
    private $photoModel;
    private $productCategoriesModel;

    public function __construct()
    {
        parent::__construct();
        $this->productModel           = new Product();
        $this->categoryModel          = new Category();
        $this->brandModel             = new Brand();
        $this->photoModel             = new Photo();
        $this->productCategoriesModel = new Product_category();
    }

    public function index()
    {
        $data = array(
            'products'   => $this->productModel->read_product(),
            'brands'     => $this->brandModel->read_brand(),
            'categories' => $this->categoryModel->category_tree_for_backend(),
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
            'slug'        => create_slug($params['product-slug']),
            'title'       => $params['product-name'],
            'price'       => $params['product-price'],
            'brand_id'    => $params['product-brand'],
            'sku'         => $params['product-sku'],
            'weight'      => $params['product-weight'],
            'quantity'    => $params['product-quantity'],
            'meta_title'  => $params['product-meta'],
            'description' => $params['product-description'],
            'featured'    => $params['product-featured'] ?? 0,
            'sale'        => $params['product-sale'] ?? 0,
        );

        $files                   = $this->request->files();
        $files_param             = $files['product_image'];
        $files_param_tmp_name    = array_filter($files_param['tmp_name']);
        $check_file_param_exists = !empty($files_param_tmp_name[0]);
        if ($check_file_param_exists) {
            $product_id = $this->productModel->create_product($params_create);
            foreach ($params['product-category'] as  $category_id) {
              $is_create_product=  $this->productCategoriesModel->create_productCategories($product_id, $category_id);
            }
            $file = new UploadedFile($files_param);
            $file_paths = $file->save();
            if ($file_paths) {
                foreach ($file_paths as $key => $path) {
                    $is_create_photo   = $this->photoModel->create_photo('Product', $product_id, $path, 'product_image', $key);
                }

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
            $product_id = $this->productModel->create_product($params_create);
            foreach ($params['product-category'] as  $category_id) {
                $this->productCategoriesModel->create_productCategories($product_id, $category_id);
            }
            FlashMessage::add("مقادیر بدونه ضمیمه عکس با موفقیت در دیتابیس ذخیره شد", FlashMessage::WARNING);
            return $this->request->redirect('admin/product');
        }
    }

    public function show()
    {
    }

    public function edit()
    {
        $products_id = $this->request->get_param('id');
        $category_id = $this->productCategoriesModel->read_productCategories($products_id);

        if ($category_id) {
            foreach ($category_id as  $value) {
                $categories_selected[] = $value['id'];
            }
        }
        $data = array(
            'products'            => $this->productModel->read_product($products_id),
            'photo'               => $this->photoModel->read_photo($products_id),
            'brands'              => $this->brandModel->read_brand(),
            'categories'          => $this->categoryModel->category_tree_for_backend(),
            'categories_selected' => $categories_selected ?? [],
        );
        view('Backend.product.edit', $data);
    }


    public function update()
    {
        $params = $this->request->params();

        $product_id = $this->request->get_param('id');
        $params_updated = array(
            'user_id'     => Auth::is_login(),
            'slug'        => create_slug($params['product-slug']),
            'title'       => $params['product-name'],
            'price'       => $params['product-price'],
            'brand_id'    => $params['product-brand'],
            'sku'         => $params['product-sku'],
            'weight'      => $params['product-weight'],
            'quantity'    => $params['product-quantity'],
            'meta_title'  => $params['product-meta'],
            'description' => $params['product-description'],
            'featured'    => $params['product-featured'] == 'on' ? 1 : 0,
            'sale'        => $params['product-sale'] == 'on' ? 1 : 0,
            'status'      => $params['product-status'] == 'on' ? 1 : 0,
        );
        $this->productModel->update_product($params_updated, $product_id);
        foreach ($params['product-category'] as  $category_id) {
              $this->productCategoriesModel->update_productCategories($category_id, $product_id);
          }
        $this->productCategoriesModel->update_productCategories($params_updated, $product_id);
        $files                   = $this->request->files();
        $files_param             = $files['product_image'];
        $check_file_param_exists = !empty($files_param);
        if ($check_file_param_exists) {
            $file = new UploadedFile($files_param);
            $file_paths = $file->save();
            if ($file_paths) {

                $is_update_photo = $this->photoModel->update_photo('Product', $product_id, $file_paths[0], 'product_image');

                if ($is_update_photo) {
                    FlashMessage::add("ویرایش محصول بندی موفقیت انجام شد");
                } else {
                    FlashMessage::add(" مشکلی در ویرایش محصول بندی رخ داد ", FlashMessage::ERROR);
                }
            }
        }
        FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/product');
    }


    public function destroy()
    {
        $id = $this->request->get_param('id');
        $is_deleted_product = $this->productModel->delete($id);
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
