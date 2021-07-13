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
        $categories = $this->categoryModel->get('*', ['parent_id' => $id]);

        $data = array(
            'categories' => $categories,
        );
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
