<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;
use App\Models\Permission;
use App\Models\Permission_user;
use App\Models\Role;
use App\Models\Role_permission;
use App\Models\Role_user;
use App\Models\User;
use App\Services\Auth\Auth;
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
        $roles       = $this->roleModel->read_role();
        $permissions = $this->permissionModel->read_permission();
        $admins      = $this->userModel->is_admin();

        $data = array(
            'permissions' => $permissions,
            'roles'       => $roles,
            'admins'      => $admins,
        );
        return view('Backend.access.index', $data);
    }



    public function add_access()
    {
        $params = $this->request->params();
        $user_id = $this->request->get_param();

        if ($params['access-permission']) {
            $permission_exists = $this->permissionUserModel->exist_permissionUser($params['access-permission'], $user_id['admin_id']);
            if (!$permission_exists) {
                foreach ($params['access-permission'] as  $permission_id) {
                    $array_permissionUser = [
                        'permission_id' => $permission_id,
                        'user_id'       => $user_id['admin_id'],
                    ];
                    $has_permissionUser = $this->permissionUserModel->has_permissionUser($array_permissionUser);
                    // dd($has_permissionUser);
                    if ($has_permissionUser) {
                        $permissionUser_created = $this->permissionUserModel->create_permissionUser($array_permissionUser);
                    }
                }
            }
        }
        if ($params['access-role']) {
            $role_exists = $this->roleUserModel->exist_roleUser($params['access-role'], $user_id['admin_id']);
            if (!$role_exists) {
                foreach ($params['access-role'] as  $role_id) {
                    $array_roleUser = [
                        'role_id' => $role_id,
                        'user_id' => $user_id['admin_id'],
                    ];
                    $has_roleUser = $this->roleUserModel->has_roleUser($array_roleUser);
                    if ($has_roleUser) {
                        $roleUser_created =  $this->roleUserModel->create_roleUser($array_roleUser);
                    }
                }
            }
        }
        if ($permissionUser_created ||  $roleUser_created) {
            FlashMessage::add("مقادیر  با موفقیت به دیتابیس اضافه شد");
            return $this->request->redirect('admin/access');
        }
        FlashMessage::add("دسترسی مورد نظر قبلا اضافه گردیده", FlashMessage::WARNING);
        return $this->request->redirect('admin/access');
    }

    public function get_access()
    {
        $user_id = $this->request->get_param('id');

        $result = [];

        $result['permission'] = $this->permissionUserModel->join_permissionUser_permission($user_id);
        $result['role']       = $this->roleUserModel->join_roleUser_role($user_id);


        echo json_encode($result);
    }

    public function delete_access()
    {
        $id = $this->request->get_param('id');
        $type = $this->request->get_param('type');

        if ($type['type'] == 'permission') {
            $is_deleted_Permission = $this->permissionUserModel->delete_permissionUser($id);
        }
        if ($type['type'] == 'role') {
            $is_deleted_role =  $this->roleUserModel->delete_roleUser($id);
        }

        if ($is_deleted_role ||  $is_deleted_Permission) {
            FlashMessage::add("مقادیر  با موفقیت از دیتابیس حذف شد");
            return $this->request->redirect('admin/access');
        }
        FlashMessage::add(" مشکلی در حذف  پیش آمده است", FlashMessage::ERROR);
        return $this->request->redirect('admin/access');
    }



    public function update()
    {
        $params = $this->request->params();
        $permission_id = $this->request->get_param('id');


        if (!empty($params['access-permission'])) {
            $is_deleted = $this->rolePermissionModel->delete_rolePermission($permission_id);
            if ($is_deleted) {
                foreach ($params['access-permission'] as  $role_id) {
                    $this->rolePermissionModel->create_rolePermission([
                        'access_id'       => $role_id,
                        'permission_id' => $permission_id,
                    ]);
                };
            }
        }

        $params_updated = array(
            'name'   => $params['access-name'],
            'label'  => $params['access-label'],
            'status' => $params['access-status'] ?? 0,
        );
        $this->roleModel->update_role($params_updated, $permission_id);

        FlashMessage::add("مقادیر  با موفقیت در دیتابیس ذخیره شد");
        return $this->request->redirect('admin/access');
    }

    public function remove_admin()
    {
        $id = $this->request->get_param('id');
        $param = [
            'user_level'    => 1
        ];
        $is_user_update = $this->userModel->update_user($param, $id);

        if ($is_user_update) {
            FlashMessage::add("ادمین انتخابی با موفقیت به کاربر عادی تبدیل شده و هیچ گونه دسترسی به پنل ادمین نخواهد داشت.");
            return     $this->request->redirect('admin/access');
        }
        FlashMessage::add(" مشکلی در تبدیلِ ادمین به کاربرِ عادی رخ داد ", FlashMessage::ERROR);
        return $this->request->redirect('admin/users');
    }

    public function destroy()
    {
        $id = $this->request->get_param('id');
        $is_deleted_rolePermission = $this->rolePermissionModel->delete_rolePermission($id);

        if ($is_deleted_rolePermission) {
            FlashMessage::add("مقادیر  با موفقیت از دیتابیس حذف شد");
            return $this->request->redirect('admin/access');
        }
        FlashMessage::add(" مشکلی در حذف نقش پیش آمده است", FlashMessage::ERROR);
        return $this->request->redirect('admin/access');
    }
}
