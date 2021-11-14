<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Brand;
use App\Models\Product;
use App\Models\Category;
use App\Models\Photo;
use App\Models\Product_category;
use App\Models\Product_tag;
use App\Models\Tag;
use App\Services\Auth\Auth;
use App\Services\Upload\UploadedFile;
use App\Utilities\FlashMessage;
use App\Utilities\Tinyint;

class ProductController extends Controller
{
    private $productModel;
    private $categoryModel;
    private $brandModel;
    private $photoModel;
    private $tagModel;
    private $productCategoriesModel;
    private $productTagModel;

    public function __construct()
    {
        parent::__construct();
        $this->productModel           = new Product();
        $this->categoryModel          = new Category();
        $this->brandModel             = new Brand();
        $this->photoModel             = new Photo();
        $this->tagModel               = new Tag();
        $this->productCategoriesModel = new Product_category();
        $this->productTagModel        = new Product_tag();
    }

    public function index()
    {
        $data = array(
            'products'   => $this->productModel->read_product(),
            'brands'     => $this->brandModel->read_brand(),
            'categories' => $this->categoryModel->category_tree_for_backend(),
            'photo'      => $this->photoModel->read_photo(),
            'tags'       => $this->tagModel->read_tag() ?? '',
            'robots'     => Tinyint::category_robots(),
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
            'user_id'       => Auth::is_login(),
            'slug'          => create_slug($params['product-slug']),
            'title'         => $params['product-name'],
            'price'         => $params['product-price'],
            'brand_id'      => $params['product-brand'],
            'sku'           => $params['product-sku'],
            'weight'        => $params['product-weight'],
            'quantity'      => $params['product-quantity'],
            'meta_title'    => $params['product-meta'],
            'description'   => $params['product-description'],

            'seo_H1'        => $params['seo-H1'],
            'seo_canonical' => $params['seo-canonical'],
            'seo_title'     => $params['seo-title'],
            'seo_robots'    => $params['seo-robots'],
        );

        $files                   = $this->request->files();
        $files_param             = $files['product_image'];
        $files_param_tmp_name    = array_filter($files_param['tmp_name']);
        $check_file_param_exists = !empty($files_param_tmp_name[0]);
        if ($check_file_param_exists) {
            $product_id = $this->productModel->create_product($params_create);
            foreach ($params['product-category'] as  $category_id) {
                $is_create_product =  $this->productCategoriesModel->create_productCategories([
                    'product_id'  => $product_id,
                    'category_id' => $category_id
                ]);
            }
            foreach ($params['product-tag'] as  $tag_id) {
                $is_create_product =  $this->productTagModel->create_productTag([
                    'product_id'  => $product_id,
                    'tag_id' => $tag_id
                ]);
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
                $this->productCategoriesModel->create_productCategories([
                    'product_id'  => $product_id,
                    'category_id' => $category_id
                ]);
            }
            foreach ($params['product-tag'] as  $tag_id) {
                $is_create_product =  $this->productTagModel->create_productTag([
                    'product_id'  => $product_id,
                    'tag_id' => $tag_id
                ]);
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
        $categories_selected = $this->productCategoriesModel->read_productCategories($products_id);
        $tags_selected       = $this->productTagModel->read_productTag($products_id);
        $selectedCats = [];
        foreach ($categories_selected as $selectedCatRow) {
            $selectedCats[$selectedCatRow['id']] = $selectedCatRow;
        }
        $selectedTags = [];
        foreach ($tags_selected as $selectedTagRow) {
            $selectedTags[$selectedTagRow['id']] = $selectedTagRow;
        }
        $photo = $this->photoModel->read_photo($products_id);
        // var_dump($photo);
        // die();
        $data = array(
            'products'            => $this->productModel->read_product($products_id),
            'photo'               => $photo,
            'brands'              => $this->brandModel->read_brand(),
            'tags'                => $this->tagModel->read_tag(),
            'categories'          => $this->categoryModel->category_tree_for_backend(),
            'categories_selected' => $selectedCats,
            'tags_selected'       => $selectedTags,
            'robots'              => Tinyint::category_robots(),
        );
        view('Backend.product.edit', $data);
    }


    public function update()
    {
        $params = $this->request->params();

        $product_id = $this->request->get_param('id');
        $params_updated = array(
            'user_id'         => Auth::is_login(),
            'slug'            => create_slug($params['product-slug']),
            'title'           => $params['product-name'],
            'price'           => $params['product-price'],
            'brand_id'        => $params['product-brand'],
            'sku'             => $params['product-sku'],
            'weight'          => $params['product-weight'],
            'quantity'        => $params['product-quantity'],
            'meta_title'      => $params['product-meta'],
            'description'     => $params['product-description'],
            'featured'        => $params['product-featured'] ?? 1,
            'sale'            => $params['product-sale'] ?? 1,
            'status'          => $params['product-status'] ?? 1,
            'seo_H1'          => $params['seo-H1'],
            'seo_canonical'   => $params['seo-canonical'],
            'seo_title'       => $params['seo-title'],
            'seo_robot'       => $params['seo-robot'],
            'seo_description' => $params['seo-description'],
        );
        $this->productModel->update_product($params_updated, $product_id['id']);


        if (!empty($params['product-category'])) {
            $this->productCategoriesModel->delete_productCategories_by_product_id($product_id['id']);
            foreach ($params['product-category'] as  $category_id) {
                $this->productCategoriesModel->create_productCategories([
                    'product_id'  => $product_id['id'],
                    'category_id' => $category_id,
                ]);
            }
        }
        if (!empty($params['product-tag'])) {
            $this->productTagModel->delete_productTag_by_product_id($product_id['id']);
            foreach ($params['product-tag'] as  $tag_id) {
                $this->productTagModel->create_productTag([
                    'product_id' => $product_id['id'],
                    'tag_id'     => $tag_id,
                ]);
            }
        }

        $files                   = $this->request->files();
        $files_param             = $files['product_image'];
        $check_file_param_exists = !empty($files_param);
        if ($check_file_param_exists) {
            $file       = new UploadedFile($files_param);
            $file_paths = $file->save();
            if ($file_paths) {

                $is_update_photo = $this->photoModel->update_photo('Product', $product_id['id'], $file_paths[0], 'product_image');

                if ($is_update_photo) {
                    FlashMessage::add("ویرایش محصول با موفقیت انجام شد");
                } else {
                    FlashMessage::add(" مشکلی در ویرایش محصول رخ داد ", FlashMessage::ERROR);
                }
            }
        }
        FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/product');
    }


    public function destroy()
    {
        $id = $this->request->get_param('id');
        $is_deleted_productCategories = $this->productCategoriesModel->delete_productCategories_by_product_id($id['id']);
        $is_deleted_productTags       = $this->productTagModel->delete_productTag_by_product_id($id['id']);
        $is_deleted_photo             = $this->photoModel->delete_photo($id);
        $is_deleted_product           = $this->productModel->delete_product($id);




        if ($is_deleted_productCategories && $is_deleted_productTags &&  $is_deleted_product && $is_deleted_photo) {
            FlashMessage::add("مقادیر  با موفقیت از دیتابیس حذف شد");
            return $this->request->redirect('admin/product');
        }
        if ($is_deleted_productCategories &&  $is_deleted_product && $is_deleted_photo) {
            FlashMessage::add("مقادیر ( تگ )  با موفقیت از دیتابیس حذف شد");
            return $this->request->redirect('admin/product');
        }
        if ($is_deleted_product && $is_deleted_photo) {
            FlashMessage::add("مقادیر (بدون دسته بندی و تگ )  با موفقیت از دیتابیس حذف شد");
            return $this->request->redirect('admin/product', FlashMessage::WARNING);
        }
        if ($is_deleted_product) {
            FlashMessage::add("مقادیر (بدون دسته بندی و عکس و تگ )  با موفقیت از دیتابیس حذف شد");
            return $this->request->redirect('product', FlashMessage::WARNING);
        }
        FlashMessage::add(" مشکلی در حذف محصول پیش آمده است", FlashMessage::ERROR);
        return $this->request->redirect('admin/product');
    }
}
