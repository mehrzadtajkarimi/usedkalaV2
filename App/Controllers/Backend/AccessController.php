<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Permission;
use App\Models\Permission_user;
use App\Models\Role;
use App\Models\Role_permission;
use App\Models\Role_user;
use App\Models\User;
use App\Utilities\FlashMessage;

class AccessController  extends Controller
{
    private $permissionModel;
    private $permissionUserModel;
    private $roleModel;
    private $rolePermissionModel;
    private $roleUserModel;
    private $userModel;

    public function __construct()
    {
        parent::__construct();
        $this->permissionModel     = new Permission();
        $this->permissionUserModel = new Permission_user();
        $this->rolePermissionModel = new Role_permission();
        $this->roleUserModel       = new Role_user();
        $this->roleModel           = new Role();
        $this->userModel           = new User();
    }
    public function index()
    {
        $params = $this->request->params();
        $roles       = $this->roleModel->read_role();
        $permissions = $this->permissionModel->read_permission();
        $admins = $this->userModel->is_admin();


        $data = array(
            'accesses'    => $roles,
            'permissions' => $permissions,
            'admins'      => $admins,
        );
        return view('Backend.access.index', $data);
    }

    public function edit()
    {
        $id = $this->request->get_param('id');
        $admin = $this->userModel->read_user($id);



        $data = array(
            'admin'    => $admin,
        );
        return view('Backend.access.edit', $data);
    }

    public function get_access()
    {
        $user_id = $this->request->params()['id'];

        $result = [];

        $result['permission'] = $this->permissionUserModel->join_permissionUser_permission($user_id);
        $result['role'] = $this->roleUserModel->join_roleUser_role($user_id);


        echo json_encode($result);
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
