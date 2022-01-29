<!-- Sidebar user panel (optional) -->
<div class="pb-3 mt-3 mb-3 user-panel d-flex">
    <a href="<?= base_url() ?>admin/profile" class="image">
        <img src="<?= asset_url() ?>Backend/dist/img/user.png" class="img-circle elevation-2" alt="User Image">
        <span class=""><?= admin_name('first_name') . ' ' .  admin_name('last_name')  ?></span>
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
        <?php if (can('manager-user')) : ?>
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
        <?php endif; ?>
        <?php if (can('manager-category')) : ?>
            <li class="nav-item has-treeview">
                <a href="#" class="nav-link <?= is_active(['/admin/category/product', '/admin/category/edit/product', '/admin/category/create/product', '/admin/category/blog', '/admin/category/edit/blog', '/admin/category/create/blog']) ?> ">
                    <p>
                        دسته بندی ها
                        <i class="right fa fa-angle-left"></i>
                    </p>
                    <i class="nav-icon fa fa-book"></i>
                </a>
                <ul class="nav nav-treeview <?= is_active(['/admin/category/product', '/admin/category/edit/product', '/admin/category/create/product', '/admin/category/blog', '/admin/category/edit/blog', '/admin/category/create/blog']) ?> ">
                    <li class="nav-item">
                        <a href="<?= base_url() ?>admin/category/product" class="nav-link <?= is_active(['/admin/category/product', '/admin/category/edit/product', '/admin/category/create/product']) ?>">
                            <p>لیست دسته بندی محصول</p>
                            <i class="fa fa-circle-o nav-icon"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<?= base_url() ?>admin/category/blog" class="nav-link <?= is_active(['/admin/category/blog', '/admin/category/edit/blog', '/admin/category/create/blog']) ?>">
                            <p>لیست دسته بندی وبـــــلاگ</p>
                            <i class="fa fa-circle-o nav-icon"></i>
                        </a>
                    </li>
                </ul>
            </li>
        <?php endif; ?>
        <?php if (can('manager-product')) : ?>
            <li class="nav-item has-treeview">
                <a href="#" class="nav-link <?= is_active(['/admin/product', '/admin/product/edit', '/admin/brand', '/admin/brand/edit']) ?> ">
                    <p>
                        محصولات
                        <i class="right fa fa-angle-left"></i>
                    </p>
                    <i class="nav-icon fa fa-product-hunt"></i>
                </a>
                <ul class="nav nav-treeview <?= is_active(['/admin/product', '/admin/product/edit', '/admin/brand', '/admin/brand/edit']) ?>">
                    <li class="nav-item">
                        <a href="<?= base_url() ?>admin/product" class="nav-link <?= is_active(['/admin/product', '/admin/product/edit']) ?>">
                            <p>لیست محصولات </p>
                            <i class="fa fa-circle-o nav-icon"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<?= base_url() ?>admin/brand" class="nav-link <?= is_active(['/admin/brand', '/admin/brand/edit']) ?>">
                            <p>لیست برند ها </p>
                            <i class="fa fa-circle-o nav-icon"></i>
                        </a>
                    </li>
                </ul>
            </li>
        <?php endif; ?>
        <?php if (can('manager-tag')) : ?>
            <li class="nav-item has-treeview">
                <a href="#" class="nav-link  <?= is_active(['/admin/tag', '/admin/tag/edit']) ?>">
                    <p>
                        (برچسب) تگ
                        <i class="right fa fa-angle-left"></i>
                    </p>
                    <i class="fa fa-tags nav-icon" aria-hidden="true"></i>
                </a>

                <ul class="nav nav-treeview  <?= is_active(['/admin/tag', '/admin/tag/edit']) ?>">
                    <li class="nav-item">
                        <a href="<?= base_url() ?>admin/tag" class="nav-link <?= is_active(['/admin/tag', '/admin/tag/edit']) ?>">
                            <p>لیست تگ ها</p>
                            <i class="fa fa-circle-o nav-icon"></i>
                        </a>
                    </li>
                </ul>
            </li>
        <?php endif; ?>
        <?php if (can('manager-blog')) : ?>
            <li class="nav-item has-treeview">
                <a href="#" class="nav-link  <?= is_active(['/admin/blog', '/admin/blog/edit']) ?>">
                    <p>
                        بلاگها
                        <i class="right fa fa-angle-left"></i>
                    </p>
                    <i class="nav-icon fa fa-rss-square"></i>
                </a>
                <ul class="nav nav-treeview <?= is_active(['/admin/blog', '/admin/blog/edit']) ?>">
                    <li class="nav-item">
                        <a href="<?= base_url() ?>admin/blog" class="nav-link <?= is_active(['/admin/blog', '/admin/blog/edit']) ?>">
                            <p>لیست بلاگ </p>
                            <i class="fa fa-circle-o nav-icon"></i>
                        </a>
                    </li>
                </ul>
            </li>
        <?php endif; ?>
        <?php if (can('manager-discount')) : ?>
            <li class="nav-item has-treeview">
                <a href="#" class="nav-link <?= is_active(['/admin/discount', '/admin/discount/create', '/admin/discount/edit', '/admin/coupon', '/admin/coupon/create', '/admin/coupon/edit', '/admin/sample', '/admin/sample/create', '/admin/sample/edit']) ?>">
                    <p>
                        تخفیفات
                        <i class="right fa fa-angle-left"></i>
                    </p>
                    <i class="fa fa-bullhorn nav-icon"></i>
                </a>

                <ul class="nav nav-treeview <?= is_active(['/admin/discount', '/admin/discount/create', '/admin/discount/edit', '/admin/coupon', '/admin/coupon/create', '/admin/coupon/edit', '/admin/sample', '/admin/sample/create', '/admin/sample/edit']) ?>">
                    <li class="nav-item">
                        <a href="<?= base_url() ?>admin/discount" class="nav-link  <?= is_active(['/admin/discount', '/admin/discount/create', '/admin/discount/edit']) ?>">
                            <p>لیست تخفیفات</p>
                            <i class="fa fa-circle-o nav-icon"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<?= base_url() ?>admin/coupon" class="nav-link  <?= is_active(['/admin/coupon', '/admin/coupon/create', '/admin/coupon/edit']) ?>">
                            <p>لیست کد تخفیف</p>
                            <i class="fa fa-circle-o nav-icon"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<?= base_url() ?>admin/sample" class="nav-link  <?= is_active(['/admin/sample', '/admin/sample/create', '/admin/sample/edit']) ?>">
                            <p>لیست اشانتیون</p>
                            <i class="fa fa-circle-o nav-icon"></i>
                        </a>
                    </li>
                    <?php /*
                    <li class="nav-item">
                        <a href="<?= base_url() ?>admin/sample" class="nav-link  <?= is_active('/admin/sample') ?>">
                            <p>لیست اشانتیون</p>
                            <i class="fa fa-circle-o nav-icon"></i>
                        </a>
                    </li> */ ?>
                </ul>
            </li>
        <?php endif; ?>
        <?php if (can('manager-cart')) : ?>
            <li class="nav-item has-treeview">
                <a href="#" class="nav-link <?= is_active(['/admin/order']) ?>">
                    <p>
                        سفارشات
                        <i class="right fa fa-angle-left"></i>
                    </p>
                    <i class="fa fa-shopping-cart nav-icon" aria-hidden="true"></i>
                </a>

                <ul class="nav nav-treeview  <?= is_active(['/admin/order']) ?>">
                    <li class="nav-item">
                        <a href="<?= base_url() ?>admin/order" class="nav-link  <?= is_active('/admin/order') ?>">
                            <p>لیست سفارشات</p>
                            <i class="fa fa-circle-o nav-icon"></i>
                        </a>
                    </li>
                </ul>
            </li>
        <?php endif; ?>
        <?php if (can('manager-comment')) : ?>
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
                        <a href="<?= base_url() ?>admin/comment" class="nav-link <?= is_active('/admin/comment') ?>">
                            <p>لیست نظرات</p>
                            <i class="fa fa-circle-o nav-icon"></i>
                        </a>
                    </li>
                </ul>
            </li>
        <?php endif; ?>
        <?php if (can('manager-setting')) : ?>
            <li class="nav-item has-treeview">
                <a href="#" class="nav-link <?= is_active(['/admin/setting','/admin/setting/create','/admin/setting/edit','/admin/staticpages','/admin/staticpages/create','/admin/staticpages/edit','/admin/footer','/admin/footer/create','/admin/footer/edit', '/admin/slider','/admin/slider/edit', '/admin/pagemetas','/admin/pagemetas/edit']) ?>">
                    <p>
                        تنظیمات
                        <i class="right fa fa-angle-left"></i>
                    </p>
                    <i class="fa fa-cogs nav-icon" aria-hidden="true"></i>
                </a>

                <ul class="nav nav-treeview <?= is_active(['/admin/setting','/admin/setting/create','/admin/setting/edit','/admin/staticpages','/admin/staticpages/create','/admin/staticpages/edit','/admin/footer','/admin/footer/create','/admin/footer/edit', '/admin/slider','/admin/slider/edit', '/admin/pagemetas','/admin/pagemetas/edit']) ?>">
                    <li class="nav-item">
                        <a href="<?= base_url() ?>admin/setting" class="nav-link  <?= is_active(['/admin/setting', '/admin/setting/create', '/admin/setting/edit']) ?>">
                            <p>ویژگی ها</p>
                            <i class="fa fa-circle-o nav-icon"></i>
                        </a>
                    </li>
					<li class="nav-item">
                        <a href="<?= base_url() ?>admin/staticpages" class="nav-link  <?= is_active(['/admin/staticpages','/admin/staticpages/create','/admin/staticpages/edit']) ?>">
                            <p>صفحات درباره ما</p>
                            <i class="fa fa-circle-o nav-icon"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<?= base_url() ?>admin/pagemetas" class="nav-link  <?= is_active(['/admin/pagemetas','/admin/pagemetas/edit']) ?>">
                            <p>متای صفحات اصلی</p>
                            <i class="fa fa-circle-o nav-icon"></i>
                        </a>
                    </li>
                    <!--li class="nav-item">
                        <a href="<?= base_url() ?>admin/footer" class="nav-link  <?= is_active(['/admin/footer', '/admin/footer/create', '/admin/footer/edit']) ?>">
                            <p>پاورقی</p>
                            <i class="fa fa-circle-o nav-icon"></i>
                        </a>
                    </li-->
                    <li class="nav-item">
                        <a href="<?= base_url() ?>admin/slider" class="nav-link  <?= is_active(['/admin/slider', '/admin/slider/edit']) ?>">
                            <p>اسلایدر</p>
                            <i class="fa fa-circle-o nav-icon"></i>
                        </a>
                    </li>
                </ul>
            </li>
        <?php endif; ?>
        <?php if (can('super-admin')) : ?>
            <li class="nav-item has-treeview">
                <a href="#" class="nav-link <?= is_active(['/admin/permission', '/admin/role', '/admin/access']) ?>">
                    <p>
                        سطوح دسترسی
                        <i class="right fa fa-angle-left"></i>
                    </p>
                    <i class="fa fa-users nav-icon" aria-hidden="true"></i>
                </a>

                <ul class="nav nav-treeview <?= is_active(['/admin/permission', '/admin/role', '/admin/access']) ?>">
                    <?php /*
					<li class="nav-item">
						<a href="<?= base_url() ?>admin/permission" class="nav-link  <?= is_active('/admin/permission') ?>">
							<p>(دسترسی‌ها) لیست مجوزها</p>
							<i class="fa fa-circle-o nav-icon"></i>
						</a>
					</li>
					*/ ?>
                    <li class="nav-item">
                        <a href="<?= base_url() ?>admin/role" class="nav-link  <?= is_active('/admin/role') ?>">
                            <p>(سمت‌ها) لیست نقش‌ها</p>
                            <i class="fa fa-circle-o nav-icon"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<?= base_url() ?>admin/access" class="nav-link  <?= is_active('/admin/access') ?>">
                            <p> لیست ادمین‌ها</p>
                            <i class="fa fa-circle-o nav-icon"></i>
                        </a>
                    </li>
                </ul>
            </li>
        <?php endif; ?>
    </ul>
</nav>
<!-- /.sidebar-menu -->