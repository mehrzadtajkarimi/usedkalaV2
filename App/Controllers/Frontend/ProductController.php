<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Core\Request;
use App\Models\Comment;
use App\Models\Photo;
use App\Models\Product;
use App\Models\Product_discount;
use App\Models\Product_tag;
use App\Models\Product_category;
use App\Models\Tag;
use App\Models\Wish_list;
use App\Services\Session\SessionManager;
use App\Utilities\FlashMessage;

class ProductController extends Controller
{
    private $productModel;
    private $photoModel;
    private $commentModel;
    private $ProductTagModel;
    private $wishListModel;
    private $tagModel;

    public function __construct()
    {
        parent::__construct();
        $this->commentModel         = new Comment();
        $this->productModel         = new Product();
        $this->photoModel           = new Photo();
        $this->ProductDiscountModel = new Product_discount();
        $this->ProductTagModel      = new Product_tag();
        $this->ProductCatModel      = new Product_category();
        $this->wishListModel        = new Wish_list();
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


        $photos             = $this->photoModel->read_photo_by_id($id, 'Product');
        $photo              = $this->photoModel->read_single_photo_by_id('0', $id, 'Product')[0];
        $product            = $this->productModel->read_product($id);
        $productBrand       = $this->productModel->product_brand($id['id']);
        $productDiscount    = $this->productModel->join_product__with_productDiscounts_discounts($id)[0] ?? '';
        $productCommentLike = $this->productModel->join_product__with_comment_and_like($id['id']) ?? '';
        $productTag         = $this->ProductTagModel->read_productTag($id) ?? '';
        $wish_list          = $this->wishListModel->read_wishList($id['id'], 'Product');

        if (count($product) == 0) Request::redirect('');
        // dd(empty($productDiscount) ? $product : $productDiscount['discounts_status']);
        $productCat = $this->ProductCatModel->read_productCategories($id);

        $data = array(
            'comments'              => $productCommentLike ?? [],
            'tags'                  => $productTag ?? [],
            'photos'                => $photos,
            'product'               => empty($productDiscount) ? $product : $productDiscount,
            'photo'                 => $photo,
            'auth'                  => SessionManager::get('auth') ?? null,
            'cats'                  => $productCat,
            'wish_list'             => $wish_list,
            'brand'                 => $productBrand[0],
            'home_page_active_menu' => "single-product full-width normal",
        );
        return view('Frontend.product.show', $data);
    }
}
