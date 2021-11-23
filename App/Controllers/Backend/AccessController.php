<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Permission;
use App\Models\Role;
use App\Models\Role_permission;
use App\Models\User;
use App\Utilities\FlashMessage;

class AccessController  extends Controller
{
    private $permissionModel;
    private $roleModel;
    private $rolePermissionModel;
    private $userModel;

    public function __construct()
    {
        parent::__construct();
        $this->permissionModel     = new Permission();
        $this->roleModel           = new Role();
        $this->rolePermissionModel = new Role_permission();
        $this->userModel           = new User();
    }
    public function index()
    {
        $params = $this->request->params();
        $research       = $this->userModel->is_admin_by_phone($params['phone']);
        $roles       = $this->roleModel->read_role();
        $permissions = $this->permissionModel->read_permission();
        $data = array(
            'accesses' => $roles,
            'permissions' => $permissions,
        );
        return view('Backend.access.index', $data);
    }
    public function is_phone()
    {
        $params   = $this->request->params();
        $research = $this->userModel->is_admin_by_phone($params['phone']);

        return $research ;
    }

    public function store()
    {
        $params = $this->request->params();

        $params_create = array(
            'name'  => $params['access-name'],
            'label' => $params['access-label'],
        );
        $role_id = $this->roleModel->create_role($params_create);
        if (!empty($params['access-permission'])) {
            foreach ($params['access-permission'] as  $permission_id) {
                $rolePermission_id = $this->rolePermissionModel->create_rolePermission([
                    'access_id'       => $role_id,
                    'permission_id' => $permission_id,
                ]);
            }
        }
        if ($role_id && $rolePermission_id) {
            FlashMessage::add("ایجاد دسترسی موفقیت انجام شد");
        } else {
            FlashMessage::add(" مشکلی در ایجاد دسترسی رخ داد ", FlashMessage::ERROR);
        }
        return $this->request->redirect('admin/access');
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
            'access'                 => $role,
            'permissions'          => $permissions,
            'permissions_selected' => $selectedPermissions,
        );
        view('Backend.role.edit', $data);
    }



    public function update()
    {
        $params = $this->request->params();
        $permission_id = $this->request->get_param('id');


        if (!empty($params['access-permission'])) {
            $is_deleted = $this->rolePermissionModel->delete_rolePermission($permission_id['id']);
            if ($is_deleted) {
                foreach ($params['access-permission'] as  $role_id) {
                    $this->rolePermissionModel->create_rolePermission([
                        'access_id'       => $role_id,
                        'permission_id' => $permission_id['id'],
                    ]);
                };
            }
        }

        $params_updated = array(
            'name'   => $params['access-name'],
            'label'  => $params['access-label'],
            'status' => $params['access-status'] ?? 0,
        );
        $this->roleModel->update_role($params_updated, $permission_id['id']);

        FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/access');
    }



    public function destroy()
    {
        $id = $this->request->get_param('id');
        $is_deleted_role = $this->roleModel->delete_role($id);
        $is_deleted_rolePermission = $this->rolePermissionModel->delete_rolePermission($id['id']);

        if ($is_deleted_role && $is_deleted_rolePermission) {
            FlashMessage::add("مقادیر  با موفقیت از دیتابیس حذف شد");
            return $this->request->redirect('admin/access');
        }
        FlashMessage::add(" مشکلی در حذف نقش پیش آمده است", FlashMessage::ERROR);
        return $this->request->redirect('admin/access');
    }
}
