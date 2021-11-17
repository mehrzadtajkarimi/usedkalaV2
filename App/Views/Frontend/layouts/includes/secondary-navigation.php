<ul id="menu-secondary-menu" class="nav">
    <!-- <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2802 animate-dropdown">
            <a title="Track Your Order" href="track-your-order.html">
                <i class="tm tm-order-tracking"></i>پیگیری سفارشات</a>
        </li> -->
    <!-- <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-487 animate-dropdown dropdown">
                                    <a title="Dollar (US)" data-toggle="dropdown" class="dropdown-toggle" aria-haspopup="true" href="#">
                                        <i class="tm tm-dollar"></i>Dollar (US)
                                        <span class="caret"></span>
                                    </a>
                                    <ul role="menu" class=" dropdown-menu">
                                        <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-489 animate-dropdown">
                                            <a title="AUD" href="#">AUD</a>
                                        </li>
                                        <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-490 animate-dropdown">
                                            <a title="INR" href="#">INR</a>
                                        </li>
                                        <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-491 animate-dropdown">
                                            <a title="AED" href="#">AED</a>
                                        </li>
                                        <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-492 animate-dropdown">
                                            <a title="SGD" href="#">SGD</a>
                                        </li>
                                    </ul>
                                </li> -->
    <!-- .dropdown-menu -->
    <li class="menu-item">
        <?php if ($authenticated ?? false) :?>
            <a title="login" href="<?= base_url() ?>profile" class="p-1">
                <i class="tm tm-login-register "></i>
                <b>پروفایل</b>
            </a>
        <?php else :?>
            <a title="login" href="<?= base_url() ?>login">
                <i class="tm tm-login-register"></i>
                <b>ثبت نام یا ورود</b>
            </a>
        <?php endif;?>
    </li>
    <!-- <li class="techmarket-flex-more-menu-item dropdown">
        <a title="..." href="#" data-toggle="dropdown" class="dropdown-toggle">...</a>
        <ul class="overflow-items dropdown-menu"></ul>
    </li> -->
</ul>