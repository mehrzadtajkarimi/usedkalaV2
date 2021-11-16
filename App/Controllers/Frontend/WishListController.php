<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\WishList;
use App\Models\Wish_list;
use App\Services\Session\SessionManager;

class WishListController extends Controller
{
    private $WishListModel;

    public function __construct()
    {
        parent::__construct();
        $this->WishListModel = new Wish_list();
    }

    public function add()
    {
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

        $result['count'] = $entity_model->$method_read($params['entity_id'])['WishLists'];

        echo json_encode($result);
    }
}
