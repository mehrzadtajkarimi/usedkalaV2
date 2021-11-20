<?php

namespace App\Controllers\Frontend;

use App\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use App\Models\Product_tag;
use App\Models\Tag;

class TagController extends Controller
{
    private $categoryModel;
    private $productModel;
    private $tagModel;
    private $ProductTagModel;

    public function __construct()
    {
        parent::__construct();
        $this->categoryModel   = new Category;
        $this->productModel    = new Product;
        $this->tagModel        = new Tag;
        $this->ProductTagModel = new Product_tag;
    }

    public function index()
    {
    }
    public function create()
    {
    }
    public function store()
    {
    }

    public function show()
    {
        $params = $this->request->params();

        $productTag = $this->ProductTagModel->read_productTag($params['id']) ?? '';


        dd($productTag);

        $data = array(
            'tags' => $productTag,
        );
        return view('Frontend.tag.show', $data);
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
