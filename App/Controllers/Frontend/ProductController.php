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
        $productComment  = $this->productModel->join_product__with_comment($id['id']) ?? '';
        // dd(empty($productDiscount) ? $product : $productDiscount['discounts_status']);
        $data    = array(
            'comments' => $productComment ?? [],
            'product'  => empty($productDiscount) ? $product : $productDiscount,
            'photos'   => $photos,
            'photo'    => $photo,
            'auth'     => SessionManager::get('auth') ?? null,
        );
        return view('Frontend.product.show', $data);
    }

    public function add_comment()
    {
        $id = $this->request->get_param('id');

        $this->commentModel->create([
            'entity_id'   => $id['id'],
            'entity_type' => 'Product',
            'user_id'     => SessionManager::get('auth'),
            'message'     => $this->request->params()['product_comment'],
            'title'       => $this->request->params()['product_title'],
            'ip'          => $this->request->ip(),
        ]);
        return true;
    }

    public function dislike_comment()
    {
        $id = $this->request->get_param('id');
        $this->commentModel->update([
            'dislike[+]' => 1,
            'like[+]'    => 1,
        ], ['id' => $id]);
        return true;
    }
    public function like_comment()
    {
        $id = $this->request->get_param('id');
        $this->commentModel->update([
            'dislike[+]' => 1,
            'like[+]'    => 1,
        ], ['id' => $id]);
        return true;
    }
}
