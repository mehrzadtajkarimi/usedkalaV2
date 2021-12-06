<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Permission;
use App\Models\Role;
use App\Models\Role_permission;
use App\Utilities\FlashMessage;

class RoleController  extends Controller
{
    private $permissionModel;
    private $roleModel;
    private $rolePermissionModel;

    public function __construct()
    {
        parent::__construct();
        $this->permissionModel     = new Permission();
        $this->roleModel           = new Role();
        $this->rolePermissionModel = new Role_permission();
    }
    public function index()
    {
        $roles       = $this->roleModel->read_role();
        $permissions = $this->permissionModel->read_permission();
        $data = array(
            'roles' => $roles,
            'permissions' => $permissions,
        );
        return view('Backend.role.index', $data);
    }

    public function store()
    {
        $params = $this->request->params();

        $params_create = array(
            'name'  => $params['role-name'],
            'label' => $params['role-label'],
        );



        $role_id = $this->roleModel->create_role($params_create);
        if (!empty($params['role-permission'])) {
            foreach ($params['role-permission'] as  $permission_id) {
                $rolePermission_id = $this->rolePermissionModel->create_rolePermission([
                    'role_id'       => $role_id,
                    'permission_id' => $permission_id,
                ]);
            }
        }

        if ($role_id && $rolePermission_id) {
            FlashMessage::add("ایجاد دسترسی موفقیت انجام شد");
        } else {
            FlashMessage::add(" مشکلی در ایجاد دسترسی رخ داد ", FlashMessage::ERROR);
        }
        return $this->request->redirect('admin/role');
    }



    public function edit()
    {
        $id                   = $this->request->get_param('id');
        $role                 = $this->roleModel->read_role($id);
        $permissions          = $this->permissionModel->read_permission();
        $permissions_selected = $this->rolePermissionModel->read_rolePermission($id) ?: [];

        $selectedPermissions = [];
        foreach ($permissions_selected as $selectedPermissionRow) {
            $selectedPermissions[$selectedPermissionRow['id']] = $selectedPermissionRow;
        }
        $data = array(
            'role'                 => $role,
            'permissions'          => $permissions,
            'permissions_selected' => $selectedPermissions,
        );
        view('Backend.role.edit', $data);
    }



    public function update()
    {
        $params        = $this->request->params();
        $role_id = $this->request->get_param('id');


        if (!empty($params['role-permission'])) {
            $this->rolePermissionModel->delete_rolePermission($role_id['id']);

            foreach ($params['role-permission'] as  $permission_id) {
                $this->rolePermissionModel->create_rolePermission([
                    'role_id'       => $role_id['id'],
                    'permission_id' => $permission_id,
                ]);
            };
        }


        FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/role');
    }



    public function destroy()
    {
        $id = $this->request->get_param('id');
        $is_deleted_role = $this->roleModel->delete_role($id['id']);
        $is_deleted_rolePermission = $this->rolePermissionModel->delete_rolePermission($id['id']);

        if ($is_deleted_role && $is_deleted_rolePermission) {
            FlashMessage::add("مقادیر  با موفقیت از دیتابیس حذف شد");
            return $this->request->redirect('admin/role');
        }
        FlashMessage::add(" مشکلی در حذف نقش پیش آمده است", FlashMessage::ERROR);
        return $this->request->redirect('admin/role');
    }
}
