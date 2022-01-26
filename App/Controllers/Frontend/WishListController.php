<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Photo;
use App\Models\WishList;
use App\Models\Wish_list;
use App\Models\Product;
use App\Services\Auth\Auth;
use App\Services\Session\SessionManager;

class WishListController extends Controller
{
    private $WishListModel;
    private $productModel;
    private $photoModel;

    public function __construct()
    {
        parent::__construct();
        $this->WishListModel = new Wish_list();
        $this->productModel  = new Product();
        $this->photoModel  = new Photo();
    }

    public function index()
    {

        $wishlist_products = $this->WishListModel->read_all_wishList_items('Product');
		// print_r($wishlist_products);
		// die();
        $products          = [];
        $selected_wishlist = [];
        foreach ($wishlist_products as $key => $value){
            $products[] = $this->productModel->join_product_to_single_photo__with__productDiscounts_by_product_id($value['entity_id']);
            // $photo[] = $this->photoModel->read_single_photo_by_id('0', $value['entity_id'], 'Product')[0];
            // $products[$key]['path'] = $photo[$key]['path'];
            $selected_wishlist[] = $value['entity_id'];
        }

        $data= [
            'products'          => $products,
            'selected_wishlist' => $selected_wishlist,
            'auth'              => Auth::is_login(),
			'home_page_active_menu' => "full-width"
        ];

        return view('Frontend.product.index', $data);
    }

    public function add()
    {
        if(SessionManager::get('auth')){
            $params   = $this->request->params();
            $data = [
                'entity_id'   => $params['entity_id'],
                'entity_type' => $params['entity_type'],
                'user_id'     => SessionManager::get('auth'),
            ];
            $alreadyExists = $this->WishListModel->count_WishList($data);
    
            $result = [];
            $result['status'] = 'already';
            if (!$alreadyExists) {
                $this->WishListModel->create_WishList($data);
                $result['status'] = 'created';
            }
    
            $class_name = '\\App\\Models\\' . $params['entity_type'];
    
    
            $entity_model = new $class_name;
    
    
      
            $method_read = "read_" . lcfirst($params['entity_type']);
    
            $result['count'] = count($this->WishListModel->read_all_wishList_items('Product'));
    
            echo json_encode($result);
        } else {
            $result['error'] = "ابتدا باید وارد شوید.";
            echo json_encode($result);
        }
    }

    public function remove()
    {
        if(SessionManager::get('auth')){
            $params   = $this->request->params();
            $data = [
                'entity_id'   => $params['entity_id'],
                'entity_type' => $params['entity_type'],
                'user_id'     => SessionManager::get('auth'),
            ];
            $result['deleted']        = $this->WishListModel->delete_wishList($data);
            $result['count_wishlist'] = count($this->WishListModel->read_all_wishList_items('Product'));
    
            echo json_encode($result);
        } else {
            $result['error'] = "ابتدا باید وارد شوید.";
            echo json_encode($result);
        }
    }
}
