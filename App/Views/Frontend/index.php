<div class="col-full">
    <div class="row">
        <div id="primary" class="content-area">
            <main id="main" class="site-main">
                <div class="home-v1-slider home-slider">
                    <?php foreach ($sliders as $value) : ?>
                        <div class="slider-1" style="background-image: url(<?= asset_url() ?>Frontend/images/slider/home-v1-background.jpg);">
                            <img class="img-fluid" src="<?= $value['photo']['path'] ?>" alt="">
                            <div class="caption">
                                <div class="title"><?= $value['small_text'] ?></div>
                                <div class="sub-title"><?= $value['description'] ?></div>
                                <a href="
                            <?php
                            if ($value['category_id']) {
                                echo  base_url() . 'category/' . $value['category_id'];
                            }
                            if ($value['product_id']) {
                                echo    base_url() . 'product/' . $value['product_id'];
                            }
                            ?>
                            " class="button">ادامه مطلب
                                    <i class="tm tm-long-arrow-left"></i>
                                </a>
                                <div class="bottom-caption">رایانه شخصی یکپارچه</div>
                            </div>
                        </div>
                    <?php endforeach; ?>
                    <!-- .slider-1 -->
                    <!-- <div class="slider-1 slider-2" style="background-image: url(<?= asset_url() ?>Frontend/images/slider/home-v1-background.jpg);">
                        <img src="<?= asset_url() ?>Frontend/images/slider/home-v1-img-2.png" alt="">
                        <div class="caption">
                            <div class="title">The new-tech gift you
                                <br> are wishing for is
                                <br> left here
                            </div>
                            <div class="sub-title">Big screens in incredibly slim designs
                                <br>that in your hand.
                            </div>
                            <div class="button">Browse now
                                <i class="tm tm-long-arrow-left"></i>
                            </div>
                            <div class="bottom-caption">Free shipping on US Terority </div>
                        </div>
                    </div> -->
                    <!-- .slider-2 -->
                </div>
                <!-- .home-v1-slider -->
                <div class="features-list">
                    <div class="features">
                        <div class="feature">
                            <div class="media">
                                <i class="feature-icon d-flex mr-3 tm tm-free-delivery"></i>
                                <div class="media-body feature-text">
                                    <h5 class="mt-0">ارسال محصولات</h5>
                                    <span>ارسال سریع و به موقع</span>
                                </div>
                            </div>
                        </div>
                        <!-- .feature -->
                        <div class="feature">
                            <div class="media">
                                <i class="feature-icon d-flex mr-3 tm tm-feedback"></i>
                                <div class="media-body feature-text">
                                    <h5 class="mt-0">رضایت مشتریان</h5>
                                    <span>بازخورد مثبت مشتریان</span>
                                </div>
                            </div>
                            <!-- .media -->
                        </div>
                        <!-- .feature -->
                        <div class="feature">
                            <div class="media">
                                <i class="feature-icon d-flex mr-3 tm tm-free-return"></i>
                                <div class="media-body feature-text">
                                    <h5 class="mt-0">پشتیبانی سالیانه</h5>
                                    <span>دریافت محصولات</span>
                                </div>
                            </div>
                            <!-- .media -->
                        </div>
                        <!-- .feature -->
                        <div class="feature">
                            <div class="media">
                                <i class="feature-icon d-flex mr-3 tm tm-safe-payments"></i>
                                <div class="media-body feature-text">
                                    <h5 class="mt-0">پرداخت آنلاین</h5>
                                    <span>درگاه پرداخت امن</span>
                                </div>
                            </div>
                            <!-- .media -->
                        </div>
                        <!-- .feature -->
                        <div class="feature">
                            <div class="media">
                                <i class="feature-icon d-flex mr-3 tm tm-best-brands"></i>
                                <div class="media-body feature-text">
                                    <h5 class="mt-0">بهترین برندها</h5>
                                    <span>فروش بروزترین برندها</span>
                                </div>
                            </div>
                            <!-- .media -->
                        </div>
                        <!-- .feature -->
                    </div>
                    <!-- .features -->
                </div>
                <section class="pro-cat">
                    <div class="big-banner mt-100 pb-85 mt-sm-60 pb-sm-45">
                        <div class="banner-2">
                            <div class="banner-box">
                                <div class="col-img">
                                    <a href="#"><img src="<?= asset_url() ?>Frontend/images/banner/banner3-1.jpg" alt="banner 3"></a>
                                </div>
                                <div class="col-img">
                                    <a href="#"><img src="<?= asset_url() ?>Frontend/images/banner/banner3-2.jpg" alt="banner 3"></a>
                                </div>
                            </div>
                            <div class="banner-box">
                                <div class="col-img">
                                    <a href="#"><img src="<?= asset_url() ?>Frontend/images/banner/banner3-3.jpg" alt="banner 3"></a>
                                </div>
                            </div>
                            <div class="banner-box">
                                <div class="col-img">
                                    <a href="#"><img src="<?= asset_url() ?>Frontend/images/banner/banner3-4.jpg" alt="banner 3"></a>
                                </div>
                                <div class="col-img">
                                    <a href="#"><img src="<?= asset_url() ?>Frontend/images/banner/banner3-5.jpg" alt="banner 3"></a>
                                </div>
                            </div>
                            <div class="banner-box">
                                <div class="col-img">
                                    <a href="#"><img src="<?= asset_url() ?>Frontend/images/banner/banner3-6.jpg" alt="banner 3"></a>
                                </div>
                            </div>
                            <div class="banner-box">
                                <div class="col-img">
                                    <a href="#"><img src="<?= asset_url() ?>Frontend/images/banner/banner3-7.jpg" alt="banner 3"></a>
                                </div>
                                <div class="col-img">
                                    <a href="#"><img src="<?= asset_url() ?>Frontend/images/banner/banner3-8.jpg" alt="banner 3"></a>
                                </div>
                            </div>
                        </div>
                        <!-- Container End -->
                    </div>
                </section>
                <br>
                <!-- /.features list -->
                <div class="section-deals-carousel-and-products-carousel-tabs row">
                    <!-- /.deals-carousel -->
                    <section class="column-2 section-products-carousel-tabs tab-carousel-1">
                        <div class="section-products-carousel-tabs-wrap">
                            <header class="section-header">
                                <ul role="tablist" class="nav justify-content-end">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="#tab-59f89f0881f930" data-toggle="tab">جدیدترین محصولات</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link " href="#tab-59f89f0881f931" data-toggle="tab">حراجی</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link " href="#tab-59f89f0881f932" data-toggle="tab">پرفروش ترینها</a>
                                    </li>
                                </ul>
                            </header>
                            <!-- .section-header -->
                            <div class="tab-content">
                                <div id="tab-59f89f0881f930" class="tab-pane active" role="tabpanel">
                                    <div class="products-carousel" data-ride="tm-slick-carousel" data-wrap=".products" data-slick="{&quot;infinite&quot;:false,&quot;rows&quot;:2,&quot;slidesPerRow&quot;:5,&quot;slidesToShow&quot;:1,&quot;slidesToScroll&quot;:1,&quot;dots&quot;:true,&quot;arrows&quot;:false,&quot;rtl&quot;:true,&quot;responsive&quot;:[{&quot;breakpoint&quot;:1023,&quot;settings&quot;:{&quot;slidesPerRow&quot;:2}},{&quot;breakpoint&quot;:1169,&quot;settings&quot;:{&quot;slidesPerRow&quot;:4}},{&quot;breakpoint&quot;:1400,&quot;settings&quot;:{&quot;slidesPerRow&quot;:3}}]}">
                                        <div class="container-fluid">
                                            <div class="woocommerce">
                                                <div class="products">
                                                    <?php foreach ($latest_products as $value) : ?>
                                                        <div class="product">
                                                            <div class="yith-wcwl-add-to-wishlist">
                                                                <a href="wishlist.html" rel="nofollow" class="add_to_wishlist">افزودن به علاقه مندی ها</a>
                                                            </div>
                                                            <a href="<?= base_url() . 'product/' . $value['product_id'] ?>" class="woocommerce-LoopProduct-link">
                                                                <img src="<?= $value['path'] ?>" width="224" height="197" class="wp-post-image" alt="">
                                                                <span class="price">
                                                                    <ins>
                                                                        <span class="amount" dircetion="rtl"> </span>
                                                                    </ins>
                                                                    <span class="amount" dircetion="rtl"> 20,000,000 ریال</span>
                                                                </span>
                                                                <!-- /.price -->
                                                                <h2 class="woocommerce-loop-product__title">
                                                                    سرور ایستاده</h2>
                                                            </a>
                                                            <div class="hover-area">
                                                                <a class="button add_to_cart_button" href="cart.html" rel="nofollow">افزودن به سبد خرید</a>
                                                                <a class="add-to-compare-link" href="compare.html">افزودن به مقایسه</a>
                                                            </div>
                                                        </div>
                                                    <?php endforeach; ?>
                                                    <!-- /.product-outer -->
                                                </div>
                                            </div>
                                            <!-- .woocommerce -->
                                        </div>
                                        <!-- .container-fluid -->
                                    </div>
                                    <!-- .products-carousel -->
                                </div>
                                <!-- .tab-pane -->
                                <div id="tab-59f89f0881f931" class="tab-pane " role="tabpanel">
                                    <div class="products-carousel" data-ride="tm-slick-carousel" data-wrap=".products" data-slick="{&quot;infinite&quot;:false,&quot;rows&quot;:2,&quot;slidesPerRow&quot;:5,&quot;slidesToShow&quot;:1,&quot;slidesToScroll&quot;:1,&quot;dots&quot;:true,&quot;arrows&quot;:false,&quot;rtl&quot;:true,&quot;responsive&quot;:[{&quot;breakpoint&quot;:1023,&quot;settings&quot;:{&quot;slidesPerRow&quot;:2}},{&quot;breakpoint&quot;:1169,&quot;settings&quot;:{&quot;slidesPerRow&quot;:4}},{&quot;breakpoint&quot;:1400,&quot;settings&quot;:{&quot;slidesPerRow&quot;:3}}]}">
                                        <div class="container-fluid">
                                            <div class="woocommerce">
                                                <div class="products">
                                                    <?php foreach ($product_discounts as $value) : ?>
                                                        <div class="product">
                                                            <div class="yith-wcwl-add-to-wishlist">
                                                                <a href="wishlist.html" rel="nofollow" class="add_to_wishlist">افزودن به علاقه مندی ها</a>
                                                            </div>
                                                            <a href="<?= base_url() . 'product/' . $value['product_id'] ?>" class="woocommerce-LoopProduct-link">
                                                                <img src="<?= $value['photo_path'] ?>" width="224" height="197" class="wp-post-image" alt="<?= $value['photo_alt'] ?>">
                                                                <span class="price">
                                                                    <ins>
                                                                        <span class="amount" dircetion="rtl"></span>
                                                                    </ins>
                                                                    <span class="amount" dircetion="rtl"><?= $value['product_price'] ?> ریال</span>
                                                                </span>
                                                                <!-- /.price -->
                                                                <h2 class="woocommerce-loop-product__title">
                                                                    <?= $value['product_title'] ?>
                                                                </h2>
                                                            </a>
                                                            <div class="hover-area">
                                                                <a class="button add_to_cart_button" href="cart.html" rel="nofollow">افزودن به سبد خرید</a>
                                                                <a class="add-to-compare-link" href="compare.html">افزودن به مقایسه</a>
                                                            </div>
                                                        </div>
                                                    <?php endforeach; ?>
                                                    <!-- /.product-outer -->
                                                </div>
                                            </div>
                                            <!-- .woocommerce -->
                                        </div>
                                        <!-- .container-fluid -->
                                    </div>
                                    <!-- .products-carousel -->
                                </div>
                                <!-- .tab-pane -->
                                <div id="tab-59f89f0881f932" class="tab-pane " role="tabpanel">
                                    <div class="products-carousel" data-ride="tm-slick-carousel" data-wrap=".products" data-slick="{&quot;rtl&quot;:true,&quot;infinite&quot;:false,&quot;rows&quot;:2,&quot;slidesPerRow&quot;:5,&quot;slidesToShow&quot;:1,&quot;slidesToScroll&quot;:1,&quot;dots&quot;:true,&quot;arrows&quot;:false,&quot;rtl&quot;:true,&quot;responsive&quot;:[{&quot;breakpoint&quot;:1023,&quot;settings&quot;:{&quot;slidesPerRow&quot;:2}},{&quot;breakpoint&quot;:1169,&quot;settings&quot;:{&quot;slidesPerRow&quot;:4}},{&quot;breakpoint&quot;:1400,&quot;settings&quot;:{&quot;slidesPerRow&quot;:3}}]}">
                                        <div class="container-fluid">
                                            <div class="woocommerce">
                                                <div class="products">
                                                    <?php foreach ($sale_products as $value) : ?>
                                                        <div class="product">
                                                            <div class="yith-wcwl-add-to-wishlist">
                                                                <a href="wishlist.html" rel="nofollow" class="add_to_wishlist">افزودن به علاقه مندی ها</a>
                                                            </div>
                                                            <a href="<?= base_url() . 'product/' . $value['product_id'] ?>" class="woocommerce-LoopProduct-link">
                                                                <img src="<?= $value['path'] ?>" width="224" height="197" class="wp-post-image" alt="<?= $value['alt'] ?>">
                                                                <span class="price">
                                                                    <ins>
                                                                        <span class="amount" dircetion="rtl"> </span>
                                                                    </ins>
                                                                    <span class="amount" dircetion="rtl"> <?= $value['price'] ?> ریال</span>
                                                                </span>
                                                                <!-- /.price -->
                                                                <h2 class="woocommerce-loop-product__title">
                                                                    <?= $value['title'] ?>
                                                                </h2>
                                                            </a>
                                                            <div class="hover-area">
                                                                <a class="button add_to_cart_button" href="cart.html" rel="nofollow">افزودن به سبد خرید</a>
                                                                <a class="add-to-compare-link" href="compare.html">افزودن به مقایسه</a>
                                                            </div>
                                                        </div>
                                                    <?php endforeach; ?>
                                                </div>
                                            </div>
                                            <!-- .woocommerce -->
                                        </div>
                                        <!-- .container-fluid -->
                                    </div>
                                    <!-- .products-carousel -->
                                </div>
                                <!-- .tab-pane -->
                            </div>
                            <!-- .tab-content -->
                        </div>
                        <!-- .section-products-carousel-tabs-wrap -->
                    </section>
                    <!-- .section-products-carousel-tabs -->
                </div>
                <div class="fullwidth-notice stretch-full-width">
                    <div class="col-full">
                        <p class="message">به روز ترین تجهیزات شبکه را با اطمینان کامل از ما خریداری کنید
                        </p>
                    </div>
                    <!-- .col-full -->
                </div>
                <!-- .fullwidth-notice -->

                <section class="section-top-categories section-categories-carousel" id="categories-carousel-1">
                    <header class="section-header">
                        <h4 class="pre-title"> </h4>
                        <h2 class="section-title">برترین
                            <br>محصولات
                        </h2>
                        <nav class="custom-slick-nav"></nav>
                        <!-- .custom-slick-nav -->
                        <!-- <a class="readmore-link" href="#">Full Catalog</a> -->
                    </header>
                    <!-- .section-header -->
                    <div class="product-categories-1 product-categories-carousel" data-ride="tm-slick-carousel" data-wrap=".products" data-slick='{"rtl":true, "slidesToShow":5,"slidesToScroll":1,"dots":false,"arrows":true,"prevArrow":"<a href=\"#\"><i class=\"tm tm-arrow-right\"><\/i><\/a>","nextArrow":"<a href=\"#\"><i class=\"tm tm-arrow-left\"><\/i><\/a>","appendArrows":"#categories-carousel-1 .custom-slick-nav","responsive":[{"breakpoint":1200,"settings":{"slidesToShow":2,"slidesToScroll":2}},{"breakpoint":1400,"settings":{"slidesToShow":4,"slidesToScroll":4}}]}'>
                        <div class="woocommerce columns-5">
                            <div class="products">
                                <?php foreach ($featured_products as $key => $value) : ?>
                                    <div class="product-category product <?= $key === array_key_first($featured_products) ? 'first' : '' ?> <?= $key === array_key_last($featured_products) ? 'last' : '' ?>">
                                        <a href="product-category.html">
                                            <img width="224" height="197" src="<?= $value['path'] ?>" alt="<?= $value['alt'] ?>">
                                            <h2 class="woocommerce-loop-category__title">
                                                <?= $value['title'] ?>
                                            </h2>
                                        </a>
                                    </div>
                                <?php endforeach; ?>
                                <!-- <div class="product-category product last">
                                    <a href="product-category.html">
                                        <img width="224" height="197" alt="Home Theater &amp; Audio" src="<?= asset_url() ?>Frontend/images/category/25.png">
                                        <h2 class="woocommerce-loop-category__title">
                                            Home Theater &amp; Audio
                                        </h2>
                                    </a>
                                </div> -->

                            </div>
                            <!-- .products -->
                        </div>
                        <!-- .woocommerce -->
                    </div>
                    <!-- .product-categories-carousel -->
                </section>
                <!-- .section-categories-carousel -->
                <section style="background-size: cover; background-position: center center; background-image: url( <?= asset_url() ?>Frontend/images/products/card-bg.jpg); height: 853px;" class="section-landscape-full-product-cards-carousel">
                    <div class="col-full">
                        <header class="section-header">
                            <h2 class="section-title">
                                محصولات سیسکو
                            </h2>
                        </header>
                        <!-- .section-header -->
                        <div class="row">
                            <div class="landscape-full-product-cards-carousel">
                                <div class="products-carousel" data-ride="tm-slick-carousel" data-wrap=".products" data-slick="{&quot;rtl&quot;:true,&quot;rows&quot;:2,&quot;slidesPerRow&quot;:2,&quot;slidesToShow&quot;:1,&quot;slidesToScroll&quot;:1,&quot;dots&quot;:true,&quot;arrows&quot;:false,&quot;responsive&quot;:[{&quot;breakpoint&quot;:767,&quot;settings&quot;:{&quot;slidesPerRow&quot;:2,&quot;slidesToShow&quot;:1,&quot;slidesToScroll&quot;:1}},{&quot;breakpoint&quot;:1200,&quot;settings&quot;:{&quot;slidesPerRow&quot;:1,&quot;slidesToShow&quot;:1,&quot;slidesToScroll&quot;:1}}]}">
                                    <div class="container-fluid">
                                        <div class="woocommerce columns-2">
                                            <div class="products">
                                                <div class="landscape-product-card product">
                                                    <div class="media">
                                                        <div class="yith-wcwl-add-to-wishlist">
                                                            <a href="wishlist.html" rel="nofollow" class="add_to_wishlist">افزودن به علاقه مندی ها</a>
                                                        </div>
                                                        <a class="woocommerce-LoopProduct-link" href="single-product-fullwidth.html">
                                                            <img class="wp-post-image" src="<?= asset_url() ?>Frontend/images/products/1-2.jpg" alt="">
                                                        </a>
                                                        <div class="media-body" style="direction: rtl;">
                                                            <a class="woocommerce-LoopProduct-link " href="single-product-fullwidth.html">
                                                                <span class="price">
                                                                    <ins>
                                                                        <span class="amount" dircetion="rtl">112,000,000
                                                                            ریال</span>
                                                                    </ins>
                                                                    <br>
                                                                    <del>
                                                                        <span class="amount" dircetion="rtl">26,000,000
                                                                            ریال</span>
                                                                    </del>
                                                                </span>
                                                                <!-- .price -->
                                                                <h2 class="woocommerce-loop-product__title">
                                                                    UN40H5003 40-Inch 1080p LED TV with
                                                                    Backlight</h2>
                                                                <div class="ribbon green-label">
                                                                    <span>A++</span>
                                                                </div>
                                                                <div class="techmarket-product-rating">
                                                                    <div title="Rated 0 out of 5" class="star-rating">
                                                                        <span style="width:0%">
                                                                            <strong class="rating">0</strong>
                                                                            out of 5</span>
                                                                    </div>
                                                                    <span class="review-count">(0)</span>
                                                                </div>
                                                                <!-- .techmarket-product-rating -->
                                                            </a>
                                                            <div class="hover-area">
                                                                <a class="button add_to_cart_button" href="cart.html">افزودن به سبد خرید</a>
                                                                <a href="compare.html" class="add-to-compare-link">Add to
                                                                    compare</a>
                                                            </div>
                                                            <!-- .hover-area -->
                                                        </div>
                                                        <!-- .media-body -->
                                                    </div>
                                                    <!-- .media -->
                                                </div>
                                                <!-- .woocommerce-LoopProduct-link -->
                                                <div class="landscape-product-card product">
                                                    <div class="media">
                                                        <div class="yith-wcwl-add-to-wishlist">
                                                            <a href="wishlist.html" rel="nofollow" class="add_to_wishlist">افزودن به علاقه مندی ها</a>
                                                        </div>
                                                        <a class="woocommerce-LoopProduct-link" href="single-product-fullwidth.html">
                                                            <img class="wp-post-image" src="<?= asset_url() ?>Frontend/images/products/1-4.jpg" alt="">
                                                        </a>
                                                        <div class="media-body" style="direction: rtl;">
                                                            <a class="woocommerce-LoopProduct-link " href="single-product-fullwidth.html">
                                                                <span class="price">
                                                                    <ins>
                                                                        <span class="amount" dircetion="rtl">112,000,000
                                                                            ریال</span>
                                                                    </ins>
                                                                    <br>
                                                                    <del>
                                                                        <span class="amount" dircetion="rtl">26,000,000
                                                                            ریال</span>
                                                                    </del>
                                                                </span>
                                                                <!-- .price -->
                                                                <h2 class="woocommerce-loop-product__title">
                                                                    60UH6150 60-Inch 4K Ultra HD Smart LED
                                                                    TV</h2>
                                                                <div class="ribbon green-label">
                                                                    <span>A+</span>
                                                                </div>
                                                                <div class="techmarket-product-rating">
                                                                    <div title="Rated 0 out of 5" class="star-rating">
                                                                        <span style="width:0%">
                                                                            <strong class="rating">0</strong>
                                                                            out of 5</span>
                                                                    </div>
                                                                    <span class="review-count">(0)</span>
                                                                </div>
                                                                <!-- .techmarket-product-rating -->
                                                            </a>
                                                            <div class="hover-area">
                                                                <a class="button add_to_cart_button" href="cart.html">افزودن به سبد خرید</a>
                                                                <a href="compare.html" class="add-to-compare-link">Add to
                                                                    compare</a>
                                                            </div>
                                                            <!-- .hover-area -->
                                                        </div>
                                                        <!-- .media-body -->
                                                    </div>
                                                    <!-- .media -->
                                                </div>
                                                <!-- .woocommerce-LoopProduct-link -->
                                                <div class="landscape-product-card product">
                                                    <div class="media">
                                                        <div class="yith-wcwl-add-to-wishlist">
                                                            <a href="wishlist.html" rel="nofollow" class="add_to_wishlist">افزودن به علاقه مندی ها</a>
                                                        </div>
                                                        <a class="woocommerce-LoopProduct-link" href="single-product-fullwidth.html">
                                                            <img class="wp-post-image" src="<?= asset_url() ?>Frontend/images/products/1-1.jpg" alt="">
                                                        </a>
                                                        <div class="media-body" style="direction: rtl;">
                                                            <a class="woocommerce-LoopProduct-link " href="single-product-fullwidth.html">
                                                                <span class="price">
                                                                    <ins>
                                                                        <span class="amount" dircetion="rtl">112,000,000
                                                                            ریال</span>
                                                                    </ins>
                                                                    <br>
                                                                    <del>
                                                                        <span class="amount" dircetion="rtl">26,000,000
                                                                            ریال</span>
                                                                    </del>
                                                                </span>
                                                                <!-- .price -->
                                                                <h2 class="woocommerce-loop-product__title">
                                                                    55EG9600 – 55-Inch 2160p Smart Curved
                                                                    Ultra HD 3D</h2>
                                                                <div class="ribbon green-label">
                                                                    <span>A++</span>
                                                                </div>
                                                                <div class="techmarket-product-rating">
                                                                    <div title="Rated 0 out of 5" class="star-rating">
                                                                        <span style="width:0%">
                                                                            <strong class="rating">0</strong>
                                                                            out of 5</span>
                                                                    </div>
                                                                    <span class="review-count">(0)</span>
                                                                </div>
                                                                <!-- .techmarket-product-rating -->
                                                            </a>
                                                            <div class="hover-area">
                                                                <a class="button add_to_cart_button" href="cart.html">افزودن به سبد خرید</a>
                                                                <a href="compare.html" class="add-to-compare-link">Add to
                                                                    compare</a>
                                                            </div>
                                                            <!-- .hover-area -->
                                                        </div>
                                                        <!-- .media-body -->
                                                    </div>
                                                    <!-- .media -->
                                                </div>
                                                <!-- .woocommerce-LoopProduct-link -->
                                                <div class="landscape-product-card product">
                                                    <div class="media">
                                                        <div class="yith-wcwl-add-to-wishlist">
                                                            <a href="wishlist.html" rel="nofollow" class="add_to_wishlist">افزودن به علاقه مندی ها</a>
                                                        </div>
                                                        <a class="woocommerce-LoopProduct-link" href="single-product-fullwidth.html">
                                                            <img class="wp-post-image" src="<?= asset_url() ?>Frontend/images/products/1-6.jpg" alt="">
                                                        </a>
                                                        <div class="media-body" style="direction: rtl;">
                                                            <a class="woocommerce-LoopProduct-link " href="single-product-fullwidth.html">
                                                                <span class="price">
                                                                    <ins>
                                                                        <span class="amount" dircetion="rtl">112,000,000
                                                                            ریال</span>
                                                                    </ins>
                                                                    <br>
                                                                    <del>
                                                                        <span class="amount" dircetion="rtl">26,000,000
                                                                            ریال</span>
                                                                    </del>
                                                                </span>
                                                                <!-- .price -->
                                                                <h2 class="woocommerce-loop-product__title">
                                                                    55UP130 55-Inch 4K Ultra HD Roku Smart
                                                                    LED TV</h2>
                                                                <div class="ribbon green-label">
                                                                    <span>A+</span>
                                                                </div>
                                                                <div class="techmarket-product-rating">
                                                                    <div title="Rated 0 out of 5" class="star-rating">
                                                                        <span style="width:0%">
                                                                            <strong class="rating">0</strong>
                                                                            out of 5</span>
                                                                    </div>
                                                                    <span class="review-count">(0)</span>
                                                                </div>
                                                                <!-- .techmarket-product-rating -->
                                                            </a>
                                                            <div class="hover-area">
                                                                <a class="button add_to_cart_button" href="cart.html">افزودن به سبد خرید</a>
                                                                <a href="compare.html" class="add-to-compare-link">Add to
                                                                    compare</a>
                                                            </div>
                                                            <!-- .hover-area -->
                                                        </div>
                                                        <!-- .media-body -->
                                                    </div>
                                                    <!-- .media -->
                                                </div>
                                                <!-- .woocommerce-LoopProduct-link -->
                                                <div class="landscape-product-card product">
                                                    <div class="media">
                                                        <div class="yith-wcwl-add-to-wishlist">
                                                            <a href="wishlist.html" rel="nofollow" class="add_to_wishlist">افزودن به علاقه مندی ها</a>
                                                        </div>
                                                        <a class="woocommerce-LoopProduct-link" href="single-product-fullwidth.html">
                                                            <img class="wp-post-image" src="<?= asset_url() ?>Frontend/images/products/1-2.jpg" alt="">
                                                        </a>
                                                        <div class="media-body" style="direction: rtl;">
                                                            <a class="woocommerce-LoopProduct-link " href="single-product-fullwidth.html">
                                                                <span class="price">
                                                                    <ins>
                                                                        <span class="amount" dircetion="rtl">112,000,000
                                                                            ریال</span>
                                                                    </ins>
                                                                    <br>
                                                                    <del>
                                                                        <span class="amount" dircetion="rtl">26,000,000
                                                                            ریال</span>
                                                                    </del>
                                                                </span>
                                                                <!-- .price -->
                                                                <h2 class="woocommerce-loop-product__title">
                                                                    55″ KU6470 6 Series UHD Crystal Colour
                                                                    HDR Smart TV</h2>
                                                                <div class="ribbon green-label">
                                                                    <span>A+</span>
                                                                </div>
                                                                <div class="techmarket-product-rating">
                                                                    <div title="Rated 0 out of 5" class="star-rating">
                                                                        <span style="width:0%">
                                                                            <strong class="rating">0</strong>
                                                                            out of 5</span>
                                                                    </div>
                                                                    <span class="review-count">(0)</span>
                                                                </div>
                                                                <!-- .techmarket-product-rating -->
                                                            </a>
                                                            <div class="hover-area">
                                                                <a class="button add_to_cart_button" href="cart.html">افزودن به سبد خرید</a>
                                                                <a href="compare.html" class="add-to-compare-link">Add to
                                                                    compare</a>
                                                            </div>
                                                            <!-- .hover-area -->
                                                        </div>
                                                        <!-- .media-body -->
                                                    </div>
                                                    <!-- .media -->
                                                </div>
                                                <!-- .woocommerce-LoopProduct-link -->
                                                <div class="landscape-product-card product">
                                                    <div class="media">
                                                        <div class="yith-wcwl-add-to-wishlist">
                                                            <a href="wishlist.html" rel="nofollow" class="add_to_wishlist">افزودن به علاقه مندی ها</a>
                                                        </div>
                                                        <a class="woocommerce-LoopProduct-link" href="single-product-fullwidth.html">
                                                            <img class="wp-post-image" src="<?= asset_url() ?>Frontend/images/products/1-5.jpg" alt="">
                                                        </a>
                                                        <div class="media-body" style="direction: rtl;">
                                                            <a class="woocommerce-LoopProduct-link " href="single-product-fullwidth.html">
                                                                <span class="price">
                                                                    <ins>
                                                                        <span class="amount" dircetion="rtl">112,000,000
                                                                            ریال</span>
                                                                    </ins>
                                                                    <br>
                                                                    <del>
                                                                        <span class="amount" dircetion="rtl">26,000,000
                                                                            ریال</span>
                                                                    </del>
                                                                </span>
                                                                <!-- .price -->
                                                                <h2 class="woocommerce-loop-product__title">
                                                                    55″ KU6470 6 Series UHD Crystal Colour
                                                                    HDR Smart TV</h2>
                                                                <div class="ribbon green-label">
                                                                    <span>A++</span>
                                                                </div>
                                                                <div class="techmarket-product-rating">
                                                                    <div title="Rated 0 out of 5" class="star-rating">
                                                                        <span style="width:0%">
                                                                            <strong class="rating">0</strong>
                                                                            out of 5</span>
                                                                    </div>
                                                                    <span class="review-count">(0)</span>
                                                                </div>
                                                                <!-- .techmarket-product-rating -->
                                                            </a>
                                                            <div class="hover-area">
                                                                <a class="button add_to_cart_button" href="cart.html">افزودن به سبد خرید</a>
                                                                <a href="compare.html" class="add-to-compare-link">Add to
                                                                    compare</a>
                                                            </div>
                                                            <!-- .hover-area -->
                                                        </div>
                                                        <!-- .media-body -->
                                                    </div>
                                                    <!-- .media -->
                                                </div>
                                                <!-- .woocommerce-LoopProduct-link -->
                                                <div class="landscape-product-card product">
                                                    <div class="media">
                                                        <div class="yith-wcwl-add-to-wishlist">
                                                            <a href="wishlist.html" rel="nofollow" class="add_to_wishlist">افزودن به علاقه مندی ها</a>
                                                        </div>
                                                        <a class="woocommerce-LoopProduct-link" href="single-product-fullwidth.html">
                                                            <img class="wp-post-image" src="<?= asset_url() ?>Frontend/images/products/1-3.jpg" alt="">
                                                        </a>
                                                        <div class="media-body" style="direction: rtl;">
                                                            <a class="woocommerce-LoopProduct-link " href="single-product-fullwidth.html">
                                                                <span class="price">
                                                                    <ins>
                                                                        <span class="amount" dircetion="rtl">112,000,000
                                                                            ریال</span>
                                                                    </ins>
                                                                    <br>
                                                                    <del>
                                                                        <span class="amount" dircetion="rtl">26,000,000
                                                                            ریال</span>
                                                                    </del>
                                                                </span>
                                                                <!-- .price -->
                                                                <h2 class="woocommerce-loop-product__title">
                                                                    55EG9600 – 55-Inch 2160p Smart Curved
                                                                    Ultra HD 3D</h2>
                                                                <div class="ribbon green-label">
                                                                    <span>A+</span>
                                                                </div>
                                                                <div class="techmarket-product-rating">
                                                                    <div title="Rated 0 out of 5" class="star-rating">
                                                                        <span style="width:0%">
                                                                            <strong class="rating">0</strong>
                                                                            out of 5</span>
                                                                    </div>
                                                                    <span class="review-count">(0)</span>
                                                                </div>
                                                                <!-- .techmarket-product-rating -->
                                                            </a>
                                                            <div class="hover-area">
                                                                <a class="button add_to_cart_button" href="cart.html">افزودن به سبد خرید</a>
                                                                <a href="compare.html" class="add-to-compare-link">Add to
                                                                    compare</a>
                                                            </div>
                                                            <!-- .hover-area -->
                                                        </div>
                                                        <!-- .media-body -->
                                                    </div>
                                                    <!-- .media -->
                                                </div>
                                                <!-- .woocommerce-LoopProduct-link -->
                                                <div class="landscape-product-card product">
                                                    <div class="media">
                                                        <div class="yith-wcwl-add-to-wishlist">
                                                            <a href="wishlist.html" rel="nofollow" class="add_to_wishlist">افزودن به علاقه مندی ها</a>
                                                        </div>
                                                        <a class="woocommerce-LoopProduct-link" href="single-product-fullwidth.html">
                                                            <img class="wp-post-image" src="<?= asset_url() ?>Frontend/images/products/1-5.jpg" alt="">
                                                        </a>
                                                        <div class="media-body" style="direction: rtl;">
                                                            <a class="woocommerce-LoopProduct-link " href="single-product-fullwidth.html">
                                                                <span class="price">
                                                                    <ins>
                                                                        <span class="amount" dircetion="rtl">112,000,000
                                                                            ریال</span>
                                                                    </ins>
                                                                    <br>
                                                                    <del>
                                                                        <span class="amount" dircetion="rtl">26,000,000
                                                                            ریال</span>
                                                                    </del>
                                                                </span>
                                                                <!-- .price -->
                                                                <h2 class="woocommerce-loop-product__title">
                                                                    65UH7700 65-Inch 4K Ultra HD Smart LED
                                                                    TV</h2>
                                                                <div class="ribbon green-label">
                                                                    <span>A</span>
                                                                </div>
                                                                <div class="techmarket-product-rating">
                                                                    <div title="Rated 0 out of 5" class="star-rating">
                                                                        <span style="width:0%">
                                                                            <strong class="rating">0</strong>
                                                                            out of 5</span>
                                                                    </div>
                                                                    <span class="review-count">(0)</span>
                                                                </div>
                                                                <!-- .techmarket-product-rating -->
                                                            </a>
                                                            <div class="hover-area">
                                                                <a class="button add_to_cart_button" href="cart.html">افزودن به سبد خرید</a>
                                                                <a href="compare.html" class="add-to-compare-link">Add to
                                                                    compare</a>
                                                            </div>
                                                            <!-- .hover-area -->
                                                        </div>
                                                        <!-- .media-body -->
                                                    </div>
                                                    <!-- .media -->
                                                </div>
                                                <!-- .woocommerce-LoopProduct-link -->
                                            </div>
                                            <!-- .products -->
                                        </div>
                                        <!-- .woocommerce -->
                                    </div>
                                    <!-- .container-fluid -->
                                </div>
                                <!-- .slick-dots -->
                            </div>
                            <!-- .landscape-full-product-cards-carousel -->
                        </div>
                        <!-- .row -->
                    </div>
                    <!-- .col-full -->
                </section>
                <!-- .slick-dots -->
                <section class="section-hot-new-arrivals section-products-carousel-tabs techmarket-tabs">
                    <div class="section-products-carousel-tabs-wrap">
                        <header class="section-header">
                            <h2 class="section-title">محصولات پرفروش</h2>
                            <ul role="tablist" class="nav justify-content-end">
                                <li class="nav-item"><a class="nav-link active" href="#tab-59f89f08825d50" data-toggle="tab">سرور</a></li>
                                <li class="nav-item"><a class="nav-link " href="#tab-59f89f08825d51" data-toggle="tab">سوئیچ</a></li>

                            </ul>
                        </header>
                        <!-- .section-header -->
                        <div class="tab-content">
                            <div id="tab-59f89f08825d50" class="tab-pane active" role="tabpanel">
                                <div class="products-carousel" data-ride="tm-slick-carousel" data-wrap=".products" data-slick="{&quot;rtl&quot;:true,&quot;infinite&quot;:false,&quot;slidesToShow&quot;:7,&quot;slidesToScroll&quot;:7,&quot;dots&quot;:true,&quot;arrows&quot;:false,&quot;responsive&quot;:[{&quot;breakpoint&quot;:700,&quot;settings&quot;:{&quot;slidesToShow&quot;:2,&quot;slidesToScroll&quot;:2}},{&quot;breakpoint&quot;:780,&quot;settings&quot;:{&quot;slidesToShow&quot;:3,&quot;slidesToScroll&quot;:3}},{&quot;breakpoint&quot;:1200,&quot;settings&quot;:{&quot;slidesToShow&quot;:4,&quot;slidesToScroll&quot;:4}},{&quot;breakpoint&quot;:1400,&quot;settings&quot;:{&quot;slidesToShow&quot;:5,&quot;slidesToScroll&quot;:5}}]}">
                                    <div class="container-fluid">
                                        <div class="woocommerce">
                                            <div class="products">
                                                <?php foreach ($product_servers as $value) : ?>

                                                    <div class="product">
                                                        <div class="yith-wcwl-add-to-wishlist">
                                                            <a href="wishlist.html" rel="nofollow" class="add_to_wishlist">افزودن به علاقه مندی ها</a>
                                                        </div>
                                                        <a href="<?= base_url() . 'product/' . $value['id'] ?>" class="woocommerce-LoopProduct-link">
                                                            <img src="<?= $value['path'] ?>" width="224" height="197" class="wp-post-image" alt="<?= $value['alt'] ?>">
                                                            <span class="price">
                                                                <ins>
                                                                    <span class="amount" dircetion="rtl"> </span>
                                                                </ins>
                                                                <span class="amount" dircetion="rtl"> <?= $value['price'] ?> ریال</span>
                                                            </span>
                                                            <!-- /.price -->
                                                            <h2 class="woocommerce-loop-product__title"><?= $value['title'] ?></h2>
                                                        </a>
                                                        <div class="hover-area">
                                                            <a class="button add_to_cart_button" href="cart.html" rel="nofollow">افزودن به سبد خرید</a>
                                                            <a class="add-to-compare-link" href="compare.html">افزودن به مقایسه</a>
                                                        </div>
                                                    </div>

                                                <?php endforeach; ?>
                                            </div>
                                        </div>
                                        <!-- .woocommerce -->
                                    </div>
                                    <!-- .container-fluid -->
                                </div>
                                <!-- .products-carousel -->
                            </div>
                            <!-- .tab-pane -->
                            <div id="tab-59f89f08825d51" class="tab-pane " role="tabpanel">
                                <div class="products-carousel" data-ride="tm-slick-carousel" data-wrap=".products" data-slick="{&quot;rtl&quot;:true,&quot;infinite&quot;:false,&quot;slidesToShow&quot;:7,&quot;slidesToScroll&quot;:7,&quot;dots&quot;:true,&quot;arrows&quot;:false,&quot;responsive&quot;:[{&quot;breakpoint&quot;:700,&quot;settings&quot;:{&quot;slidesToShow&quot;:2,&quot;slidesToScroll&quot;:2}},{&quot;breakpoint&quot;:780,&quot;settings&quot;:{&quot;slidesToShow&quot;:3,&quot;slidesToScroll&quot;:3}},{&quot;breakpoint&quot;:1200,&quot;settings&quot;:{&quot;slidesToShow&quot;:4,&quot;slidesToScroll&quot;:4}},{&quot;breakpoint&quot;:1400,&quot;settings&quot;:{&quot;slidesToShow&quot;:5,&quot;slidesToScroll&quot;:5}}]}">
                                    <div class="container-fluid">
                                        <div class="woocommerce">
                                            <div class="products">
                                                <?php foreach ($product_switch as $value) : ?>
                                                    <div class="product">
                                                        <div class="yith-wcwl-add-to-wishlist">
                                                            <a href="wishlist.html" rel="nofollow" class="add_to_wishlist">افزودن به علاقه مندی ها</a>
                                                        </div>
                                                        <a href="<?= base_url() . 'product/' . $value['id'] ?>" class="woocommerce-LoopProduct-link">
                                                            <span class="onsale">
                                                                <span class="woocommerce-Price-amount amount" dir="rtl">
                                                                    2,000,000 ریال</span>
                                                            </span>
                                                            <img src="<?= $value['path'] ?>" width="224" height="197" class="wp-post-image" alt="<?= $value['alt'] ?>">
                                                            <span class="price">
                                                                <ins>
                                                                    <span class="amount" dircetion="rtl"> 150,000,000
                                                                        ریال</span>
                                                                </ins>
                                                                <del>
                                                                    <span class="amount" dircetion="rtl">200,000,000 ریال</span>
                                                                </del>
                                                                <span class="amount" dircetion="rtl"> </span>
                                                            </span>
                                                            <h2 class="woocommerce-loop-product__title">
                                                                Bluetooth on-ear PureBass Headphones</h2>
                                                        </a>
                                                        <div class="hover-area">
                                                            <a class="button add_to_cart_button" href="cart.html" rel="nofollow">افزودن به سبد خرید</a>
                                                            <a class="add-to-compare-link" href="compare.html">افزودن به مقایسه</a>
                                                        </div>
                                                    </div>
                                                <?php endforeach; ?>
                                            </div>
                                            <!-- .woocommerce -->
                                        </div>
                                        <!-- .container-fluid -->
                                    </div>
                                    <!-- .products-carousel -->
                                </div>
                                <!-- .tab-pane -->
                            </div>
                            <!-- .tab-content -->
                        </div>
                        <!-- .section-products-carousel-tabs-wrap -->
                </section>
                <!-- .section-products-carousel-tabs -->
                <div class="banners">
                    <div class="row">
                        <div class="banner banner-long text-in-left">
                            <a href="shop.html">
                                <div style="background-size: cover; background-position: center center; background-image: url( <?= asset_url() ?>Frontend/images/banner/3-2.jpg); height: 259px;padding-right: 10px;justify-content: right;" class="banner-bg">
                                    <div class="caption">
                                        <div class="banner-info">
                                            <h3 class="title"> تمامی محصولات
                                                <br /><strong>Dell EMC</strong>
                                            </h3>
                                        </div>
                                        <!-- /.banner-info -->
                                        <span class="banner-action button">اطلاعات بیشتر</span>
                                    </div>
                                    <!-- /.caption -->
                                </div>
                                <!-- /.banner-bg -->
                            </a>
                        </div>
                        <!-- /.banner -->
                        <div class="banner banner-short text-in-right">
                            <a href="shop.html">
                                <div style="background-size: cover; background-position: center center; background-image: url( <?= asset_url() ?>Frontend/images/banner/3-3.jpg); height: 259px;" class="banner-bg">
                                    <div class="caption">
                                        <div class="banner-info">
                                            <h3 class="title">
                                                تمامی محصولات
                                                <br> <strong>HPE</strong>
                                            </h3>
                                        </div>
                                        <!-- /.banner-info -->
                                        <!-- <span class="price">$34.99</span> -->
                                        <span class="banner-action button">اطلاعات بیشتر</span>
                                    </div>
                                    <!-- /.caption -->
                                </div>
                                <!-- /.banner-bg -->
                            </a>
                        </div>
                        <!-- /.banner -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.banners -->
                <section class="section-landscape-products-carousel 4-column-landscape-carousel" id="landscape-products-carousel">
                    <header class="section-header">
                        <h2 class="section-title">سرورها و رک ها</h2>
                        <nav class="custom-slick-nav">
                        </nav>
                    </header>
                    <div class="products-carousel" data-ride="tm-slick-carousel" data-wrap=".products" data-slick="{&quot;slidesToShow&quot;:4,&quot;slidesToScroll&quot;:2,&quot;dots&quot;:false,&quot;arrows&quot;:true,&quot;prevArrow&quot;:&quot;<a href=\&quot;#\&quot;><i class=\&quot;tm tm-arrow-right\&quot;><\/i><\/a>&quot;,&quot;nextArrow&quot;:&quot;<a href=\&quot;#\&quot;><i class=\&quot;tm tm-arrow-left\&quot;><\/i><\/a>&quot;,&quot;appendArrows&quot;:&quot;#landscape-products-carousel .custom-slick-nav&quot;,&quot;responsive&quot;:[{&quot;breakpoint&quot;:1200,&quot;settings&quot;:{&quot;slidesToShow&quot;:2,&quot;slidesToScroll&quot;:2}},{&quot;breakpoint&quot;:1400,&quot;settings&quot;:{&quot;slidesToShow&quot;:3,&quot;slidesToScroll&quot;:3}}]}">
                        <div class="container-fluid" dir="ltr">
                            <div class="woocommerce columns-5">
                                <div class="products">
                                    <?php foreach ($product_servers as $value) : ?>
                                        <div class="landscape-product product">
                                            <a class="woocommerce-LoopProduct-link" href="<?= base_url() . 'product/' . $value['id'] ?>">
                                                <div class="media">
                                                    <img class="wp-post-image" src="<?= $value['path'] ?>" alt="<?= $value['alt'] ?>">
                                                    <div class="media-body" style="direction: rtl;">
                                                        <span class="price">
                                                            <ins>
                                                                <span class="amount" dircetion="rtl"> </span>
                                                            </ins>
                                                            <span class="amount" dircetion="rtl">500.000.000 ریال</span>
                                                        </span>
                                                        <!-- .price -->
                                                        <h2 class="woocommerce-loop-product__title">Headset 3D
                                                            Glasses VR for Android</h2>
                                                        <div class="techmarket-product-rating">
                                                            <div title="Rated 0 out of 5" class="star-rating">
                                                                <span style="width:0%">
                                                                    <strong class="rating">0</strong> out of
                                                                    5</span>
                                                            </div>
                                                            <span class="review-count">(0)</span>
                                                        </div>
                                                        <!-- .techmarket-product-rating -->
                                                    </div>
                                                    <!-- .media-body -->
                                                </div>
                                                <!-- .media -->
                                            </a>
                                            <!-- .woocommerce-LoopProduct-link -->
                                        </div>
                                    <?php endforeach; ?>

                                </div>
                            </div>
                            <!-- /.woocommerce -->
                        </div>
                        <!-- /.container-fluid -->
                    </div>
                    <!-- /.products-carousel -->
                </section>
                <div class="big-banner pb-100 pb-sm-60">
                    <div class="container big-banner-box">
                        <div class="col-img">
                            <a href="#">
                                <img src="<?= asset_url() ?>Frontend/images/banner/5.jpg" alt="">
                            </a>
                        </div>
                        <div class="col-img">
                            <a href="#">
                                <img src="<?= asset_url() ?>Frontend/images/banner/h1-banner3.jpg" alt="">
                            </a>
                        </div>
                    </div>
                    <!-- Container End -->
                </div>
                <br>
                <!-- /.section-landscape-products-carousel -->
                <section class="stretch-full-width section-products-carousel-with-vertical-tabs">
                    <header class="section-header">
                        <h2 class="section-title">برندها</h2>
                    </header>
                    <!-- /.section-header -->
                    <div class="products-carousel-with-vertical-tabs row">
                        <ul role="tablist" class="nav">
                            <?php
                            $count_1 = 0;
                            ?>
                            <?php foreach ($product_brands as $brands) : ?>
                                <li class="nav-item">
                                    <a class="nav-link <?= $count_1 == 0 ? 'active' : '' ?>" href="#desktop-<?= $brands['id'] ?>" data-toggle="tab">
                                        <?php
                                        $count_1++;
                                        ?>
                                        <span class="category-title"><?= $brands['name'] ?></span>
                                        <i class="tm tm-arrow-left"></i>
                                    </a>
                                </li>

                            <?php endforeach; ?>


                        </ul>
                        <div style="background-size: cover; background-position: center center; background-image: url( <?= asset_url() ?>Frontend/images/banner/vertical-bg.png); height: 552px;" class="tab-content">
                            <?php
                            $count_2 = 0;
                            ?>
                            <?php foreach ($product_brands as $brands) : ?>
                                <div id="desktop-<?= $brands['id'] ?>" class="tab-pane <?= $count_2 == 0 ? 'active' : '' ?>" role="tabpanel">
                                    <?php
                                    $count_2++;
                                    ?>
                                    <div class="products-carousel" data-ride="tm-slick-carousel" data-wrap=".products" data-slick="{&quot;rtl&quot;:true,&quot;infinite&quot;:false,&quot;slidesToShow&quot;:6,&quot;slidesToScroll&quot;:6,&quot;dots&quot;:true,&quot;arrows&quot;:false,&quot;responsive&quot;:[{&quot;breakpoint&quot;:1200,&quot;settings&quot;:{&quot;slidesToShow&quot;:2,&quot;slidesToScroll&quot;:2}},{&quot;breakpoint&quot;:1400,&quot;settings&quot;:{&quot;slidesToShow&quot;:3,&quot;slidesToScroll&quot;:3}},{&quot;breakpoint&quot;:1600,&quot;settings&quot;:{&quot;slidesToShow&quot;:4,&quot;slidesToScroll&quot;:4}}]}">
                                        <div class="container-fluid">
                                            <div class="woocommerce columns-5">
                                                <div class="products">
                                                    <?php foreach ($brands['product'] as $value) : ?>
                                                        <div class="product">
                                                            <div class="yith-wcwl-add-to-wishlist">
                                                                <a href="wishlist.html" rel="nofollow" class="add_to_wishlist">افزودن به علاقه مندی ها</a>
                                                            </div>
                                                            <a href="<?= base_url() . 'product/' . $value['id'] ?>" class="woocommerce-LoopProduct-link">
                                                                <img src="<?= $value['photo_path'] ?>" width="224" height="197" class="wp-post-image" alt="">
                                                                <span class="price">
                                                                    <ins>
                                                                        <span class="amount" dircetion="rtl"> </span>
                                                                    </ins>
                                                                    <span class="amount" dircetion="rtl"> 20,000,000 ریال</span>
                                                                </span>
                                                                <!-- /.price -->
                                                                <h2 class="woocommerce-loop-product__title">Bbd
                                                                    23-Inch Screen LED-Lit Monitorss Buds</h2>
                                                            </a>
                                                            <div class="hover-area">
                                                                <a class="button add_to_cart_button" href="cart.html" rel="nofollow">افزودن به سبد خرید</a>
                                                                <a class="add-to-compare-link" href="compare.html">افزودن به مقایسه</a>
                                                            </div>
                                                        </div>
                                                    <?php endforeach; ?>
                                                </div>
                                            </div>
                                            <!-- .woocommerce-->
                                        </div>
                                        <!-- .container-fluid -->
                                    </div>
                                    <!-- .products-carousel -->
                                </div>
                            <?php endforeach; ?>
                            <!-- .tab-pane -->

                        </div>
                        <!-- .tab-content -->
                    </div>
                    <!-- /.products-carousel-with-vertical-tabs -->
                </section>
                <section class="section-landscape-products-carousel recently-viewed" id="news">
                    <header class="section-header">
                        <h2 class="section-title">آخرین خبرها</h2>
                        <nav class="custom-slick-nav"></nav>
                    </header>
                    <div class="products-carousel" data-ride="tm-slick-carousel" data-wrap=".products" data-slick='{"rtl":true, "slidesToShow":5,"slidesToScroll":2,"dots":true,"arrows":true,"prevArrow":"<a href=\"#\"><i class=\"tm tm-arrow-right\"><\/i><\/a>","nextArrow":"<a href=\"#\"><i class=\"tm tm-arrow-left\"><\/i><\/a>","appendArrows":"#news .custom-slick-nav","responsive":[{"breakpoint":992,"settings":{"slidesToShow":2,"slidesToScroll":2}},{"breakpoint":1200,"settings":{"slidesToShow":3,"slidesToScroll":3}},{"breakpoint":1400,"settings":{"slidesToShow":3,"slidesToScroll":3}},{"breakpoint":1700,"settings":{"slidesToShow":4,"slidesToScroll":4}}]}'>
                        <div class="container-fluid">
                            <div class="woocommerce columns-5">
                                <div class="products">
                                    <?php foreach ($latest_blogs as $value) : ?>
                                        <div class="landscape-product product">
                                            <a class="woocommerce-LoopProduct-link" href="<?= base_url() . 'product/' . $value['id'] ?>">
                                                <div class="media">
                                                    <img class="wp-post-image" src="<?= $value['path'] ?>" alt="">
                                                    <div class="media-body" style="direction: rtl;">
                                                        <span class="price">
                                                            <ins>
                                                                <span class="amount" dircetion="rtl"> جدید ترین هاردها رسید</span>
                                                            </ins>
                                                            <br>
                                                            <span style="color:#acacac;font-size: 0.8em;">25 آبان 1398</span>
                                                        </span>
                                                        <h2 class="woocommerce-loop-product__title">لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. </h2>
                                                    </div>
                                                    <!-- .media-body -->
                                                </div>
                                                <!-- .media -->
                                            </a>
                                            <!-- .woocommerce-LoopProduct-link -->
                                        </div>
                                    <?php endforeach; ?>

                                </div>
                            </div>
                            <!-- .woocommerce -->
                        </div>
                        <!-- .container-fluid -->
                    </div>
                    <!-- .products-carousel -->
                </section>
                <!-- .section-products-carousel-tabs-->
                <div class="banner full-width-banner">
                    <a href="shop.html">
                        <div style="background-size: cover; background-position: center center; background-image: url( <?= asset_url() ?>Frontend/images/banner/full-width.png); height: 236px;" class="banner-bg">
                            <div class="caption">
                                <div class="banner-info">
                                    <h3 class="title">
                                        <strong>اخبار ما را دنبال کنید</strong>
                                        <h4 class="subtitle">برای دریافت اخبار روز دنیای فناوری در خبرنامه
                                            ما عضو شوید</h4>
                                </div>
                                <span class="banner-action button">جستجوی اخبار
                                    <i class="feature-icon d-flex ml-4 tm tm-long-arrow-left"></i>
                                </span>
                            </div>
                            <!-- /.caption -->
                        </div>
                        <!-- /.banner-b -->
                    </a>
                    <!-- /.section-header -->
                </div>
                <!-- /.product-carousel-with-banners -->
                <section class="brands-carousel">
                    <h2 class="sr-only">Brands Carousel</h2>
                    <div class="col-full" data-ride="tm-slick-carousel" data-wrap=".brands" data-slick='{"rtl":true,"slidesToShow":6,"slidesToScroll":1,"dots":false,"arrows":true,"responsive":[{"breakpoint":400,"settings":{"slidesToShow":1,"slidesToScroll":1}},{"breakpoint":800,"settings":{"slidesToShow":3,"slidesToScroll":3}},{"breakpoint":992,"settings":{"slidesToShow":3,"slidesToScroll":3}},{"breakpoint":1200,"settings":{"slidesToShow":4,"slidesToScroll":4}},{"breakpoint":1400,"settings":{"slidesToShow":5,"slidesToScroll":5}}]}'>
                        <div class="brands">
                            <div class="item">
                                <a href="shop.html">
                                    <figure>
                                        <figcaption class="text-overlay">
                                            <div class="info">
                                                <h4>apple</h4>
                                            </div>
                                            <!-- /.info -->
                                        </figcaption>
                                        <img width="145" height="50" class="img-responsive desaturate" alt="apple" src="<?= asset_url() ?>Frontend/images/brands/1.png">
                                    </figure>
                                </a>
                            </div>
                            <!-- .item -->
                            <div class="item">
                                <a href="shop.html">
                                    <figure>
                                        <figcaption class="text-overlay">
                                            <div class="info">
                                                <h4>bosch</h4>
                                            </div>
                                            <!-- /.info -->
                                        </figcaption>
                                        <img width="145" height="50" class="img-responsive desaturate" alt="bosch" src="<?= asset_url() ?>Frontend/images/brands/2.png">
                                    </figure>
                                </a>
                            </div>
                            <!-- .item -->
                            <div class="item">
                                <a href="shop.html">
                                    <figure>
                                        <figcaption class="text-overlay">
                                            <div class="info">
                                                <h4>cannon</h4>
                                            </div>
                                            <!-- /.info -->
                                        </figcaption>
                                        <img width="145" height="50" class="img-responsive desaturate" alt="cannon" src="<?= asset_url() ?>Frontend/images/brands/3.png">
                                    </figure>
                                </a>
                            </div>
                            <!-- .item -->
                            <div class="item">
                                <a href="shop.html">
                                    <figure>
                                        <figcaption class="text-overlay">
                                            <div class="info">
                                                <h4>connect</h4>
                                            </div>
                                            <!-- /.info -->
                                        </figcaption>
                                        <img width="145" height="50" class="img-responsive desaturate" alt="connect" src="<?= asset_url() ?>Frontend/images/brands/4.png">
                                    </figure>
                                </a>
                            </div>
                            <!-- .item -->
                            <div class="item">
                                <a href="shop.html">
                                    <figure>
                                        <figcaption class="text-overlay">
                                            <div class="info">
                                                <h4>galaxy</h4>
                                            </div>
                                            <!-- /.info -->
                                        </figcaption>
                                        <img width="145" height="50" class="img-responsive desaturate" alt="galaxy" src="<?= asset_url() ?>Frontend/images/brands/5.png">
                                    </figure>
                                </a>
                            </div>
                            <!-- .item -->
                            <div class="item">
                                <a href="shop.html">
                                    <figure>
                                        <figcaption class="text-overlay">
                                            <div class="info">
                                                <h4>gopro</h4>
                                            </div>
                                            <!-- /.info -->
                                        </figcaption>
                                        <img width="145" height="50" class="img-responsive desaturate" alt="gopro" src="<?= asset_url() ?>Frontend/images/brands/6.png">
                                    </figure>
                                </a>
                            </div>
                            <!-- .item -->
                            <div class="item">
                                <a href="shop.html">
                                    <figure>
                                        <figcaption class="text-overlay">
                                            <div class="info">
                                                <h4>handspot</h4>
                                            </div>
                                            <!-- /.info -->
                                        </figcaption>
                                        <img width="145" height="50" class="img-responsive desaturate" alt="handspot" src="<?= asset_url() ?>Frontend/images/brands/7.png">
                                    </figure>
                                </a>
                            </div>
                            <!-- .item -->
                            <div class="item">
                                <a href="shop.html">
                                    <figure>
                                        <figcaption class="text-overlay">
                                            <div class="info">
                                                <h4>kinova</h4>
                                            </div>
                                            <!-- /.info -->
                                        </figcaption>
                                        <img width="145" height="50" class="img-responsive desaturate" alt="kinova" src="<?= asset_url() ?>Frontend/images/brands/8.png">
                                    </figure>
                                </a>
                            </div>
                            <!-- .item -->
                            <div class="item">
                                <a href="shop.html">
                                    <figure>
                                        <figcaption class="text-overlay">
                                            <div class="info">
                                                <h4>nespresso</h4>
                                            </div>
                                            <!-- /.info -->
                                        </figcaption>
                                        <img width="145" height="50" class="img-responsive desaturate" alt="nespresso" src="<?= asset_url() ?>Frontend/images/brands/9.png">
                                    </figure>
                                </a>
                                `
                            </div>
                            <!-- .item -->
                            <div class="item">
                                <a href="shop.html">
                                    <figure>
                                        <figcaption class="text-overlay">
                                            <div class="info">
                                                <h4>samsung</h4>
                                            </div>
                                            <!-- /.info -->
                                        </figcaption>
                                        <img width="145" height="50" class="img-responsive desaturate" alt="samsung" src="<?= asset_url() ?>Frontend/images/brands/10.png">
                                    </figure>
                                </a>
                            </div>
                            <!-- .item -->
                            <div class="item">
                                <a href="shop.html">
                                    <figure>
                                        <figcaption class="text-overlay">
                                            <div class="info">
                                                <h4>speedway</h4>
                                            </div>
                                            <!-- /.info -->
                                        </figcaption>
                                        <img width="145" height="50" class="img-responsive desaturate" alt="speedway" src="<?= asset_url() ?>Frontend/images/brands/11.png">
                                    </figure>
                                </a>
                            </div>
                            <!-- .item -->
                            <div class="item">
                                <a href="shop.html">
                                    <figure>
                                        <figcaption class="text-overlay">
                                            <div class="info">
                                                <h4>yoko</h4>
                                            </div>
                                            <!-- /.info -->
                                        </figcaption>
                                        <img width="145" height="50" class="img-responsive desaturate" alt="yoko" src="<?= asset_url() ?>Frontend/images/brands/12.png">
                                    </figure>
                                </a>
                            </div>
                            <!-- .item -->
                        </div>
                    </div>
                    <!-- .col-full -->
                </section>
                <!-- .brands-carousel -->
            </main>
            <!-- #main -->
        </div>
        <!-- #primary -->
    </div>
    <!-- .row -->
</div>