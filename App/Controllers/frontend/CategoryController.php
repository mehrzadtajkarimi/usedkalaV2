<?php

namespace App\Controllers\frontend;

use App\Controllers\Controller;
use App\Models\Category;
use App\Utilities\FlashMessage;

class CategoryController extends Controller
{
    private $categoryModel;

    public function __construct()
    {
        parent::__construct();
        $this->categoryModel = new Category;
    }

    public function index()
    {
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
        $categories = $this->categoryModel->join_category_to_photo($id);

dd($categories);
        $data = array(
            'categories' => $categories,
        );
        if (is_null($categories)) {
            # code...
            return view('frontend.product.show', $data);
        }
        return view('frontend.category.show', $data);
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
