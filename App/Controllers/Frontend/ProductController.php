<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Comment;
use App\Models\Photo;
use App\Models\Product;
use App\Models\Product_discount;
use App\Services\Session\SessionManager;
use App\Utilities\FlashMessage;

class ProductController extends Controller
{
    private $productModel;
    private $photoModel;
    private $commentModel;

    public function __construct()
    {
        parent::__construct();
        $this->commentModel         = new Comment();
        $this->productModel         = new Product();
        $this->photoModel           = new Photo();
        $this->ProductDiscountModel = new Product_discount();
    }

    public function index()
    {
        $id       = $this->request->get_param('id');
        $products = $this->productModel->join_product_to_photo_by_category_id($id);
        $data     = array(
            'products' => $products,
        );
        view('Frontend.product.index', $data);
    }

    public function show()
    {
        $id = $this->request->get_param('id');

        $photos          = $this->photoModel->read_photo_by_id($id, 'Product');
        $photo           = $this->photoModel->read_single_photo_by_id('0', $id, 'Product')[0];
        $product         = $this->productModel->read_product($id);
        $productDiscount = $this->productModel->join_product__with_productDiscounts_discounts($id)[0] ?? '';
        // dd(empty($productDiscount) ? $product : $productDiscount['discounts_status']);
        $data    = array(
            'comments' => $this->commentModel->join_comment_to_user() ?? [],
            'product'  => empty($productDiscount) ? $product : $productDiscount,
            'photos'   => $photos,
            'photo'    => $photo,
        );
        return view('Frontend.product.show', $data);
    }
    
    public function add_comment()
    {
        dd($_POST);
        $id = $this->request->get_param('id');
        $param = $this->request->params();

       $is_comment= $this->commentModel->create([
            'entity_id'   => $id,
            'entity_type' => 'Product',
            'user_id'     => SessionManager::get('auth'),
            'message'     => $param['comment'],
            'ip'          => $this->request->ip(),
        ]);
        if ($is_comment) {
            return FlashMessage::add(" کامنت با موفقیت ارسال شد بعد از تایید مدیر نمایش داده می شود");
        }
        return FlashMessage::add(" مشکلی در ویرایش برند بندی رخ داد ", FlashMessage::ERROR);
    }
}
