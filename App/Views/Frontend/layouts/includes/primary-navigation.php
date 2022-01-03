<ul id="menu-primary-menu" class="nav yamm">
    <li class="sale-clr menu-item animate-dropdown">
        <a title="صفحه نخست" href="<?= base_url() ?>">فروشگاه</a>
    </li>
    <li class="yamm-fw menu-item animate-dropdown">
        <a title="وبلاگ" href="<?= base_url() ?>blog">وبلاگ</a>
    </li>
    <li class="menu-item menu-item-has-children animate-dropdown dropdown">
        <a title="درباره ما" data-toggle="dropdown" aria-haspopup="true" class="dropdown-toggle" href="">درباره ما<span class="caret"></span></a>
        <ul role="menu" class=" dropdown-menu">
            <?php
            foreach ($about_menu as $aboutPageID => $aboutPageDetails) {
            ?>
                <li class="menu-item animate-dropdown">
                    <a title="<?= $aboutPageDetails['key'] ?>" href="<?= base_url() ?>about/<?= $aboutPageDetails['slug'] ?>"><?= $aboutPageDetails['key'] ?></a>
                </li>
            <?php
            }
            ?>
        </ul>
    </li>
    <li class="menu-item animate-dropdown">
        <a title="تماس با ما" href="<?= base_url() ?>contact">تماس با ما</a>
    </li>
    <li class="menu-item animate-dropdown"> 
        <a title="تخفیف ها" href="<?= base_url() ?>product/discounts"> تخفیف ها</a>
    </li>
</ul>