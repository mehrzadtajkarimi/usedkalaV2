<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Core\Request;
use App\Models\Category;
use App\Models\Comment;
use App\Models\Discount;
use App\Models\Photo;
use App\Models\Product;
use App\Models\Product_discount;
use App\Models\Product_category;
use App\Models\Related;
use App\Models\Taggable;
use App\Models\Wish_list;
use App\Models\PageMetas;
use App\Utilities\Tinyint;
use App\Services\Session\SessionManager;

class ProductController extends Controller
{
    private $productModel;
    private $photoModel;
    private $ProductCatModel;
    private $wishListModel;
    private $taggableModel;
    private $relatedModel;
    private $categoryModel;
	private $pageMetasModel;

    public function __construct()
    {
        parent::__construct();
        $this->commentModel         = new Comment();
        $this->productModel         = new Product();
        $this->photoModel           = new Photo();
        $this->ProductDiscountModel = new Product_discount();
        $this->taggableModel        = new Taggable();
        $this->ProductCatModel      = new Product_category();
        $this->wishListModel        = new Wish_list();
        $this->relatedModel         = new Related();
        $this->categoryModel        = new Category();
        $this->discountModel        = new Discount();
		$this->pageMetasModel         = new PageMetas();
    }

    public function index()
    {
        $products          = $this->productModel->join_product_to_photo_all();
		$pageMetas=$this->pageMetasModel->read_pageMeta(4);
		
        $wishlist_products = $this->wishListModel->read_all_wishList_items('Product');
        $selected_wishlist = [];
        foreach ($wishlist_products as  $value) {
            $selected_wishlist[] = $value['entity_id'];
        }
        $data     = array(
            'products'          => $products['rowsInPage'],
			'page_count'		=> $products['pageCount'],
            'auth'              => SessionManager::get('auth') ?? false,
            'selected_wishlist' => $selected_wishlist,
			'home_page_active_menu' => "full-width",
			'headSeoTitle' => $pageMetas['html_title'],
			'headSeoDescription' => $pageMetas['html_desc'],
			'headSeoRobots' => $pageMetas['robots'],
			'headSeoCanonical' => $pageMetas['canonical']
        );
        view('Frontend.product.index', $data);
    }
    public function indexDiscounts()
    {
        $products          = $this->productModel->join_product_to_photo__with_productDiscounts_discounts();
		$pageMetas=$this->pageMetasModel->read_pageMeta(5);

        // dd($products);
        $wishlist_products = $this->wishListModel->read_all_wishList_items('Product');
        $selected_wishlist = [];
        foreach ($wishlist_products as  $value) {
            $selected_wishlist[] = $value['entity_id'];
        }
        $data     = array(
            'products'          => $products,
            'auth'              => SessionManager::get('auth') ?? false,
            'selected_wishlist' => $selected_wishlist,
			'home_page_active_menu' => "full-width",
			'headSeoTitle' => $pageMetas['html_title'],
			'headSeoDescription' => $pageMetas['html_desc'],
			'headSeoRobots' => $pageMetas['robots'],
			'headSeoCanonical' => $pageMetas['canonical']
        );
        view('Frontend.product.index', $data);
    }

