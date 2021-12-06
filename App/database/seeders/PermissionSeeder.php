<?php

namespace App\database\seeders;

use App\Models\Permission;

class PermissionSeeder
{


    public function seedPermissions()
    {
        $permissionModel = new Permission();
        $params =  array(
            #contact-us
            [
                'name' =>  "contact-us-read",
                'label' => "نمایش پیامهای تماس با ما",
            ],

            #about
            [
                'name' =>  "about-read",
                'label' => "نمایش در باره ما",
            ],
            [
                'name' =>  "about-update",
                'label' => "ویرایش درباره ما",
            ],

            #policies
            [
                'name' =>  "policies-read",
                'label' => "نمایش قوانین",
            ],
            [
                'name' =>  "policies-update",
                'label' => "ویرایش قوانین",
            ],

            #news
            [
                'name' =>  "news-read",
                'label' => "نمایش اخبار اطلاعات",
            ],
            [
                'name' =>  "news-update",
                'label' => "ویرایش اخبار اطلاعات",
            ],
            [
                'name' =>  "news-create",
                'label' => "ایجاد اخبار اطلاعات",
            ],
            [
                'name' =>  "news-delete",
                'label' => "حذف اخبار اطلاعات",
            ],

            #category
            [
                'name' =>  "category-read",
                'label' => "نمایش دسته بندی ها",
            ],
            [
                'name' =>  "category-update",
                'label' => "ویرایش دسته بندی ها",
            ],
            [
                'name' =>  "category-create",
                'label' => "ایجاد دسته بندی ها",
            ],
            [
                'name' =>  "category-delete",
                'label' => "حذف دسته بندی ها",
            ],

            #site-content
            [
                'name' =>  "site-content-read",
                'label' => "نمایش سایر اطلاعات",
            ],
            [
                'name' =>  "site-content-update",
                'label' => "ویرایش سایر اطلاعات",
            ],


            #commission
            [
                'name' =>  "commission-read",
                'label' => "نمایش کارمزد معاملات",
            ],
            [
                'name' =>  "commission-update",
                'label' => "ویرایش کارمزد معاملات",
            ],

            #market
            [
                'name' =>  "market-read",
                'label' => "نمایش مدیرت مارکت ها",
            ],
            [
                'name' =>  "market-update",
                'label' => "ویرایش مدیرت مارکت ها",
            ],

            #wallet-address
            [
                'name' =>  "wallet-address-create",
                'label' => "ایجاد آدرس ها کیف پول",
            ],
            [
                'name' =>  "wallet-address-read",
                'label' => "نمایش آدرس ها کیف پول",
            ],
            [
                'name' =>  "wallet-address-check",
                'label' => "بررسی آدرس ها کیف پول",
            ],

            #slideshow
            [
                'name' =>  "slideshow-create",
                'label' => "ایجاد اسلاید شو",
            ],
            [
                'name' =>  "slideshow-read",
                'label' => "نمایش اسلاید شو",
            ],
            [
                'name' =>  "slideshow-update",
                'label' => "ویرایش اسلاید شو",
            ],
            [
                'name' =>  "slideshow-delete",
                'label' => "حذف اسلاید شو",
            ],

            #currency
            [
                'name' =>  "ticket-create",
                'label' => "ایجاد تیکت ها",
            ],
            [
                'name' =>  "ticket-read",
                'label' => "نمایش تیکت ها",
            ],
            [
                'name' =>  "ticket-update",
                'label' => "ویرایش تیکت ها",
            ],
            [
                'name' =>  "ticket-delete",
                'label' => "حذف تیکت ها",
            ],
            [
                'name' =>  "ticket-reply",
                'label' => "پاسخ تیکت ها",
            ],


            #site-fee
            [
                'name' =>  "site-fee-read",
                'label' => "مشاهده گزارش عملکرد",
            ],

            #report-wallet
            [
                'name' =>  "report-wallet-read",
                'label' => "مشاهده گزارش صندوق",
            ],
            [
                'name' =>  "report-wallet-user-balance",
                'label' => "مشاهده موجودی کاربران در گزارش صندوق",
            ],

            #transaction
            [
                'name' =>  "transaction-read",
                'label' => "مشاهده گردش حساب کاربر",
            ],


            #order
            [
                'name' =>  "order-read",
                'label' => "نمایش سفارشها",
            ],



            #site_settings
            [
                'name' =>  "site-settings-create",
                'label' => "ایجاد تنظیمات سایت",
            ],
            [
                'name' =>  "site-settings-read",
                'label' => "نمایش تنظیمات سایت",
            ],
            [
                'name' =>  "site-settings-update",
                'label' => "ویرایش تنظیمات سایت",
            ],
            [
                'name' =>  "site-settings-delete",
                'label' => "حذف تنظیمات سایت",
            ],

            #bank_accounts
            [
                'name' =>  "bank-account-create",
                'label' => "ایجاد حساب بانکی",
            ],
            [
                'name' =>  "bank-account-read",
                'label' => "نمایش حساب بانکی",
            ],
            [
                'name' =>  "bank-account-update",
                'label' => "ویرایش حساب بانکی",
            ],
            [
                'name' =>  "bank-account-delete",
                'label' => "حذف حساب بانکی",
            ],

            #log
            [
                'name' => 'api-log-read',
                'label' => "مشاهده فراخوانی های api",
            ],
            [
                'name' => 'activity-log-read',
                'label' => "مشاهده ریز فعالیت های سایت",
            ],

            # users
            [
                'name' =>  "user-create",
                'label' => "ایجاد کاربر",
            ],
            [
                'name' =>  "user-read",
                'label' => "نمایش کاربر",
            ],
            [
                'name' =>  "user-update",
                'label' => "ویرایش کاربر",
            ],
            [
                'name' =>  "user-delete",
                'label' => "حذف کاربر",
            ],
            [
                'name' =>  "user-auth",
                'label' => "احراز هویت کاربر",
            ],
            [
                'name' =>  "user-hard-update",
                'label' => "ویرایش تمامی اطلاعات کاربر",
            ],
            [
                'name' =>  "user-pics-read",
                'label' => "مشاهده تصاویر کاربر",
            ],
            [
                'name' =>  "user-pics-delete",
                'label' => "حذف تصاویر کاربر",
            ],

            # wallet
            [
                'name' =>  "user-wallet-read",
                'label' => "مشاهده کیف پول کاربر",
            ],
            [
                'name' =>  "user-wallet-manual-deposit-withdraw",
                'label' => " تغییر موجودی کیف پول کاربر",
            ],

            # permissions
            [
                'name' =>  "permission-create",
                'label' => "ایجاد دسترسی",
            ],
            [
                'name' =>  "permission-read",
                'label' => "نمایش دسترسی",
            ],
            [
                'name' =>  "permission-update",
                'label' => "ویرایش دسترسی",
            ],
            [
                'name' =>  "permission-delete",
                'label' => "حذف دسترسی",
            ],

            # roles
            [
                'name' =>  "role-create",
                'label' => "ایجادنقش",
            ],
            [
                'name' =>  "role-read",
                'label' => "نمایش نقش",
            ],
            [
                'name' =>  "role-update",
                'label' => "ویرایش نقش",
            ],
            [
                'name' =>  "role-delete",
                'label' => "حذف نقش",
            ],

            #adnin
            [
                'name' =>  "admin-create",
                'label' => "ایجاد ادمین",
            ],
            [
                'name' =>  "admin-read",
                'label' => "نمایش ادمین",
            ],
            [
                'name' =>  "admin-update",
                'label' => "ویرایش ادمین",
            ],
            [
                'name' =>  "admin-delete",
                'label' => "حذف ادمین",
            ],
            [
                'name' =>  "admin-self-read",
                'label' => "نمایش پروفایل مدیر"
            ],
            [
                'name' =>  "admin-self-update",
                'label' => "ویرایش پروفایل مدیر"
            ],



        );
        foreach ($params as $value) {
            $permissionModel->create_permission($value);
        }
    }
}
