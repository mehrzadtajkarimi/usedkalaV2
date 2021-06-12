<!DOCTYPE html>
<html lang="fa-IR" itemscope="itemscope" itemtype="http://schema.org/WebPage">

<!-- Mirrored from transvelo.github.io/techmarket-html/home-v1.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 30 Oct 2019 07:08:35 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<!-- /Added by HTTrack -->

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
    <title>Techmarket HTML</title>
    <link rel="stylesheet" type="text/css" href="<?= asset_url() ?>css/bootstrap.min.css" media="all" />
    <link rel="stylesheet" type="text/css" href="<?= asset_url() ?>css/font-awesome.min.css" media="all" />
    <link rel="stylesheet" type="text/css" href="<?= asset_url() ?>css/bootstrap-grid.min.css" media="all" />
    <link rel="stylesheet" type="text/css" href="<?= asset_url() ?>css/bootstrap-reboot.min.css" media="all" />
    <link rel="stylesheet" type="text/css" href="<?= asset_url() ?>css/font-techmarket.css" media="all" />
    <link rel="stylesheet" type="text/css" href="<?= asset_url() ?>css/slick.css" media="all" />
    <link rel="stylesheet" type="text/css" href="<?= asset_url() ?>css/techmarket-font-awesome.css" media="all" />
    <link rel="stylesheet" type="text/css" href="<?= asset_url() ?>css/slick-style.css" media="all" />
    <link rel="stylesheet" type="text/css" href="<?= asset_url() ?>css/animate.min.css" media="all" />
    <link rel="stylesheet" type="text/css" href="<?= asset_url() ?>css/style.css" media="all" />
    <link rel="stylesheet" type="text/css" href="<?= asset_url() ?>css/style_uk.css" media="all" />
    <link rel="stylesheet" type="text/css" href="<?= asset_url() ?>css/colors/blue.css" media="all" />
    <!-- Demo Purpose Only. Should be removed in production -->
    <link rel="stylesheet" href="<?= asset_url() ?>css/config.css">
    <link href="<?= asset_url() ?>css/colors/blue.css" rel="alternate stylesheet" title="Blue color">
    <link href="<?= asset_url() ?>css/colors/flat-green.css" rel="alternate stylesheet" title="Flat Green color">
    <link href="<?= asset_url() ?>css/colors/green.css" rel="alternate stylesheet" title="Green color">
    <link href="<?= asset_url() ?>css/colors/orange.css" rel="alternate stylesheet" title="Orange color">
    <link href="<?= asset_url() ?>css/colors/red.css" rel="alternate stylesheet" title="Red color">
    <link href="<?= asset_url() ?>css/colors/yellow.css" rel="alternate stylesheet" title="Yellow color">
    <!-- Demo Purpose Only. Should be removed in production : END -->
    <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500,900" rel="stylesheet">
    <link rel="shortcut icon" href="<?= asset_url() ?>images/fav-icon.png">
</head>