    public function show()
    {
        $product            = $this->productModel->read_product_byslug($this->request->get_param('slug'));
		// var_dump($this->request->get_param('slug'));
		// die();
        $productID = $product['id'];
        $photos             = $this->photoModel->read_photo_by_id($productID, 'Product');
        $photo              = $this->photoModel->read_single_photo_by_id('0', $productID, 'Product')[0];
        $productBrand       = $this->productModel->product_brand($productID);
        $productDiscount    = $this->productModel->join_product__with_productDiscounts_discounts_by_product_id($productID)[0] ?? '';
        $productCommentLike = $this->productModel->join_product__with_comment_and_like($productID) ?? '';
        $productTag         = $this->taggableModel->join_taggable('products', $productID) ?? '';
        $wish_list          = $this->wishListModel->read_wishList($productID, 'Product');

        if (count($product) == 0) Request::redirect('');
        $productCat = $this->ProductCatModel->read_productCategories($productID);
        $breadcrumb = $this->categoryModel->get_categories_for_product_breadcrumb($productCat[0]['id']);
        $breadcrumb_item = [];
        foreach (array_reverse($breadcrumb) as $key => $value) {
            foreach ($value as $value2) {
                $breadcrumb_item[$key]['name'] = $value2['name'];
                $breadcrumb_item[$key]['slug'] = $value2['slug'];
            }
        }
        $product_relation = $this->relatedModel->get_related_by_entity_id([
            'entity_id'   => $productID,
            'entity_type' => 'product'
        ]);
        $related_products = [];
        if (!empty($product_relation) && $product['status_related'] != 0) {
            if ($product['status_related'] == 1) {
                foreach ($product_relation as $key => $value) {
                    $related_products_array = $this->ProductCatModel->read_products_by_category_id($value['related_id']);
                    foreach ($related_products_array as $key => $value2) {
                        $related_products[] = $value2;
                    }
                }
            }
            if ($product['status_related'] == 2) {
                foreach ($product_relation as $key => $value) {
                    $related_products[] = $this->productModel->read_product($value['related_id']);
                }
            }
            foreach ($related_products as $key => $value) {
                $images_path[] = $this->photoModel->read_single_photo_by_id('0', $value['id'], 'Product')[0];
            }

            if (!empty($images_path)) {
                foreach ($images_path as $key => $value) {
                    $related_products[$key]['img_path'] = $value['path'];
                    $related_products[$key]['img_alt']  = $value['alt'];
                }
            }
        }


        $related_products_unique = [];
        foreach ($related_products as $value) {
            $related_products_unique[] = [
                'id'       => $value['id'],
                'slug'     => $value['slug'],
                'img_path' => $value['img_path'],
                'img_alt'  => $value['img_alt'],
                'title'    => $value['title']
            ];
        }
        $related_products = array_unique($related_products_unique, SORT_REGULAR);

        $data = array(
            'product_id'            => $productID,
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
            'related_products'      => $related_products,
            'breadcrumb'            => $breadcrumb_item,
			'headSeoTitle' => $product['seo_title'],
			'headSeoDescription' => $product['seo_description'],
			'headSeoRobots' => $product['seo_robot']!=NULL?Tinyint::category_robots()[$product['seo_robot']]:"index, follow",
			'headSeoCanonical' => $product['seo_canonical']
        );
        return view('Frontend.product.show', $data);
    }

    public function search()
    {
        $params = $this->request->get_param();

        $wishlist_products = $this->wishListModel->read_all_wishList_items('Product');
        $selected_wishlist = [];
        $products          = [];
        foreach ($wishlist_products as $key => $value) {
            $selected_wishlist[] = $value['entity_id'];
        }

        if ($params['product_cat'] == "all") {
            $products = $this->productModel->search_product_by_name($params['s']);
            foreach ($products as $key => $value) {
                $photos = $this->photoModel->read_single_photo_by_id('0', $value['id'], 'Product')[0];
                $products[$key]['path'] = $photos['path'];
                $products[$key]['alt'] = $photos['alt'];
            }
        } else {
            // $products = $this->productModel->query("SELECT pros.* FROM `products` as pros INNER JOIN `product_categories` as rels ON rels.`product_id` = pros.`id` WHERE rels.`category_id` = '".$params['product_cat']."' AND pros.`title` LIKE '%".$params['s']."%'");
            $products = $this->productModel->join_products_to_categories_by_cat_id($params['product_cat'], $params['s']);
        }
        
        $data     = array(
            'products'          => $products,
            'auth'              => SessionManager::get('auth') ?? false,
            'selected_wishlist' => $selected_wishlist,
            'search_params'     => $params
        );
        view('Frontend.product.index', $data);
    }
    
    
    // public function discounts()
    // {
    //     $products = $this->productModel->join_product_to_photo__with_productDiscounts_discounts();
        
    //     $data= array(
    //         'products'=> $products,
            
    //     );
    //     view('Frontend.discount.index', $data);
        
    // }
}
