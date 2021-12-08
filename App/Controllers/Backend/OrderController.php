<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Order;
use App\Models\Photo;
use App\Services\Upload\UploadedFile;
use App\Utilities\FlashMessage;

class OrderController extends Controller
{
    private $photoModel;
    private $orderModel;

    public function __construct()
    {
        parent::__construct();
        $this->photoModel = new Photo();
        $this->orderModel = new Order();
    }

    public function index()
    {
        $data = array(
            'photos' => $this->photoModel->read_photo(),
            'orders' => $this->orderModel->read_order(),
        );
        view('Backend.order.index', $data);
    }

    public function create()
    {
        view('Backend.order.create');
    }

    public function store()
    {
        $params = $this->request->params();


    }

    public function show()
    {

    }

    public function edit()
    {

    }


    public function update()
    {
        $id = $this->request->get_param('id');
        $params = $this->request->params();

    }


    public function destroy()
    {
        $id = $this->request->get_param('id');

        if (true) {
            # code...
            FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
            return $this->request->redirect('admin/order');
        }
        FlashMessage::add(" مشکلی در حذف برند پیش آمده است", FlashMessage::ERROR);
        return $this->request->redirect('admin/order');
    }
}
