<div id="content" class="site-content" tabindex="-1">
    <div class="col-full">
        <div class="row">
            <nav class="woocommerce-breadcrumb">
                <a href="home-v1.html">Home</a>
                <span class="delimiter">
                    <i class="tm tm-breadcrumbs-arrow-right"></i>
                </span>Computers &amp; Laptops
            </nav>
            <!-- .woocommerce-breadcrumb -->
            <div id="primary" class="content-area">
                <main id="main" class="site-main">
                    <section class="section-product-categories">
                        <header class="section-header">
                            <h1 class="woocommerce-products-header__title page-title">Computers &amp; Laptops Categories</h1>
                        </header>
                        <div class="woocommerce columns-5">
                            <div class="product-loop-categories">
                                    <?php foreach ($categories as $value): ?>
                                    <div class="product-category product ">
                                         <!-- change  id categories rename categories_id -->
                                        <a href="<?= base_url() ?>category/<?= $value['id'] ?>">
                                            <img src="<?= $value['path'] ?>" alt="Ultrabooks" width="224" height="197">
                                            <h2 class="woocommerce-loop-category__title"> 
                                            <?= $value['name'] ?>
                                                <mark class="count"></mark>
                                            </h2>
                                        </a>
                                    </div>
                                    <?php endforeach; ?>
                                </div>
                                <!-- .product-loop-categories -->
                            </div>
                        <!-- .woocommerce -->
                    </section>

                </main>
                <!-- #main -->
            </div>
            <!-- #primary -->
            <div id="secondary" class="widget-area shop-sidebar" role="complementary">
                <div id="techmarket_product_categories_widget-2" class="widget woocommerce widget_product_categories techmarket_widget_product_categories">
                    <ul class="product-categories category-single">
                        <li class="product_cat">
                            <ul class="show-all-cat">
                                <li class="product_cat">
                                    <span class="show-all-cat-dropdown">Show All Categories</span>
                                    <ul>
                                        <li class="cat-item"><a href="product-category.html">All in One PC</a></li>
                                        <li class="cat-item"><a href="product-category.html">Audio & Music</a></li>
                                        <li class="cat-item"><a href="product-category.html">Cells & Tablets</a></li>
                                        <li class="cat-item"><a href="product-category.html">Computers & Laptops</a></li>
                                        <li class="cat-item"><a href="product-category.html">Desktop PCs</a></li>
                                        <li class="cat-item"><a href="product-category.html">Digital Cameras</a></li>
                                        <li class="cat-item"><a href="product-category.html">Games & Consoles</a></li>
                                        <li class="cat-item"><a href="product-category.html">Headphones</a></li>
                                        <li class="cat-item"><a href="product-category.html">Home Entertainment</a></li>
                                        <li class="cat-item"><a href="product-category.html">Home Theater & Audio</a></li>
                                        <li class="cat-item"><a href="product-category.html">Mac Computers</a></li>
                                        <li class="cat-item"><a href="product-category.html">Monitors</a></li>
                                        <li class="cat-item"><a href="product-category.html">Notebooks</a></li>
                                        <li class="cat-item"><a href="product-category.html">PC Components</a></li>
                                        <li class="cat-item"><a href="product-category.html">Printer</a></li>
                                        <li class="cat-item"><a href="product-category.html">Smartwatches</a></li>
                                        <li class="cat-item"><a href="product-category.html">Televisions</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul>
                                <li class="cat-item current-cat"><a href="product-category.html">TV &amp; Video</a></li>
                            </ul>
                        </li>
                    </ul>
                    <!-- .product-categories -->
                </div>
                <!-- .techmarket_widget_product_categories -->
                <div class="widget widget_techmarket_products_carousel_widget">
                    <section id="single-sidebar-carousel" class="section-products-carousel">
                        <header class="section-header">
                            <h2 class="section-title">Latest Products</h2>
                            <nav class="custom-slick-nav"></nav>
                        </header>
                        <!-- .section-header -->
                        <div class="products-carousel" data-ride="tm-slick-carousel" data-wrap=".products" data-slick="{&quot;infinite&quot;:false,&quot;slidesToShow&quot;:1,&quot;slidesToScroll&quot;:1,&quot;rows&quot;:2,&quot;slidesPerRow&quot;:1,&quot;dots&quot;:false,&quot;arrows&quot;:true,&quot;prevArrow&quot;:&quot;&lt;a href=https://transvelo.github.io/" #\&quot;&gt;&lt;i class=\&quot;tm tm-arrow-left\&quot;&gt;&lt;\/i&gt;&lt;\/a&gt;&quot;,&quot;nextArrow&quot;:&quot;&lt;a href=https://transvelo.github.io/"#\&quot;&gt;&lt;i class=\&quot;tm tm-arrow-right\&quot;&gt;&lt;\/i&gt;&lt;\/a&gt;&quot;,&quot;appendArrows&quot;:&quot;#single-sidebar-carousel .custom-slick-nav&quot;}">
                            <div class="container-fluid">
                                <div class="woocommerce columns-1">
                                    <div class="products">
                                        <div class="landscape-product-widget product">
                                            <a class="woocommerce-LoopProduct-link" href="single-product-fullwidth.html">
                                                <div class="media">
                                                    <img class="wp-post-image" src="assets/images/products/sm-1.jpg" alt="">
                                                    <div class="media-body">
                                                        <span class="price">
                                                            <ins>
                                                                <span class="amount"> 50.99</span>
                                                            </ins>
                                                            <del>
                                                                <span class="amount">26.99</span>
                                                            </del>
                                                        </span>
                                                        <!-- .price -->
                                                        <h2 class="woocommerce-loop-product__title">S100 Wireless Bluetooth Speaker – Neon Green</h2>
                                                        <div class="techmarket-product-rating">
                                                            <div title="Rated 0 out of 5" class="star-rating">
                                                                <span style="width:0%">
                                                                    <strong class="rating">0</strong> out of 5</span>
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
                                    </div>
                                    <!-- .products -->
                                </div>
                                <!-- .woocommerce -->
                            </div>
                            <!-- .container-fluid -->
                        </div>
                        <!-- .products-carousel -->
                    </section>
                    <!-- .section-products-carousel -->
                </div>
                <!-- .widget_techmarket_products_carousel_widget -->
            </div>
        </div>
        <!-- .row -->
    </div>
    <!-- .col-full -->
</div>