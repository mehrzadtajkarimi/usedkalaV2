<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Product;
use App\Models\Product_coupon;
use App\Models\Category;
use App\Models\Coupon;
use App\Services\Auth\Auth;
use App\Utilities\FlashMessage;

class CouponController extends Controller
{
    private $productModel;
    private $categoryModel;
    private $couponModel;
    private $productCouponModel;

    public function __construct()
    {
        parent::__construct();
        $this->productModel       = new Product();
        $this->categoryModel      = new Category();
        $this->couponModel        = new Coupon();
        $this->productCouponModel = new Product_coupon();
    }

    public function index()
    {
        $data = array(
            'products' => $this->productModel->read_product(),
            'coupons'  => $this->couponModel->read_coupon(),
        );
        view('Backend.coupon.index', $data);
    }

    public function create()
    {
        $data = array(
            'products' => $this->productModel->read_product(),
            'coupons'  => $this->couponModel->read_coupon(),
        );
        view('Backend.coupon.create', $data);
    }

    public function store()
    {
        $params        = $this->request->params();
        $params_create = array(
            'user_id'     => Auth::is_login(),
            'start_at'    => date("Y-m-d H:i:s", $params['start_at']),
            'finish_at'   => date("Y-m-d H:i:s", $params['finish_at']),
            'code'        => $params['code'],
            'title'       => $params['coupon-title'],
            'description' => $params['coupon-description'],
            'percent'     => $params['coupon-percent'],
            'status'      => $params['coupon-status'] ?? 0,
        );
        $coupon_id = $this->couponModel->create_coupon($params_create);

        foreach ($params['coupon-product'] as  $value) {
            $this->productCouponModel->create_productCoupon([
                'coupon_id'  => $coupon_id,
                'product_id' => $value,
            ]);
        }
        FlashMessage::add("مقادیر باموفقیت  ضمیمه شد و با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/coupon');
    }

    public function show()
    {
    }

    public function edit()
    {
        $id               = $this->request->get_param('id');
        $products_by_id   = $this->productCouponModel->read_productCoupon($id);



        if ($products_by_id) {
            foreach ($products_by_id as  $value) {
                $products_selected[] = $value['product_id'];
            }
        }


        $data = array(
            'coupon'              => $this->couponModel->read_coupon($id),
            'products'            => $this->productModel->read_product(),
            'products_selected'   => $products_selected ?? [],
        );
        view('Backend.coupon.edit', $data);
    }


    public function update()
    {
        $params = $this->request->params();
        $id     = $this->request->get_param('id');

        $params_update = array(
            'user_id'     => Auth::is_login(),
            'start_at'    => date("Y-m-d H:i:s", $params['start_at']),
            'finish_at'   => date("Y-m-d H:i:s", $params['finish_at']),
            'code'        => $params['coupon-code'],
            'title'       => $params['coupon-title'],
            'description' => $params['coupon-description'],
            'percent'     => $params['coupon-percent'],
            'status'      => $params['coupon-status'] == 'on' ? 1 : 0,
        );
        $this->couponModel->update_coupon($params_update, $id);


        if (!empty($params['coupon-product'])) {
            $this->productCouponModel->delete_productCoupon_by_coupon_id($id);
            foreach ($params['coupon-product'] as  $value) {
                $this->productCouponModel->create_productCoupon([
                    'coupon_id'  => $id,
                    'product_id' => $value,
                ], $id);
            }
        }
        FlashMessage::add("مقادیر باموفقیت  ضمیمه شد و با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/coupon');
    }


    public function destroy()
    {
        $id = $this->request->get_param('id');

        $is_deleted_coupon = $this->couponModel->delete_coupon($id);

        if ($is_deleted_coupon) {
            FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
            return $this->request->redirect('admin/coupon');
        }
        FlashMessage::add(" مشکلی در حذف محصول پیش آمده است", FlashMessage::ERROR);
        return $this->request->redirect('admin/coupon');
    }
}
