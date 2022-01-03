<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Permission;
use App\Utilities\FlashMessage;

class PermissionController  extends Controller
{
    private $permissionModel;

    public function __construct()
    {
        parent::__construct();
        $this->permissionModel = new Permission();
    }
    public function index()
    {



        $permissions = $this->permissionModel->read_permission();
        $data = array(
            'permissions' => $permissions,
        );
        return view('Backend.permission.index', $data);
    }

    public function store()
    {
        $params = $this->request->params();
        $params_create = array(
            'name'  => $params['permission-name'],
            'label' => $params['permission-label'],
        );
        $permission_id = $this->permissionModel->create_permission($params_create);
        if ($permission_id) {
            FlashMessage::add("ایجاد دسترسی موفقیت انجام شد");
        } else {
            FlashMessage::add(" مشکلی در ایجاد دسترسی رخ داد ", FlashMessage::ERROR);
        }
        return $this->request->redirect('admin/permission');
    }



    public function edit()
    {
        $id = $this->request->get_param('id');
        $permission = $this->permissionModel->read_permission($id);

        $data = array(
            'permission' => $permission,
        );
        view('Backend.permission.edit', $data);
    }



    public function update()
    {
        $params = $this->request->params();

        $permission_id = $this->request->get_param('id');

        $params_updated = array(
            'name'   => $params['permission-name'],
            'label'  => $params['permission-label'],
            'status' => $params['permission-status'] ?? 0,
        );
        $this->permissionModel->update_permission($params_updated, $permission_id);

        FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/permission');
    }



    public function destroy()
    {
        $id = $this->request->get_param('id');
        $is_deleted_permission = $this->permissionModel->delete_permission($id);
        if ($is_deleted_permission) {
            FlashMessage::add("مقادیر  با موفقیت از دیتابیس حذف شد");
            return $this->request->redirect('admin/permission');
        }
        FlashMessage::add(" مشکلی در حذف مثال پیش آمده است", FlashMessage::ERROR);
        return $this->request->redirect('admin/permission');
    }
}
