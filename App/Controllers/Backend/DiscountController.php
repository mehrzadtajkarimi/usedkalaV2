<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Brand;
use App\Models\Product;
use App\Models\Category;
use App\Models\Discount;
use App\Models\Photo;
use App\Services\Auth\Auth;
use App\Services\Upload\UploadedFile;
use App\Utilities\FlashMessage;

class DiscountController extends Controller
{
    private $productModel;
    private $categoryModel;
    private $brandModel;
    private $photoModel;
    private $discountModel;

    public function __construct()
    {
        parent::__construct();
        $this->productModel  = new Product();
        $this->categoryModel = new Category();
        $this->brandModel    = new Brand();
        $this->photoModel    = new Photo();
        $this->discountModel = new Discount();
    }

    public function index()
    {
        $data = array(
                'products'          => $this->productModel->read_product(),
                'discounts'         => $this->discountModel->read_discount(),
                'brands'            => $this->brandModel->read_brand(),
                'categories'        => $this->categoryModel->category_tree_for_backend(),
                'photo'             => $this->photoModel->read_photo(),
                'discount_entities' => ['User','Product','Category','Brand'],
        );
        view('Backend.discount.index', $data);
    }

    public function create()
    {
    }

    public function store()
    {
        $params = $this->request->params();

        $params_create = array(
            'user_id'     => Auth::is_login(),
            'code'        => $params['code'],
            'start_at'    => date("Y-m-d H:i:s", $params['start_at']),
            'finish_at'   => date("Y-m-d H:i:s", $params['finish_at']),
            'entity_type' => $params['discount-entity_type'],
            'description' => $params['discount-description'],
            'percent'     => $params['discount-percent'],
        );


           $a= $this->discountModel->create_discount($params_create);
           dd($a);
            FlashMessage::add("مقادیر بدونه ضمیمه عکس با موفقیت در دیتابیس ذخیره شد", FlashMessage::WARNING);
            return $this->request->redirect('admin/discount');
        
    }

    public function show()
    {
    }

    public function edit()
    {
        $id = $this->request->get_param('id');
        $data = array(
            'products'   => $this->productModel->read_product($id),
            'brands'     => $this->brandModel->read_brand(),
            'categories' => $this->categoryModel->category_tree_for_backend(),
            'photo'      => $this->photoModel->read_photo($id),
        );
        view('Backend.product.edit', $data);
    }


    public function update()
    {
        $params = $this->request->params();

        $id = $this->request->get_param('id');

        $params_updated = array(
            'user_id'     => Auth::is_login(),
            'slug'        => create_slug($params['product-slug']),
            'title'       => $params['product-name'],
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
        );

        $files                   = $this->request->files();
        $files_param             = $files['product_image'];
        $check_file_param_exists = !empty($files_param);
        if ($check_file_param_exists) {
            $file = new UploadedFile($files_param);
            $file_paths = $file->save();
            if ($file_paths) {

                $is_update_photo = $this->photoModel->update_photo('Product', $id, $file_paths[0], 'product_image');

                if ($is_update_photo) {
                    FlashMessage::add("ویرایش محصول بندی موفقیت انجام شد");
                } else {
                    FlashMessage::add(" مشکلی در ویرایش محصول بندی رخ داد ", FlashMessage::ERROR);
                }
            }
        } else {
            $this->productModel->update_product($params_updated, $id);
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