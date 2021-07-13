<?php

namespace App\Controllers\frontend;

use App\Controllers\Controller;
use App\Models\Category;
use App\Models\Photo;

class HomeController extends Controller
{
    private $categoryModel;
    private $photoModel;

    public function __construct()
    {
        parent::__construct();
        $this->categoryModel = new Category();
        $this->photoModel = new Photo();
    }

    public function index()
    {
        global $request;
        $categoryPhoto = [];
        $categoryLevelOne = $this->categoryModel->get('*', ['parent_id' => 0]);
        foreach ($categoryLevelOne as $LevelOne) {
            $categoryLevelTwo[$LevelOne['id']] = $this->categoryModel->inner_join('photos', 'id', 'entity_id', 'categories.parent_id' . '=' . $LevelOne['id']);
        }

        $data = array(
            'request' => $request,
            'categoryLevelOne' => $categoryLevelOne,
            'categoryLevelTwo' => $categoryLevelTwo,
        );
        return view('frontend.index', $data);
    }
}
