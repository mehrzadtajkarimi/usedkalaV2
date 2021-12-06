<?php

namespace App\database\seeders;

use App\Models\Role;

class RoleSeeder
{


    public function seedRole()
    {
        $roleModel = new Role;
        $params =  array(
            [
                'name' =>  "manager-user",
                'label' => "مدیریت کاربران",
            ],
            [
                'name' =>  "manager-category",
                'label' => "مدیریت دسته بندی ها",
            ],
            [
                'name' =>  "manager-product",
                'label' => "مدیریت محصولات",
            ],
            [
                'name' =>  "manager-tag",
                'label' => "مدیریت تک",
            ],
            [
                'name' =>  "manager-blog",
                'label' => "مدیریت وبلاک",
            ],
            [
                'name' =>  "manager-discount",
                'label' => "مدیریت تخفیفات",
            ],
            [
                'name' =>  "manager-cart",
                'label' => "مدیریت سبد تخفیف",
            ],
            [
                'name' =>  "manager-comment",
                'label' => "مدیریت نظرات",
            ],
            [
                'name' =>  "manager-setting",
                'label' => "مدیریت تنظیمات",
            ],
            [
                'name' =>  "super-admin",
                'label' => "مدیریت ادمین ",
            ],
            [
                'name' =>  "super-user",
                'label' => "مدیریت کاربر",
            ],




        );
        foreach ($params as $value) {
            $roleModel->create_role($value);
        }
    }
}
