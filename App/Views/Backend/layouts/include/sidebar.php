<!-- Sidebar user panel (optional) -->
<div class="pb-3 mt-3 mb-3 user-panel d-flex">
    <a href="<?= base_url() ?>admin/profile" class="image">
        <img src="<?= asset_url() ?>Backend/dist/img/user.png" class="img-circle elevation-2" alt="User Image">
        <img src="<?= asset_url() ?>Backend/dist/img/user.png" class="img-circle elevation-2" alt="User Image">
        <span class="">مهرزاد</span>
    </a>
    <div class="info">
        <a href="<?= base_url() ?>admin/logout" class="position-absolute " style="right: 195px">
            <i class="p-1 fa fa-sign-out"></i>
        </a>
    </div>
</div>

<!-- Sidebar Menu -->
<nav class="mt-2">
    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <!-- Add icons to the links using the .nav-icon class
        with font-awesome or any other icon font library -->
        <li class="nav-item has-treeview">
            <a href="#" class="nav-link <?= is_active('/admin/users') ?> ">
                <p>
                    کاربران
                    <i class="right fa fa-angle-left"></i>
                </p>
                <i class="nav-icon fa fa-tachometer"></i>
            </a>
            <ul class="nav nav-treeview <?= is_active('/admin/users') ?>">
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/users" class="nav-link  <?= is_active('/admin/users') ?>">
                        <p>لیست کاربران</p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
            </ul>
        </li>
        <li class="nav-item has-treeview">
            <a href="#" class="nav-link <?= is_active(['/admin/category','admin/category/blog']) ?> ">
                <p>
                    دسته بندی ها
                    <i class="right fa fa-angle-left"></i>
                </p>
                <i class="nav-icon fa fa-book"></i>
            </a>
            <ul class="nav nav-treeview <?= is_active(['/admin/category','admin/category/blog']) ?> ">
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/category" class="nav-link <?= is_active('/admin/category')?>">
                        <p>لیست دسته بندی محصول</p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/category/blog" class="nav-link <?= is_active('/admin/category/blog')?>">
                        <p>لیست دسته بندی وبـــــلاگ</p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
            </ul>
        </li>
        <li class="nav-item has-treeview">
            <a href="#" class="nav-link <?= is_active(['/admin/product','admin/brand']) ?> ">
                <p>
                    محصولات
                    <i class="right fa fa-angle-left"></i>
                </p>
                <i class="nav-icon fa fa-product-hunt"></i>
            </a>
            <ul class="nav nav-treeview <?= is_active(['/admin/product','admin/brand']) ?>">
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/product" class="nav-link <?= is_active('/admin/product')?>">
                        <p>لیست محصولات </p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
            </ul>
            <ul class="nav nav-treeview">
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/brand" class="nav-link <?= is_active('/admin/brand')?>">
                        <p>لیست برند ها </p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
            </ul>
        </li>
        <li class="nav-item has-treeview">
            <a href="#" class="nav-link  <?= is_active(['/admin/tag']) ?>">
                <p>
                    (برچسب) تگ
                    <i class="right fa fa-angle-left"></i>
                </p>
                <i class="fa fa-tags nav-icon" aria-hidden="true"></i>
            </a>

            <ul class="nav nav-treeview  <?= is_active(['/admin/tag']) ?>">
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/tag" class="nav-link <?= is_active('/admin/tag')?>">
                        <p>لیست تگ ها</p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
            </ul>
        </li>
        <li class="nav-item has-treeview">
            <a href="#" class="nav-link  <?= is_active(['/admin/blog']) ?>">
                <p>
                    بلاگها
                    <i class="right fa fa-angle-left"></i>
                </p>
                <i class="nav-icon fa fa-rss-square"></i>
            </a>
            <ul class="nav nav-treeview <?= is_active(['/admin/blog']) ?>">
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/blog" class="nav-link <?= is_active('/admin/blog')?>">
                        <p>لیست بلاگ </p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
            </ul>
        </li>
        <li class="nav-item has-treeview">
            <a href="#" class="nav-link <?= is_active(['/admin/discount','admin/sample']) ?>">
                <p>
                    تخفیفات
                    <i class="right fa fa-angle-left"></i>
                </p>
                <i class="fa fa-bullhorn nav-icon"></i>
            </a>

            <ul class="nav nav-treeview <?= is_active(['/admin/discount','admin/sample']) ?>">
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/discount" class="nav-link  <?= is_active('/admin/discount')?>">
                        <p>لیست تخفیفات</p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/sample" class="nav-link  <?= is_active('/admin/sample')?>">
                        <p>لیست اشانتیون</p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
            </ul>
        </li>
        <li class="nav-item has-treeview">
            <a href="#" class="nav-link <?= is_active(['/admin/cart']) ?>">
                <p>
                    سبد خرید
                    <i class="right fa fa-angle-left"></i>
                </p>
                <i class="fa fa-shopping-cart nav-icon" aria-hidden="true"></i>
            </a>

            <ul class="nav nav-treeview  <?= is_active(['/admin/cart']) ?>">
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/cart" class="nav-link  <?= is_active('/admin/cart')?>">
                        <p>لیست سفارشات</p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
            </ul>
        </li>

        <li class="nav-item has-treeview">
            <a href="#" class="nav-link <?= is_active(['/admin/comment']) ?>">
                <p>
                    نظرات
                    <i class="right fa fa-angle-left"></i>
                </p>
                <i class="fa fa-comments-o nav-icon" aria-hidden="true"></i>
            </a>

            <ul class="nav nav-treeview <?= is_active(['/admin/comment']) ?>">
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/comment" class="nav-link <?= is_active('/admin/comment')?>">
                        <p>لیست نظرات</p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
            </ul>
        </li>
        <li class="nav-item has-treeview">
            <a href="#" class="nav-link <?= is_active(['/admin/setting','/admin/slider']) ?>">
                <p>
                    تنظیمات
                    <i class="right fa fa-angle-left"></i>
                </p>
                <i class="fa fa-cogs nav-icon" aria-hidden="true"></i>
            </a>

            <ul class="nav nav-treeview <?= is_active(['/admin/setting','/admin/slider']) ?>">
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/setting" class="nav-link  <?= is_active('/admin/setting')?>">
                        <p>لیست تنظیمات</p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/slider" class="nav-link  <?= is_active('/admin/slider')?>">
                        <p>اسلایدر</p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/permission" class="nav-link  <?= is_active('/admin/permission')?>">
                        <p>(مجوزها) سطوح دسترسی</p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
            </ul>
        </li>
        <li class="nav-item has-treeview">
            <a href="#" class="nav-link <?= is_active(['/admin/permission','/admin/slider']) ?>">
                <p>
                سطوح دسترسی
                    <i class="right fa fa-angle-left"></i>
                </p>
                <i class="fa fa-users nav-icon" aria-hidden="true"></i>
            </a>

            <ul class="nav nav-treeview <?= is_active(['/admin/permission','/admin/role']) ?>">
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/permission" class="nav-link  <?= is_active('/admin/permission')?>">
                        <p>(مجوزها) لیست دسترسی</p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/role" class="nav-link  <?= is_active('/admin/role')?>">
                        <p>(سمت ها) لیست مقام ها</p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
            </ul>
        </li>
    </ul>
</nav>
<!-- /.sidebar-menu -->