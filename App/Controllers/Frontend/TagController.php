<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use App\Models\Product_tag;
use App\Models\Tag;
use App\Models\Taggable;

class TagController extends Controller
{
    private $categoryModel;
    private $productModel;
    private $taggableModel;

    public function __construct()
    {
        parent::__construct();
        $this->categoryModel = new Category;
        $this->productModel  = new Product;
        $this->taggableModel = new Taggable();
    }

    public function index()
    {
        $params = $this->request->params();

        $taggable = $this->taggableModel->join_taggable_by_tag_id($params['type'],$params['id']) ?? '';


        // dd($taggable);

        $data = array(
            'tags' => $taggable,
        );
        return view('Frontend.tag.index', $data);
    }
    public function create()
    {
    }
    public function store()
    {
    }

    public function show()
    {

    }

    public function edit()
    {
    }
    public function update()
    {
    }
    public function destroy()
    {
    }
}
