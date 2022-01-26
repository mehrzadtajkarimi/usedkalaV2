<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Product;
use App\Models\Product_discount;
use App\Models\Category;
use App\Models\Category_discount;
use App\Models\Discount;
use App\Services\Auth\Auth;
use App\Utilities\FlashMessage;

class DiscountController extends Controller
{
    private $productModel;
    private $categoryModel;
    private $discountModel;
    private $productDiscountModel;
    private $categoryDiscountModel;

    public function __construct()
    {
        parent::__construct();
        $this->productModel  = new Product();
        $this->categoryModel = new Category();
        $this->discountModel = new Discount();
        $this->productDiscountModel = new Product_discount();
        $this->categoryDiscountModel = new Category_discount();
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
        $data = array(
            'products'          => $this->productModel->read_product_all(),
            'discounts'         => $this->discountModel->read_discount(),
            // 'categories'        => $this->categoryModel->category_tree_for_backend(),
        );
        view('Backend.discount.create', $data);
    }

    public function store()
    {
        $params = $this->request->params();
        $params_create = array(
            'user_id'     => Auth::is_login(),
            'start_at'    => date("Y-m-d H:i:s", $params['start_at']),
            'finish_at'   => date("Y-m-d H:i:s", $params['finish_at']),
            'code'        => $params['code'],
            'title'       => $params['discount-title'],
            'description' => $params['discount-description'],
            'percent'     => $params['discount-percent'],
            'status'      => $params['discount-status'] ?? 0,
        );
        $discount_id =  $this->discountModel->create_discount($params_create);
        foreach ($params['discount-category'] as  $value) {
            $this->categoryDiscountModel->create_categoryDiscount([
                'discount_id' => $discount_id,
                'category_id' => $value,
            ]);
        }
        foreach ($params['discount-product'] as  $value) {
            $this->productDiscountModel->create_productDiscount([
                'discount_id' => $discount_id,
                'product_id' => $value,
            ]);
        }
        FlashMessage::add("مقادیر باموفقیت  ضمیمه شد و با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/discount');
    }

    public function show()
    {
        $id = $this->request->get_param('id');

        $discount = $this->productDiscountModel->join__with__productDiscount__product($id);

        echo json_encode( $discount);
    }

    public function edit()
    {
        $id = $this->request->get_param('id');
        // $categories_by_id = $this->categoryDiscountModel->join__with__categoryDiscount__product($id);
        // if ($categories_by_id) {
        //     foreach ($categories_by_id as  $value) {
        //         $categories_selected[] = $value['id'];
        //     }
        // }

        $products_by_id   = $this->productDiscountModel->join__with__productDiscount__product($id);

        if ($products_by_id) {
            foreach ($products_by_id as  $value) {
                $products_selected[] = $value['id'];
            }
        }
        $data = array(
            // 'categories'          => $this->categoryModel->category_tree_for_backend(),
            // 'categories_selected' => $categories_selected ?? [],

            'discount'            => $this->discountModel->read_discount($id),
            'products'            => $this->productModel->read_product_all(),
            'products_selected'   => $products_selected ?? [],
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
            'title'       => $params['discount-title'],
            'description' => $params['discount-description'],
            'percent'     => $params['discount-percent'],
            'status'      => $params['discount-status'] == 'on' ? 1 : 0,
        );
        $this->discountModel->update_discount($params_update, $id);


        if (!empty($params['discount-category'])) {
            $this->categoryDiscountModel->delete_categoryDiscount_by_discount_id($id);
            foreach ($params['discount-category'] as  $category_id) {
                $this->categoryDiscountModel->create_categoryDiscount([
                    'discount_id' => $id,
                    'category_id' => $category_id,
                ]);
            }
        }
        if (!empty($params['discount-product'])) {
            $this->productDiscountModel->delete_productDiscount_by_category_id($id);
            foreach ($params['discount-product'] as  $value) {
                $this->productDiscountModel->create_productDiscount([
                    'discount_id' => $id,
                    'product_id' => $value,
                ], $id);
            }
        }
        FlashMessage::add("مقادیر باموفقیت  ضمیمه شد و با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/discount');
    }


    public function destroy()
    {
        $id = $this->request->get_param('id');

        $is_deleted_categoryDiscount =   $this->categoryDiscountModel->delete_categoryDiscount_by_discount_id($id);
        $is_deleted_productDiscount =  $this->productDiscountModel->delete_productDiscount_by_category_id($id);
        $is_deleted_discount =  $this->discountModel->delete_discount($id);

        if ($is_deleted_categoryDiscount && $is_deleted_productDiscount && $is_deleted_discount) {
            # code...
            FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
            return $this->request->redirect('admin/discount');
        }
        FlashMessage::add(" مشکلی در حذف محصول پیش آمده است", FlashMessage::ERROR);
        return $this->request->redirect('admin/discount');
    }
}
