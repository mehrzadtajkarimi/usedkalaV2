<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Product;
use App\Models\Category;
use App\Models\Discount;
use App\Services\Auth\Auth;
use App\Utilities\FlashMessage;

class DiscountController extends Controller
{
    private $productModel;
    private $categoryModel;
    private $photoModel;
    private $discountModel;

    public function __construct()
    {
        parent::__construct();
        $this->productModel  = new Product();
        $this->categoryModel = new Category();
        $this->discountModel = new Discount();
    }

    public function index()
    {
        $data = array(
            'products'          => $this->productModel->read_product(),
            'discounts'         => $this->discountModel->read_discount(),
            'categories'        => $this->categoryModel->category_tree_for_backend(),
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
            'start_at'    => date("Y-m-d H:i:s", $params['start_at']),
            'finish_at'   => date("Y-m-d H:i:s", $params['finish_at']),
            'code'        => $params['code'],
            'description' => $params['discount-description'],
            'percent'     => $params['discount-percent'],
        );
        $discount_id =  $this->discountModel->create_discount($params_create);
        foreach ($params['discount-category'] as  $value) {
            $this->categoryModel->create_categoryDiscount([
                'discount_id' => $discount_id,
                'category_id' => $value,
            ]);
        }
        foreach ($params['discount-product'] as  $value) {
            $this->productModel->create_productDiscount([
                'discount_id' => $discount_id,
                'product_id' => $value,
            ]);
        }
        FlashMessage::add("مقادیر باموفقیت  ضمیمه شد و با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/discount');
    }

    public function show()
    {
    }

    public function edit()
    {
        $id = $this->request->get_param('id');

        $data = array(
            'discount'   => $this->discountModel->read_discount($id),
            'products'   => $this->productModel->read_productDiscount_by_id($id),
            'categories' => $this->categoryModel->category_tree_for_backend(),
        );
        view('Backend.discount.edit', $data);
    }


    public function update()
    {
        $params = $this->request->params();
        $id = $this->request->get_param('id');
        $params_update = array(
            'user_id'     => Auth::is_login(),
            'start_at'    => date("Y-m-d H:i:s", $params['start_at']),
            'finish_at'   => date("Y-m-d H:i:s", $params['finish_at']),
            'code'        => $params['discount-code'],
            'description' => $params['discount-description'],
            'percent'     => $params['discount-percent'],
        );
        $this->discountModel->update_discount($params_update,$id);
        foreach ($params['discount-category'] as  $value) {
            $this->categoryModel->update_categoryDiscount([
                'category_id' => $value,
            ],$id);
        }
        foreach ($params['discount-product'] as  $value) {
            $this->productModel->update_productDiscount([
                'product_id' => $value,
            ],$id);
        }
        FlashMessage::add("مقادیر باموفقیت  ضمیمه شد و با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/discount');
    }


    public function destroy()
    {
        $id = $this->request->get_param('id');
        dd($id);
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
