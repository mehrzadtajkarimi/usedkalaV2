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
            <a href="#" class="nav-link">
                <p>
                    کاربران
                    <i class="right fa fa-angle-left"></i>
                </p>
                <i class="nav-icon fa fa-tachometer"></i>
            </a>
            <ul class="nav nav-treeview">
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/users" class="nav-link">
                        <p>لیست کاربران</p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
            </ul>
        </li>
        <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
                <p>
                    دسته بندی ها
                    <i class="right fa fa-angle-left"></i>
                </p>
                <i class="nav-icon fa fa-book"></i>
            </a>
            <ul class="nav nav-treeview">
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/category" class="nav-link">
                        <p>لیست دسته بندی محصول</p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/category/blog" class="nav-link">
                        <p>لیست دسته بندی وبـــــلاگ</p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
            </ul>
        </li>
        <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
                <p>
                    محصولات
                    <i class="right fa fa-angle-left"></i>
                </p>
                <i class="nav-icon fa fa-product-hunt"></i>
            </a>
            <ul class="nav nav-treeview">
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/product" class="nav-link">
                        <p>لیست محصولات </p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
            </ul>
            <ul class="nav nav-treeview">
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/brand" class="nav-link">
                        <p>لیست برند ها </p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
            </ul>
        </li>
        <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
                <p>
                    بلاگها
                    <i class="right fa fa-angle-left"></i>
                </p>
                <i class="nav-icon fa fa-rss-square"></i>
            </a>
            <ul class="nav nav-treeview">
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/blog" class="nav-link">
                        <p>لیست بلاگ </p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
            </ul>
        </li>
        <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
                <p>
                    تخفیفات
                    <i class="right fa fa-angle-left"></i>
                </p>
                <i class="fa fa-bullhorn nav-icon"></i>
            </a>

            <ul class="nav nav-treeview">
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/discount" class="nav-link">
                        <p>لیست تخفیفات</p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/sample" class="nav-link">
                        <p>لیست اشانتیون</p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
            </ul>
        </li>
        <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
                <p>
                    سبد خرید
                    <i class="right fa fa-angle-left"></i>
                </p>
                <i class="fa fa-shopping-cart nav-icon" aria-hidden="true"></i>
            </a>

            <ul class="nav nav-treeview">
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/cart" class="nav-link">
                        <p>لیست سفارشات</p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
            </ul>
        </li>
        <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
                <p>
                    تنظیمات
                    <i class="right fa fa-angle-left"></i>
                </p>
                <i class="fa fa-cogs nav-icon" aria-hidden="true"></i>
            </a>

            <ul class="nav nav-treeview">
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/setting" class="nav-link">
                        <p>لیست تنظیمات</p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/slider" class="nav-link">
                        <p>اسلایدر</p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
            </ul>
        </li>
        <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
                <p>
                    نظرات
                    <i class="right fa fa-angle-left"></i>
                </p>
                <i class="fa fa-comments-o nav-icon" aria-hidden="true"></i>
            </a>

            <ul class="nav nav-treeview">
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/comment" class="nav-link">
                        <p>لیست نظرات</p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
            </ul>
        </li>
        <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
                <p>
                    (برچسب) تگ
                    <i class="right fa fa-angle-left"></i>
                </p>
                <i class="fa fa-tags nav-icon" aria-hidden="true"></i>
            </a>

            <ul class="nav nav-treeview">
                <li class="nav-item">
                    <a href="<?= base_url() ?>admin/tag" class="nav-link">
                        <p>لیست تگ ها</p>
                        <i class="fa fa-circle-o nav-icon"></i>
                    </a>
                </li>
            </ul>
        </li>
    </ul>
</nav>
<!-- /.sidebar-menu -->