<body dir="rtl" class="woocommerce-active page-template-template-homepage-v1 can-uppercase">
    <div id="page" class="hfeed site">
        <div class="top-bar top-bar-v1">
            <div class="col-full">
                <!-- <ul id="menu-top-bar-right" class="nav justify-content-center">
                    <li class="menu-item animate-dropdown">
                        <a title="TechMarket eCommerce - Always free delivery" href="contact-v1.html">TechMarket eCommerce &#8211; Always free delivery</a>
                    </li>
                    <li class="menu-item animate-dropdown">
                        <a title="Quality Guarantee of products" href="shop.html">Quality Guarantee of products</a>
                    </li>
                    <li class="menu-item animate-dropdown">
                        <a title="Fast returnings program" href="track-your-order.html">Fast returnings program</a>
                    </li>
                    <li class="menu-item animate-dropdown">
                        <a title="No additional fees" href="contact-v2.html">No additional fees</a>
                    </li>
                </ul> -->
                <!-- .nav -->
            </div>
            <!-- .col-full -->
        </div>
        <!-- .top-bar-v1 -->
        <header id="masthead" class="site-header header-v1" style="background-image: none; ">
            <div class="col-full desktop-only">
                <div class="techmarket-sticky-wrap">
                    <div class="row">
                        <div class="site-branding">
                            <a href="<?= base_url(); ?>" class="custom-logo-link" rel="home">
                                <img src="<?= asset_url() ?>images/uklogo.png"  alt="یوزدکالا" width="110px">
                            </a>
                            <!-- /.custom-logo-link -->
                        </div>
                        <!-- /.site-branding -->
                        <!-- ============================================================= End Header Logo ============================================================= -->








                        <!-- ============================================================= navbar ============================================================= -->

                        <?=
                        include_once  BASEPATH.'views/layouts/navbar.php' ;
                        ?>

                        <!-- ============================================================= navbar ============================================================= -->













                    </div>
                    <!-- /.row -->
                </div>
                <!-- .techmarket-sticky-wrap -->
                <div class="row align-items-center">
                    <div id="departments-menu" class="dropdown departments-menu">
                        <button class="btn dropdown-toggle btn-block" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="tm tm-departments-thin"></i>
                            <span>تمامی محصولات</span>
                        </button>
                        <ul id="menu-departments-menu" class="dropdown-menu yamm departments-menu-dropdown">

                            <li class="yamm-tfw menu-item menu-item-has-children animate-dropdown dropdown-submenu">
                                <a title="رک" data-toggle="dropdown" class="dropdown-toggle" aria-haspopup="true" href="#">سرور <span class="caret"></span></a>
     
                                <ul role="menu" class=" dropdown-menu">
                                    <li class="menu-item menu-item-object-static_block animate-dropdown">
                                        <div class="yamm-content">
                                            <div class="bg-yamm-content bg-yamm-content-bottom bg-yamm-content-left">
                                                <div class="kc-col-container">
                                                    <div class="kc_single_image">
                                                        <img src="<?= asset_url() ?>images/megamenu.jpg" class="" alt="" />
                                                    </div>
                                                    <!-- .kc_single_image -->
                                                </div>
                                                <!-- .kc-col-container -->
                                            </div>
                                            <!-- .bg-yamm-content -->
                                            <div class="row yamm-content-row">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="kc-col-container">
                                                        <div class="kc_text_block">
                                                            <ul>
                                                                <li class="nav-title">Computers &amp; Accessories</li>
                                                                <li><a href="shop.html">All Computers &amp;
                                                                        Accessories</a></li>
                                                                <li><a href="shop.html">Laptops, Desktops &amp;
                                                                        Monitors</a></li>
                                                                <li><a href="shop.html">Pen Drives, Hard Drives &amp;
                                                                        Memory Cards</a></li>
                                                                <li><a href="shop.html">Printers &amp; Ink</a></li>
                                                                <li><a href="shop.html">Networking &amp; Internet
                                                                        Devices</a></li>
                                                                <li><a href="shop.html">Computer Accessories</a></li>
                                                                <li><a href="shop.html">Software</a></li>
                                                                <li class="nav-divider"></li>
                                                                <li>
                                                                    <a href="shop.html">
                                                                        <span class="nav-text">All Electronics</span>
                                                                        <span class="nav-subtext">Discover more
                                                                            products</span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <!-- .kc_text_block -->
                                                    </div>
                                                    <!-- .kc-col-container -->
                                                </div>
                                                <!-- .kc_column -->
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="kc-col-container">
                                                        <div class="kc_text_block">
                                                            <ul>
                                                                <li class="nav-title">Office &amp; Stationery</li>
                                                                <li><a href="shop.html">All Office &amp; Stationery</a>
                                                                </li>
                                                                <li><a href="shop.html">Pens &amp; Writing</a></li>
                                                            </ul>
                                                        </div>
                                                        <!-- .kc_text_block -->
                                                    </div>
                                                    <!-- .kc-col-container -->
                                                </div>
                                                <!-- .kc_column -->
                                            </div>
                                            <!-- .kc_row -->
                                        </div>
                                        <!-- .yamm-content -->
                                    </li>
                                </ul>
                            </li>
                            <li class="yamm-tfw menu-item menu-item-has-children animate-dropdown dropdown-submenu">
                                <a title="Cameras &amp; Photo" data-toggle="dropdown" class="dropdown-toggle" aria-haspopup="true" href="#">ذخیره ساز<span class="caret"></span></a>
                                <ul role="menu" class=" dropdown-menu">
                                    <li class="menu-item menu-item-object-static_block animate-dropdown">
                                        <div class="yamm-content">
                                            <div class="bg-yamm-content bg-yamm-content-bottom bg-yamm-content-left">
                                                <div class="kc-col-container">
                                                    <div class="kc_single_image">
                                                        <img src="<?= asset_url() ?>images/megamenu-1.jpg" class="" alt="" />
                                                    </div>
                                                    <!-- .kc_single_image -->
                                                </div>
                                                <!-- .kc-col-container -->
                                            </div>
                                            <!-- .bg-yamm-content -->
                                            <div class="row yamm-content-row">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="kc-col-container">
                                                        <div class="kc_text_block">
                                                            <ul>
                                                                <li class="nav-title">Cameras & Photography</li>
                                                                <li><a href="shop.html">All Cameras & Photography</a>
                                                                </li>
                                                                <li><a href="shop.html">Point & Shoot Cameras</a></li>
                                                                <li><a href="shop.html">Lenses</a></li>
                                                                <li><a href="shop.html">Camera Accessories</a></li>
                                                                <li><a href="shop.html">Security & Surveillance</a></li>
                                                                <li><a href="shop.html">Binoculars & Telescopes</a></li>
                                                                <li><a href="shop.html">Camcorders</a></li>
                                                                <li class="nav-divider"></li>
                                                                <li>
                                                                    <a href="shop.html">
                                                                        <span class="nav-text">All Electronics</span>
                                                                        <span class="nav-subtext">Discover more
                                                                            products</span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <!-- .kc_text_block -->
                                                    </div>
                                                    <!-- .kc-col-container -->
                                                </div>
                                                <!-- .kc_column -->
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="kc-col-container">
                                                        <div class="kc_text_block">
                                                            <ul>
                                                                <li class="nav-title">Audio & Video</li>
                                                                <li><a href="shop.html">All Audio & Video</a></li>
                                                                <li><a href="shop.html">Headphones & Speakers</a></li>
                                                                <li><a href="shop.html">Home Entertainment Systems</a>
                                                                </li>
                                                                <li><a href="shop.html">MP3 & Media Players</a></li>
                                                            </ul>
                                                        </div>
                                                        <!-- .kc_text_block -->
                                                    </div>
                                                    <!-- .kc-col-container -->
                                                </div>
                                                <!-- .kc_column -->
                                            </div>
                                            <!-- .kc_row -->
                                        </div>
                                        <!-- .yamm-content -->
                                    </li>
                                </ul>
                            </li>
                            <li class="yamm-tfw menu-item menu-item-has-children animate-dropdown dropdown-submenu">
                                <a title="Smart Phones &amp; Tablets" data-toggle="dropdown" class="dropdown-toggle" aria-haspopup="true" href="#">تجهیزات شبکه <span class="caret"></span></a>
                                <ul role="menu" class=" dropdown-menu">
                                    <li class="menu-item menu-item-object-static_block animate-dropdown">
                                        <div class="yamm-content">
                                            <div class="bg-yamm-content bg-yamm-content-bottom bg-yamm-content-left">
                                                <div class="kc-col-container">
                                                    <div class="kc_single_image">
                                                        <img src="<?= asset_url() ?>images/megamenu.jpg" class="" alt="" />
                                                    </div>
                                                    <!-- .kc_single_image -->
                                                </div>
                                                <!-- .kc-col-container -->
                                            </div>
                                            <!-- .bg-yamm-content -->
                                            <div class="row yamm-content-row">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="kc-col-container">
                                                        <div class="kc_text_block">
                                                            <ul>
                                                                <li class="nav-title">Computers &amp; Accessories</li>
                                                                <li><a href="shop.html">All Computers &amp;
                                                                        Accessories</a></li>
                                                                <li><a href="shop.html">Laptops, Desktops &amp;
                                                                        Monitors</a></li>
                                                                <li><a href="shop.html">Pen Drives, Hard Drives &amp;
                                                                        Memory Cards</a></li>
                                                                <li><a href="shop.html">Printers &amp; Ink</a></li>
                                                                <li><a href="shop.html">Networking &amp; Internet
                                                                        Devices</a></li>
                                                                <li><a href="shop.html">Computer Accessories</a></li>
                                                                <li><a href="shop.html">Software</a></li>
                                                                <li class="nav-divider"></li>
                                                                <li>
                                                                    <a href="shop.html">
                                                                        <span class="nav-text">All Electronics</span>
                                                                        <span class="nav-subtext">Discover more
                                                                            products</span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <!-- .kc_text_block -->
                                                    </div>
                                                    <!-- .kc-col-container -->
                                                </div>
                                                <!-- .kc_column -->
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="kc-col-container">
                                                        <div class="kc_text_block">
                                                            <ul>
                                                                <li class="nav-title">Office &amp; Stationery</li>
                                                                <li><a href="shop.html">All Office &amp; Stationery</a>
                                                                </li>
                                                                <li><a href="shop.html">Pens &amp; Writing</a></li>
                                                            </ul>
                                                        </div>
                                                        <!-- .kc_text_block -->
                                                    </div>
                                                    <!-- .kc-col-container -->
                                                </div>
                                                <!-- .kc_column -->
                                            </div>
                                            <!-- .kc_row -->
                                        </div>
                                        <!-- .yamm-content -->
                                    </li>
                                </ul>
                            </li>

                        </ul>
                    </div>
                    <!-- .departments-menu -->
                    <form class="navbar-search" method="get" action="https://transvelo.github.io/techmarket-html/home-v1.html">
                        <label class="sr-only screen-reader-text" for="search">جستجو:</label>
                        <div class="input-group">
                            <input type="text" id="search" class="form-control search-field product-search-field" dir="ltr" value="" name="s" placeholder="جستجوی محصول" style='font-family: "IRANSans";direction: rtl;' />
                            <div class="input-group-addon search-categories">
                                <select name='product_cat' id='product_cat' class='postform resizeselect' style='font-family: "IRANSans"'>
                                    <option value='0' selected='selected' style='font-family: "IRANSans"'>تمامی محصولات
                                    </option>
                                    <option class="level-0" value="television">Televisions</option>

                                </select>
                            </div>
                            <!-- .input-group-addon -->
                            <div class="input-group-btn">
                                <input type="hidden" id="search-param" name="post_type" value="product" />
                                <button type="submit" class="btn btn-primary">
                                    <i class="fa fa-search"></i>
                                    <span class="search-btn">جستجو</span>
                                </button>
                            </div>
                            <!-- .input-group-btn -->
                        </div>
                        <!-- .input-group -->
                    </form>
                    <!-- .navbar-search -->
                    <ul class="header-compare nav navbar-nav">
                        <li class="nav-item">
                            <a href="compare.html" class="nav-link">
                                <i class="tm tm-compare"></i>
                                <span id="top-cart-compare-count" class="value">3</span>
                            </a>
                        </li>
                    </ul>
                    <!-- .header-compare -->
                    <ul class="header-wishlist nav navbar-nav">
                        <li class="nav-item">
                            <a href="wishlist.html" class="nav-link">
                                <i class="tm tm-favorites"></i>
                                <span id="top-cart-wishlist-count" class="value">3</span>
                            </a>
                        </li>
                    </ul>
                    <!-- .header-wishlist -->
                    <ul id="site-header-cart" class="site-header-cart menu">
                        <li class="animate-dropdown dropdown ">
                            <a class="cart-contents" href="cart.html" data-toggle="dropdown" title="View your shopping cart">
                                <i class="tm tm-shopping-bag"></i>
                                <span class="count">2</span>
                                <!-- <span class="amount" dircetion="rtl">
                                        <span class="price-label">Your Cart</span>&#036;136.99</span> -->
                            </a>
                            <ul class="dropdown-menu dropdown-menu-mini-cart">
                                <li>
                                    <div class="widget woocommerce widget_shopping_cart">
                                        <div class="widget_shopping_cart_content">
                                            <ul class="woocommerce-mini-cart cart_list product_list_widget ">
                                                <li class="woocommerce-mini-cart-item mini_cart_item">
                                                    <a href="#" class="remove" aria-label="Remove this item" data-product_id="65" data-product_sku="">×</a>
                                                    <a href="single-product-sidebar.html">
                                                        <img src="<?= asset_url() ?>images/products/mini-cart1.jpg" class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image" alt="">XONE Wireless Controller&nbsp;
                                                    </a>
                                                    <span class="quantity">1 ×
                                                        <span class="woocommerce-Price-amount amount" dir="rtl">
                                                            <span class="woocommerce-Price-currencySymbol">$</span>64.99</span>
                                                    </span>
                                                </li>
                                                <li class="woocommerce-mini-cart-item mini_cart_item">
                                                    <a href="#" class="remove" aria-label="Remove this item" data-product_id="27" data-product_sku="">×</a>
                                                    <a href="single-product-sidebar.html">
                                                        <img src="<?= asset_url() ?>images/products/mini-cart2.jpg" class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image" alt="">Gear Virtual Reality 3D with Bluetooth Glasses&nbsp;
                                                    </a>
                                                    <span class="quantity">1 ×
                                                        <span class="woocommerce-Price-amount amount" dir="rtl">
                                                            <span class="woocommerce-Price-currencySymbol">$</span>72.00</span>
                                                    </span>
                                                </li>
                                            </ul>
                                            <!-- .cart_list -->
                                            <p class="woocommerce-mini-cart__total total">
                                                <strong>Subtotal:</strong>
                                                <span class="woocommerce-Price-amount amount" dir="rtl">
                                                    <span class="woocommerce-Price-currencySymbol">$</span>136.99</span>
                                            </p>
                                            <p class="woocommerce-mini-cart__buttons buttons">
                                                <a href="cart.html" class="button wc-forward">View cart</a>
                                                <a href="checkout.html" class="button checkout wc-forward">Checkout</a>
                                            </p>
                                        </div>
                                        <!-- .widget_shopping_cart_content -->
                                    </div>
                                    <!-- .widget_shopping_cart -->
                                </li>
                            </ul>
                            <!-- .dropdown-menu-mini-cart -->
                        </li>
                    </ul>
                    <!-- .site-header-cart -->
                </div>
                <!-- /.row -->
            </div>
            <!-- .col-full -->
            <div class="col-full handheld-only">
                <div class="handheld-header">
                    <div class="row">
                        <div class="site-branding">
                            <a href="home-v1.html" class="custom-logo-link" rel="home">
                                <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 176 28">
                                    <defs>
                                        <style>
                                            .cls-1,
                                            .cls-2 {
                                                fill: #333e48;
                                            }

                                            .cls-1 {
                                                fill-rule: evenodd;
                                            }

                                            .cls-3 {
                                                fill: #3265b0;
                                            }
                                        </style>
                                    </defs>
                                    <polygon class="cls-1" points="171.63 0.91 171.63 11 170.63 11 170.63 0.91 170.63 0.84 170.63 0.06 176 0.06 176 0.91 171.63 0.91" />
                                    <rect class="cls-2" x="166.19" y="0.06" width="3.47" height="0.84" />
                                    <rect class="cls-2" x="159.65" y="4.81" width="3.51" height="0.84" />
                                    <polygon class="cls-1" points="158.29 11 157.4 11 157.4 0.06 158.26 0.06 158.36 0.06 164.89 0.06 164.89 0.87 158.36 0.87 158.36 10.19 164.99 10.19 164.99 11 158.36 11 158.29 11" />
                                    <polygon class="cls-1" points="149.54 6.61 150.25 5.95 155.72 10.98 154.34 10.98 149.54 6.61" />
                                    <polygon class="cls-1" points="147.62 10.98 146.65 10.98 146.65 0.05 147.62 0.05 147.62 5.77 153.6 0.33 154.91 0.33 147.62 7.05 147.62 10.98" />
                                    <path class="cls-1" d="M156.39,24h-1.25s-0.49-.39-0.71-0.59l-1.35-1.25c-0.25-.23-0.68-0.66-0.68-0.66s0-.46,0-0.72a3.56,3.56,0,0,0,3.54-2.87,3.36,3.36,0,0,0-3.22-4H148.8V24h-1V13.06h5c2.34,0.28,4,1.72,4.12,4a4.26,4.26,0,0,1-3.38,4.34C154.48,22.24,156.39,24,156.39,24Z" transform="translate(-12 -13)" />
                                    <polygon class="cls-1" points="132.04 2.09 127.09 7.88 130.78 7.88 130.78 8.69 126.4 8.69 124.42 11 123.29 11 132.65 0 133.04 0 133.04 11 132.04 11 132.04 2.09" />
                                    <polygon class="cls-1" points="120.97 2.04 116.98 6.15 116.98 6.19 116.97 6.17 116.95 6.19 116.95 6.15 112.97 2.04 112.97 11 112 11 112 0 112.32 0 116.97 4.8 121.62 0 121.94 0 121.94 11 120.97 11 120.97 2.04" />
                                    <ellipse class="cls-3" cx="116.3" cy="22.81" rx="5.15" ry="5.18" />
                                    <rect class="cls-2" x="99.13" y="0.44" width="5.87" height="27.12" />
                                    <polygon class="cls-1" points="85.94 27.56 79.92 27.56 79.92 0.44 85.94 0.44 85.94 16.86 96.35 16.86 96.35 21.84 85.94 21.84 85.94 27.56" />
                                    <path class="cls-1" d="M77.74,36.07a9,9,0,0,0,6.41-2.68L88,37c-2.6,2.74-6.71,4-10.89,4A13.94,13.94,0,0,1,62.89,27.15,14.19,14.19,0,0,1,77.11,13c4.38,0,8.28,1.17,10.89,4,0,0-3.89,3.82-3.91,3.8A9,9,0,1,0,77.74,36.07Z" transform="translate(-12 -13)" />
                                    <rect class="cls-2" x="37.4" y="11.14" width="7.63" height="4.98" />
                                    <polygon class="cls-1" points="32.85 27.56 28.6 27.56 28.6 5.42 28.6 3.96 28.6 0.44 47.95 0.44 47.95 5.42 34.46 5.42 34.46 22.72 48.25 22.72 48.25 27.56 34.46 27.56 32.85 27.56" />
                                    <polygon class="cls-1" points="15.4 27.56 9.53 27.56 9.53 5.57 9.53 0.59 9.53 0.44 24.93 0.44 24.93 5.57 15.4 5.57 15.4 27.56" />
                                    <rect class="cls-2" y="0.44" width="7.19" height="5.13" />
                                </svg>
                            </a>
                            <!-- /.custom-logo-link -->
                        </div>
                        <!-- /.site-branding -->
                        <!-- ============================================================= End Header Logo ============================================================= -->
                        <div class="handheld-header-links">
                            <ul class="columns-3">
                                <li class="my-account">
                                    <a href="login-and-register.html" class="has-icon">
                                        <i class="tm tm-login-register"></i>
                                    </a>
                                </li>
                                <li class="wishlist">
                                    <a href="wishlist.html" class="has-icon">
                                        <i class="tm tm-favorites"></i>
                                        <span class="count">3</span>
                                    </a>
                                </li>
                                <li class="compare">
                                    <a href="compare.html" class="has-icon">
                                        <i class="tm tm-compare"></i>
                                        <span class="count">3</span>
                                    </a>
                                </li>
                            </ul>
                            <!-- .columns-3 -->
                        </div>
                        <!-- .handheld-header-links -->
                    </div>
                    <!-- /.row -->
                    <div class="techmarket-sticky-wrap">
                        <div class="row">
                            <nav id="handheld-navigation" class="handheld-navigation" aria-label="Handheld Navigation">
                                <button class="btn navbar-toggler" type="button">
                                    <i class="tm tm-departments-thin"></i>
                                    <span>Menu</span>
                                </button>
                                <div class="handheld-navigation-menu">
                                    <span class="tmhm-close">Close</span>
                                    <ul id="menu-departments-menu-1" class="nav">
                                        <li class="highlight menu-item animate-dropdown">
                                            <a title="Value of the Day" href="shop.html">Value of the Day</a>
                                        </li>
                                        <li class="highlight menu-item animate-dropdown">
                                            <a title="Top 100 Offers" href="shop.html">Top 100 Offers</a>
                                        </li>
                                        <li class="highlight menu-item animate-dropdown">
                                            <a title="New Arrivals" href="shop.html">New Arrivals</a>
                                        </li>
                                        <li class="yamm-tfw menu-item menu-item-has-children animate-dropdown dropdown-submenu">
                                            <a title="رک" data-toggle="dropdown" class="dropdown-toggle" aria-haspopup="true" href="#">Computers &#038;
                                                Laptops <span class="caret"></span></a>
                                            <ul role="menu" class=" dropdown-menu">
                                                <li class="menu-item menu-item-object-static_block animate-dropdown">
                                                    <div class="yamm-content">
                                                        <div class="bg-yamm-content bg-yamm-content-bottom bg-yamm-content-left">
                                                            <div class="kc-col-container">
                                                                <div class="kc_single_image">
                                                                    <img src="<?= asset_url() ?>images/megamenu.jpg" class="" alt="" />
                                                                </div>
                                                                <!-- .kc_single_image -->
                                                            </div>
                                                            <!-- .kc-col-container -->
                                                        </div>
                                                        <!-- .bg-yamm-content -->
                                                        <div class="row yamm-content-row">
                                                            <div class="col-md-6 col-sm-12">
                                                                <div class="kc-col-container">
                                                                    <div class="kc_text_block">
                                                                        <ul>
                                                                            <li class="nav-title">Computers &amp;
                                                                                Accessories</li>
                                                                            <li><a href="shop.html">All Computers &amp;
                                                                                    Accessories</a></li>
                                                                            <li><a href="shop.html">Laptops, Desktops
                                                                                    &amp; Monitors</a></li>
                                                                            <li><a href="shop.html">Pen Drives, Hard
                                                                                    Drives &amp; Memory Cards</a></li>
                                                                            <li><a href="shop.html">Printers &amp;
                                                                                    Ink</a></li>
                                                                            <li><a href="shop.html">Networking &amp;
                                                                                    Internet Devices</a></li>
                                                                            <li><a href="shop.html">Computer
                                                                                    Accessories</a></li>
                                                                            <li><a href="shop.html">Software</a></li>
                                                                            <li class="nav-divider"></li>
                                                                            <li>
                                                                                <a href="shop.html">
                                                                                    <span class="nav-text">All
                                                                                        Electronics</span>
                                                                                    <span class="nav-subtext">Discover
                                                                                        more products</span>
                                                                                </a>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                    <!-- .kc_text_block -->
                                                                </div>
                                                                <!-- .kc-col-container -->
                                                            </div>
                                                            <!-- .kc_column -->
                                                            <div class="col-md-6 col-sm-12">
                                                                <div class="kc-col-container">
                                                                    <div class="kc_text_block">
                                                                        <ul>
                                                                            <li class="nav-title">Office &amp;
                                                                                Stationery</li>
                                                                            <li><a href="shop.html">All Office &amp;
                                                                                    Stationery</a></li>
                                                                            <li><a href="shop.html">Pens &amp;
                                                                                    Writing</a></li>
                                                                        </ul>
                                                                    </div>
                                                                    <!-- .kc_text_block -->
                                                                </div>
                                                                <!-- .kc-col-container -->
                                                            </div>
                                                            <!-- .kc_column -->
                                                        </div>
                                                        <!-- .kc_row -->
                                                    </div>
                                                    <!-- .yamm-content -->
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="yamm-tfw menu-item menu-item-has-children animate-dropdown dropdown-submenu">
                                            <a title="Cameras &amp; Photo" data-toggle="dropdown" class="dropdown-toggle" aria-haspopup="true" href="#">Cameras &#038;
                                                Photo <span class="caret"></span></a>
                                            <ul role="menu" class=" dropdown-menu">
                                                <li class="menu-item menu-item-object-static_block animate-dropdown">
                                                    <div class="yamm-content">
                                                        <div class="bg-yamm-content bg-yamm-content-bottom bg-yamm-content-left">
                                                            <div class="kc-col-container">
                                                                <div class="kc_single_image">
                                                                    <img src="<?= asset_url() ?>images/megamenu-1.jpg" class="" alt="" />
                                                                </div>
                                                                <!-- .kc_single_image -->
                                                            </div>
                                                            <!-- .kc-col-container -->
                                                        </div>
                                                        <!-- .bg-yamm-content -->
                                                        <div class="row yamm-content-row">
                                                            <div class="col-md-6 col-sm-12">
                                                                <div class="kc-col-container">
                                                                    <div class="kc_text_block">
                                                                        <ul>
                                                                            <li class="nav-title">Cameras & Photography
                                                                            </li>
                                                                            <li><a href="shop.html">All Cameras &
                                                                                    Photography</a></li>
                                                                            <li><a href="shop.html">Point & Shoot
                                                                                    Cameras</a></li>
                                                                            <li><a href="shop.html">Lenses</a></li>
                                                                            <li><a href="shop.html">Camera
                                                                                    Accessories</a></li>
                                                                            <li><a href="shop.html">Security &
                                                                                    Surveillance</a></li>
                                                                            <li><a href="shop.html">Binoculars &
                                                                                    Telescopes</a></li>
                                                                            <li><a href="shop.html">Camcorders</a></li>
                                                                            <li class="nav-divider"></li>
                                                                            <li>
                                                                                <a href="shop.html">
                                                                                    <span class="nav-text">All
                                                                                        Electronics</span>
                                                                                    <span class="nav-subtext">Discover
                                                                                        more products</span>
                                                                                </a>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                    <!-- .kc_text_block -->
                                                                </div>
                                                                <!-- .kc-col-container -->
                                                            </div>
                                                            <!-- .kc_column -->
                                                            <div class="col-md-6 col-sm-12">
                                                                <div class="kc-col-container">
                                                                    <div class="kc_text_block">
                                                                        <ul>
                                                                            <li class="nav-title">Audio & Video</li>
                                                                            <li><a href="shop.html">All Audio &
                                                                                    Video</a></li>
                                                                            <li><a href="shop.html">Headphones &
                                                                                    Speakers</a></li>
                                                                            <li><a href="shop.html">Home Entertainment
                                                                                    Systems</a></li>
                                                                            <li><a href="shop.html">MP3 & Media
                                                                                    Players</a></li>
                                                                        </ul>
                                                                    </div>
                                                                    <!-- .kc_text_block -->
                                                                </div>
                                                                <!-- .kc-col-container -->
                                                            </div>
                                                            <!-- .kc_column -->
                                                        </div>
                                                        <!-- .kc_row -->
                                                    </div>
                                                    <!-- .yamm-content -->
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="yamm-tfw menu-item menu-item-has-children animate-dropdown dropdown-submenu">
                                            <a title="Smart Phones &amp; Tablets" data-toggle="dropdown" class="dropdown-toggle" aria-haspopup="true" href="#">Smart Phones
                                                &#038; Tablets <span class="caret"></span></a>
                                            <ul role="menu" class=" dropdown-menu">
                                                <li class="menu-item menu-item-object-static_block animate-dropdown">
                                                    <div class="yamm-content">
                                                        <div class="bg-yamm-content bg-yamm-content-bottom bg-yamm-content-left">
                                                            <div class="kc-col-container">
                                                                <div class="kc_single_image">
                                                                    <img src="<?= asset_url() ?>images/megamenu.jpg" class="" alt="" />
                                                                </div>
                                                                <!-- .kc_single_image -->
                                                            </div>
                                                            <!-- .kc-col-container -->
                                                        </div>
                                                        <!-- .bg-yamm-content -->
                                                        <div class="row yamm-content-row">
                                                            <div class="col-md-6 col-sm-12">
                                                                <div class="kc-col-container">
                                                                    <div class="kc_text_block">
                                                                        <ul>
                                                                            <li class="nav-title">Computers &amp;
                                                                                Accessories</li>
                                                                            <li><a href="shop.html">All Computers &amp;
                                                                                    Accessories</a></li>
                                                                            <li><a href="shop.html">Laptops, Desktops
                                                                                    &amp; Monitors</a></li>
                                                                            <li><a href="shop.html">Pen Drives, Hard
                                                                                    Drives &amp; Memory Cards</a></li>
                                                                            <li><a href="shop.html">Printers &amp;
                                                                                    Ink</a></li>
                                                                            <li><a href="shop.html">Networking &amp;
                                                                                    Internet Devices</a></li>
                                                                            <li><a href="shop.html">Computer
                                                                                    Accessories</a></li>
                                                                            <li><a href="shop.html">Software</a></li>
                                                                            <li class="nav-divider"></li>
                                                                            <li>
                                                                                <a href="shop.html">
                                                                                    <span class="nav-text">All
                                                                                        Electronics</span>
                                                                                    <span class="nav-subtext">Discover
                                                                                        more products</span>
                                                                                </a>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                    <!-- .kc_text_block -->
                                                                </div>
                                                                <!-- .kc-col-container -->
                                                            </div>
                                                            <!-- .kc_column -->
                                                            <div class="col-md-6 col-sm-12">
                                                                <div class="kc-col-container">
                                                                    <div class="kc_text_block">
                                                                        <ul>
                                                                            <li class="nav-title">Office &amp;
                                                                                Stationery</li>
                                                                            <li><a href="shop.html">All Office &amp;
                                                                                    Stationery</a></li>
                                                                            <li><a href="shop.html">Pens &amp;
                                                                                    Writing</a></li>
                                                                        </ul>
                                                                    </div>
                                                                    <!-- .kc_text_block -->
                                                                </div>
                                                                <!-- .kc-col-container -->
                                                            </div>
                                                            <!-- .kc_column -->
                                                        </div>
                                                        <!-- .kc_row -->
                                                    </div>
                                                    <!-- .yamm-content -->
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="yamm-tfw menu-item menu-item-has-children animate-dropdown dropdown-submenu">
                                            <a title="Video Games &amp; Consoles" data-toggle="dropdown" class="dropdown-toggle" aria-haspopup="true" href="#">Video Games &#038;
                                                Consoles <span class="caret"></span></a>
                                            <ul role="menu" class=" dropdown-menu">
                                                <li class="menu-item menu-item-object-static_block animate-dropdown">
                                                    <div class="yamm-content">
                                                        <div class="bg-yamm-content bg-yamm-content-bottom bg-yamm-content-left">
                                                            <div class="kc-col-container">
                                                                <div class="kc_single_image">
                                                                    <img src="<?= asset_url() ?>images/megamenu-1.jpg" class="" alt="" />
                                                                </div>
                                                                <!-- .kc_single_image -->
                                                            </div>
                                                            <!-- .kc-col-container -->
                                                        </div>
                                                        <!-- .bg-yamm-content -->
                                                        <div class="row yamm-content-row">
                                                            <div class="col-md-6 col-sm-12">
                                                                <div class="kc-col-container">
                                                                    <div class="kc_text_block">
                                                                        <ul>
                                                                            <li class="nav-title">Cameras & Photography
                                                                            </li>
                                                                            <li><a href="shop.html">All Cameras &
                                                                                    Photography</a></li>
                                                                            <li><a href="shop.html">Point & Shoot
                                                                                    Cameras</a></li>
                                                                            <li><a href="shop.html">Lenses</a></li>
                                                                            <li><a href="shop.html">Camera
                                                                                    Accessories</a></li>
                                                                            <li><a href="shop.html">Security &
                                                                                    Surveillance</a></li>
                                                                            <li><a href="shop.html">Binoculars &
                                                                                    Telescopes</a></li>
                                                                            <li><a href="shop.html">Camcorders</a></li>
                                                                            <li class="nav-divider"></li>
                                                                            <li>
                                                                                <a href="shop.html">
                                                                                    <span class="nav-text">All
                                                                                        Electronics</span>
                                                                                    <span class="nav-subtext">Discover
                                                                                        more products</span>
                                                                                </a>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                    <!-- .kc_text_block -->
                                                                </div>
                                                                <!-- .kc-col-container -->
                                                            </div>
                                                            <!-- .kc_column -->
                                                            <div class="col-md-6 col-sm-12">
                                                                <div class="kc-col-container">
                                                                    <div class="kc_text_block">
                                                                        <ul>
                                                                            <li class="nav-title">Audio & Video</li>
                                                                            <li><a href="shop.html">All Audio &
                                                                                    Video</a></li>
                                                                            <li><a href="shop.html">Headphones &
                                                                                    Speakers</a></li>
                                                                            <li><a href="shop.html">Home Entertainment
                                                                                    Systems</a></li>
                                                                            <li><a href="shop.html">MP3 & Media
                                                                                    Players</a></li>
                                                                        </ul>
                                                                    </div>
                                                                    <!-- .kc_text_block -->
                                                                </div>
                                                                <!-- .kc-col-container -->
                                                            </div>
                                                            <!-- .kc_column -->
                                                        </div>
                                                        <!-- .kc_row -->
                                                    </div>
                                                    <!-- .yamm-content -->
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="yamm-tfw menu-item menu-item-has-children animate-dropdown dropdown-submenu">
                                            <a title="TV &amp; Audio" data-toggle="dropdown" class="dropdown-toggle" aria-haspopup="true" href="#">TV &#038; Audio <span class="caret"></span></a>
                                            <ul role="menu" class=" dropdown-menu">
                                                <li class="menu-item menu-item-object-static_block animate-dropdown">
                                                    <div class="yamm-content">
                                                        <div class="bg-yamm-content bg-yamm-content-bottom bg-yamm-content-left">
                                                            <div class="kc-col-container">
                                                                <div class="kc_single_image">
                                                                    <img src="<?= asset_url() ?>images/megamenu.jpg" class="" alt="" />
                                                                </div>
                                                                <!-- .kc_single_image -->
                                                            </div>
                                                            <!-- .kc-col-container -->
                                                        </div>
                                                        <!-- .bg-yamm-content -->
                                                        <div class="row yamm-content-row">
                                                            <div class="col-md-6 col-sm-12">
                                                                <div class="kc-col-container">
                                                                    <div class="kc_text_block">
                                                                        <ul>
                                                                            <li class="nav-title">Computers &amp;
                                                                                Accessories</li>
                                                                            <li><a href="shop.html">All Computers &amp;
                                                                                    Accessories</a></li>
                                                                            <li><a href="shop.html">Laptops, Desktops
                                                                                    &amp; Monitors</a></li>
                                                                            <li><a href="shop.html">Pen Drives, Hard
                                                                                    Drives &amp; Memory Cards</a></li>
                                                                            <li><a href="shop.html">Printers &amp;
                                                                                    Ink</a></li>
                                                                            <li><a href="shop.html">Networking &amp;
                                                                                    Internet Devices</a></li>
                                                                            <li><a href="shop.html">Computer
                                                                                    Accessories</a></li>
                                                                            <li><a href="shop.html">Software</a></li>
                                                                            <li class="nav-divider"></li>
                                                                            <li>
                                                                                <a href="shop.html">
                                                                                    <span class="nav-text">All
                                                                                        Electronics</span>
                                                                                    <span class="nav-subtext">Discover
                                                                                        more products</span>
                                                                                </a>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                    <!-- .kc_text_block -->
                                                                </div>
                                                                <!-- .kc-col-container -->
                                                            </div>
                                                            <!-- .kc_column -->
                                                            <div class="col-md-6 col-sm-12">
                                                                <div class="kc-col-container">
                                                                    <div class="kc_text_block">
                                                                        <ul>
                                                                            <li class="nav-title">Office &amp;
                                                                                Stationery</li>
                                                                            <li><a href="shop.html">All Office &amp;
                                                                                    Stationery</a></li>
                                                                            <li><a href="shop.html">Pens &amp;
                                                                                    Writing</a></li>
                                                                        </ul>
                                                                    </div>
                                                                    <!-- .kc_text_block -->
                                                                </div>
                                                                <!-- .kc-col-container -->
                                                            </div>
                                                            <!-- .kc_column -->
                                                        </div>
                                                        <!-- .kc_row -->
                                                    </div>
                                                    <!-- .yamm-content -->
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="yamm-tfw menu-item menu-item-has-children animate-dropdown dropdown-submenu">
                                            <a title="Car Electronic &amp; GPS" data-toggle="dropdown" class="dropdown-toggle" aria-haspopup="true" href="#">Car Electronic
                                                &#038; GPS <span class="caret"></span></a>
                                            <ul role="menu" class=" dropdown-menu">
                                                <li class="menu-item menu-item-object-static_block animate-dropdown">
                                                    <div class="yamm-content">
                                                        <div class="bg-yamm-content bg-yamm-content-bottom bg-yamm-content-left">
                                                            <div class="kc-col-container">
                                                                <div class="kc_single_image">
                                                                    <img src="<?= asset_url() ?>images/megamenu-1.jpg" class="" alt="" />
                                                                </div>
                                                                <!-- .kc_single_image -->
                                                            </div>
                                                            <!-- .kc-col-container -->
                                                        </div>
                                                        <!-- .bg-yamm-content -->
                                                        <div class="row yamm-content-row">
                                                            <div class="col-md-6 col-sm-12">
                                                                <div class="kc-col-container">
                                                                    <div class="kc_text_block">
                                                                        <ul>
                                                                            <li class="nav-title">Cameras & Photography
                                                                            </li>
                                                                            <li><a href="shop.html">All Cameras &
                                                                                    Photography</a></li>
                                                                            <li><a href="shop.html">Point & Shoot
                                                                                    Cameras</a></li>
                                                                            <li><a href="shop.html">Lenses</a></li>
                                                                            <li><a href="shop.html">Camera
                                                                                    Accessories</a></li>
                                                                            <li><a href="shop.html">Security &
                                                                                    Surveillance</a></li>
                                                                            <li><a href="shop.html">Binoculars &
                                                                                    Telescopes</a></li>
                                                                            <li><a href="shop.html">Camcorders</a></li>
                                                                            <li class="nav-divider"></li>
                                                                            <li>
                                                                                <a href="shop.html">
                                                                                    <span class="nav-text">All
                                                                                        Electronics</span>
                                                                                    <span class="nav-subtext">Discover
                                                                                        more products</span>
                                                                                </a>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                    <!-- .kc_text_block -->
                                                                </div>
                                                                <!-- .kc-col-container -->
                                                            </div>
                                                            <!-- .kc_column -->
                                                            <div class="col-md-6 col-sm-12">
                                                                <div class="kc-col-container">
                                                                    <div class="kc_text_block">
                                                                        <ul>
                                                                            <li class="nav-title">Audio & Video</li>
                                                                            <li><a href="shop.html">All Audio &
                                                                                    Video</a></li>
                                                                            <li><a href="shop.html">Headphones &
                                                                                    Speakers</a></li>
                                                                            <li><a href="shop.html">Home Entertainment
                                                                                    Systems</a></li>
                                                                            <li><a href="shop.html">MP3 & Media
                                                                                    Players</a></li>
                                                                        </ul>
                                                                    </div>
                                                                    <!-- .kc_text_block -->
                                                                </div>
                                                                <!-- .kc-col-container -->
                                                            </div>
                                                            <!-- .kc_column -->
                                                        </div>
                                                        <!-- .kc_row -->
                                                    </div>
                                                    <!-- .yamm-content -->
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="yamm-tfw menu-item menu-item-has-children animate-dropdown dropdown-submenu">
                                            <a title="Accesories" data-toggle="dropdown" class="dropdown-toggle" aria-haspopup="true" href="#">Accesories <span class="caret"></span></a>
                                            <ul role="menu" class=" dropdown-menu">
                                                <li class="menu-item menu-item-object-static_block animate-dropdown">
                                                    <div class="yamm-content">
                                                        <div class="bg-yamm-content bg-yamm-content-bottom bg-yamm-content-left">
                                                            <div class="kc-col-container">
                                                                <div class="kc_single_image">
                                                                    <img src="<?= asset_url() ?>images/megamenu.jpg" class="" alt="" />
                                                                </div>
                                                                <!-- .kc_single_image -->
                                                            </div>
                                                            <!-- .kc-col-container -->
                                                        </div>
                                                        <!-- .bg-yamm-content -->
                                                        <div class="row yamm-content-row">
                                                            <div class="col-md-6 col-sm-12">
                                                                <div class="kc-col-container">
                                                                    <div class="kc_text_block">
                                                                        <ul>
                                                                            <li class="nav-title">Computers &amp;
                                                                                Accessories</li>
                                                                            <li><a href="shop.html">All Computers &amp;
                                                                                    Accessories</a></li>
                                                                            <li><a href="shop.html">Laptops, Desktops
                                                                                    &amp; Monitors</a></li>
                                                                            <li><a href="shop.html">Pen Drives, Hard
                                                                                    Drives &amp; Memory Cards</a></li>
                                                                            <li><a href="shop.html">Printers &amp;
                                                                                    Ink</a></li>
                                                                            <li><a href="shop.html">Networking &amp;
                                                                                    Internet Devices</a></li>
                                                                            <li><a href="shop.html">Computer
                                                                                    Accessories</a></li>
                                                                            <li><a href="shop.html">Software</a></li>
                                                                            <li class="nav-divider"></li>
                                                                            <li>
                                                                                <a href="shop.html">
                                                                                    <span class="nav-text">All
                                                                                        Electronics</span>
                                                                                    <span class="nav-subtext">Discover
                                                                                        more products</span>
                                                                                </a>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                    <!-- .kc_text_block -->
                                                                </div>
                                                                <!-- .kc-col-container -->
                                                            </div>
                                                            <!-- .kc_column -->
                                                            <div class="col-md-6 col-sm-12">
                                                                <div class="kc-col-container">
                                                                    <div class="kc_text_block">
                                                                        <ul>
                                                                            <li class="nav-title">Office &amp;
                                                                                Stationery</li>
                                                                            <li><a href="shop.html">All Office &amp;
                                                                                    Stationery</a></li>
                                                                            <li><a href="shop.html">Pens &amp;
                                                                                    Writing</a></li>
                                                                        </ul>
                                                                    </div>
                                                                    <!-- .kc_text_block -->
                                                                </div>
                                                                <!-- .kc-col-container -->
                                                            </div>
                                                            <!-- .kc_column -->
                                                        </div>
                                                        <!-- .kc_row -->
                                                    </div>
                                                    <!-- .yamm-content -->
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="menu-item animate-dropdown">
                                            <a title="Gadgets" href="shop.html">Gadgets</a>
                                        </li>
                                        <li class="menu-item animate-dropdown">
                                            <a title="Virtual Reality" href="shop.html">Virtual Reality</a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- .handheld-navigation-menu -->
                            </nav>
                            <!-- .handheld-navigation -->
                            <div class="site-search">
                                <div class="widget woocommerce widget_product_search">
                                    <form role="search" method="get" class="woocommerce-product-search" action="https://transvelo.github.io/techmarket-html/home-v1.html">
                                        <label class="screen-reader-text" for="woocommerce-product-search-field-0">جستجو:</label>
                                        <input type="search" id="woocommerce-product-search-field-0" class="search-field" placeholder="Search products&hellip;" value="" name="s" />
                                        <input type="submit" value="Search" />
                                        <input type="hidden" name="post_type" value="product" />
                                    </form>
                                </div>
                                <!-- .widget -->
                            </div>
                            <!-- .site-search -->
                            <a class="handheld-header-cart-link has-icon" href="cart.html" title="View your shopping cart">
                                <i class="tm tm-shopping-bag"></i>
                                <span class="count">2</span>
                            </a>
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- .techmarket-sticky-wrap -->
                </div>
                <!-- .handheld-header -->
            </div>
            <!-- .handheld-only -->
        </header>
        <!-- .header-v1 -->
        <!-- ============================================================= Header End ============================================================= -->