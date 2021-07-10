<?php

namespace App\Controllers\frontend;

use App\Controllers\Controller;
use App\Models\Category;

class HomeController extends Controller
{
    private $categoryModel;

    public function __construct()
    {
        parent::__construct();
        $this->categoryModel = new Category();
    }

    public function index()
    {
        global $request;
        $categoryLevelOne = $this->categoryModel->get('*', ['parent_id' => 0]);
        foreach ($categoryLevelOne as $LevelOne ) {
            $categoryLevelTwo[$LevelOne['id']]= $this->categoryModel->get('*', ['parent_id' => $LevelOne['id']]);

        }


        $data = array(
            'request' => $request,
            'categoryLevelOne' => $categoryLevelOne,
            'categoryLevelTwo' => $categoryLevelTwo,
        );
        return view('frontend.index', $data);
    }
}
