<?php

namespace App\Controllers\frontend;

use App\Controllers\Controller;
use App\Models\Product;
use App\Utilities\FlashMessage;

class ProductController extends Controller
{
    private $productModel;

    public function __construct()
    {
        parent::__construct();
        $this->productModel = new Product();
    }

    public function index()
    {
        $data = array(

        );
        view('backend.product.index', $data);
    }

    public function create()
    {
        //
    }

    public function store()
    {
        //
    }

    public function show()
    {
        $id = $this->request->get_param('id');
        $categories = $this->productModel->inner_join_two('categories','photos', 'id', 'entity_id', 'categories.parent_id' . '=' . $id );


        $data = array(
            'categories' => $categories,
        );
 
            return view('frontend.product.show', $data);

    }

    public function edit()
    {
        //
    }


    public function update()
    {
        //
    }


    public function destroy()
    {
        //
    }
}
