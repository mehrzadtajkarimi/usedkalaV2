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
        // $categoryLevelOne = $this->categoryModel->get('*', ['parent_id' => 0]);
        // foreach ($categoryLevelOne as $LevelOne) {
        //     $categoryLevelTwo[$LevelOne['id']] = $this->categoryModel->inner_join('photos', 'id', 'entity_id', 'categories.parent_id' . '=' . $LevelOne['id']);
        // }
        $id = $this->request->get_param('id');
        $categories = $this->categoryModel->get('*', ['parent_id' => $id]);
        $data = array(
            'categories' => $categories,
            // 'categoryLevelOne' => $categoryLevelOne,
            // 'categoryLevelTwo' => $categoryLevelTwo,
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
