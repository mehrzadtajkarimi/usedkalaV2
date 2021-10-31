<div id="primary" class="mt-5">
    <main id="main" class="site-main">
        <div class="product product-type-simple">
            <div class="row single-product-wrapper">
                <div class="col product-images-wrapper thumb-count-4" dir="ltr">
                    <div id="techmarket-single-product-gallery" class="techmarket-single-product-gallery techmarket-single-product-gallery--with-images techmarket-single-product-gallery--columns-4 images" data-columns="4">
                        <div class="row">
                            <div class="col-10 techmarket-single-product-gallery-images" data-ride="tm-slick-carousel" data-wrap=".woocommerce-product-gallery__wrapper" data-slick="{&quot;infinite&quot;:false,&quot;slidesToShow&quot;:1,&quot;slidesToScroll&quot;:1,&quot;dots&quot;:false,&quot;arrows&quot;:false,&quot;asNavFor&quot;:&quot;#techmarket-single-product-gallery .techmarket-single-product-gallery-thumbnails__wrapper&quot;}">
                                <div class="woocommerce-product-gallery woocommerce-product-gallery--with-images woocommerce-product-gallery--columns-4 images" data-columns="4">
                                    <!-- <a href="#" class="woocommerce-product-gallery__trigger">🔍</a> -->
                                    <figure class="woocommerce-product-gallery__wrapper ">
                                        <div data-thumb="<?= base_url() ?>Assets/Frontend/images/products/1-6.jpg" class="woocommerce-product-gallery__image">
                                            <a href="assets/images/products/1-6.jpg" tabindex="0">
                                                <img width="600" height="600" src="<?= $photo['path']  ?>" class="attachment-shop_single size-shop_single wp-post-image" alt="<?= $photo['alt']  ?>">
                                            </a>
                                        </div>
                                    </figure>
                                </div>
                                <!-- .woocommerce-product-gallery -->
                            </div>
                            <!-- .techmarket-single-product-gallery-images -->
                            <div class="col-2 techmarket-single-product-gallery-thumbnails" style="position: absolute;right: 0;" data-ride="tm-slick-carousel" data-wrap=".techmarket-single-product-gallery-thumbnails__wrapper" data-slick="{&quot;infinite&quot;:false,&quot;slidesToShow&quot;:4,&quot;slidesToScroll&quot;:1,&quot;dots&quot;:false,&quot;arrows&quot;:true,&quot;vertical&quot;:true,&quot;verticalSwiping&quot;:true,&quot;focusOnSelect&quot;:true,&quot;touchMove&quot;:true,&quot;asNavFor&quot;:&quot;#techmarket-single-product-gallery .woocommerce-product-gallery__wrapper&quot;,&quot;responsive&quot;:[{&quot;breakpoint&quot;:765,&quot;settings&quot;:{&quot;vertical&quot;:false,&quot;horizontal&quot;:true,&quot;verticalSwiping&quot;:false,&quot;slidesToShow&quot;:4}}]}">
                                <figure class="techmarket-single-product-gallery-thumbnails__wrapper">
                                    <figure data-thumb="<?= base_url() ?>Assets/Frontend/images/products/1-1.jpg" class="techmarket-wc-product-gallery__image">
                                        <?php foreach ($photos as $value) : ?>
                                            <a href="#">
                                                <img width="180" height="180" src="<?= $value['path'] ?>" class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image" alt="">
                                            </a>
                                        <?php endforeach; ?>
                                    </figure>
                                </figure>
                                <!-- .techmarket-single-product-gallery-thumbnails__wrapper -->
                            </div>
                            <!-- .techmarket-single-product-gallery-thumbnails -->
                        </div>
                    </div>
                    <!-- .techmarket-single-product-gallery -->
                </div>
                <!-- .product-images-wrapper -->
                <div class="col summary entry-summary">
                    <div class="single-product-header">
                        <h1 class="product_title entry-title">Cisco 8000 Series Router</h1>
                    </div>
                    <div class="single-product-meta">
                        <div class="brand">
                            <a href="#">
                                <img alt="galaxy" class="img-fluid" width="180" height="180" src="<?= base_url() ?>Assets/Frontend/images/brands/5.png">
                            </a>
                        </div>
                        <div class="cat-and-sku">
                            <span class="posted_in categories">
                                <a rel="tag" href="product-category.html">روتر</a>
                            </span>
                            <span class="sku_wrapper">شماره شناسه کالا:
                                <span class="sku">5487FB8/11</span>
                            </span>
                        </div>
                        <div class="product-label">
                            <div class="ribbon label green-label">
                                <span>A+</span>
                            </div>
                        </div>
                    </div>

                    <div class="product-actions-wrapper">
                        <div class="product-actions">
                            <p class="price" dir="rtl">
                                <?php if (!empty($product['discounts_status']) && $product['discounts_status'] == 1) : ?>
                                    <del>
                                        <span class="woocommerce-Price-amount amount"><?= $product['price'] ?> ریال</span>
                                    </del>
                                    <ins>
                                        <span class="woocommerce-Price-amount amount"><?= round($product['price'] / $product['discounts_percent'] - $product['price'], 0, PHP_ROUND_HALF_UP) ?>ریال</span>
                                    </ins>
                                <?php else : ?>
                                    <ins>
                                        <span class="woocommerce-Price-amount amount"><?= $product['price'] ?> ریال</span>
                                    </ins>
                                <?php endif; ?>
                            </p>
                            <!-- .single-product-header -->
                            <form action="<?= base_url() ?>cart/add/<?= $product['id'] ?>" enctype="multipart/form-data" method="post" class="cart">
                                <input type="hidden" name="photo_path" value="<?= $photo['path']  ?>">
                                <div class="row">
                                    <div class="col-3 quantity">
                                        <label for="quantity-input">تعداد</label>
                                        <input name="product_quantity" type="number" size="4" class="input-text qty text" title="Qty" value="1" id="quantity-input">
                                    </div>
                                    <!-- .quantity -->
                                    <button class="col-4 btn btn-outline-success" name="add-to-cart" type="submit">افزودن به سبد خرید</button>
                                </div>
                            </form>
                            <!-- .cart -->
                            <a class="add-to-compare-link" href="compare.html">مقایسه</a>
                            <div class="card  border-0 pt-5">
                                <div class="card-body">
                                    <p class="card-text"><?= $product['description'] ?></p>
                                </div>
                            </div>
                        </div>
                        <!-- .product-actions -->
                    </div>
                    <!-- .product-actions-wrapper -->
                </div>
                <!-- .entry-summary -->
            </div>
        </div>
        <!-- .product -->
    </main>
    <!-- #main -->
</div>
<div class="container-fluid">
    <hr>
    <div class="myForm" class="alert alert-success alert-dismissible  mr-5 ml-5  d-none" data-wow-duration="2s" data-wow-offset="10" role="alert">
        <strong>" کامنت با موفقیت ارسال شد بعد از تایید مدیر نمایش داده می شود"</strong>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <?php if ($comments) : ?>
        <h5 class="card-title m-3">نظرات :</h5>
        <?php foreach ($comments as $value) : ?>
            <div class="ml-4 mb-2">
                <small> <?= $value['title'] ?> </small>
                <p>
                    <?= $value['message'] ?>
                </p>
                <span>
                    <span>آیا این دیدگاه برایتان مفید بود؟</span>
                    <span class="m-2 pointer dislike">
                        <small><?= $value['dislike'] ?></small>
                        <i class=" fa fa-thumbs-down text-muted fa-1x " data-id="<?= $value['id'] ?>" title="کلیک کنید تا وضعیت تغییر کند"></i>
                    </span>
                    <span class="m-2 pointer like">
                        <small><?= $value['like'] ?></small>
                        <i class=" fa fa-thumbs-up  fa-1x " data-id="<?= $value['id'] ?>" title="کلیک کنید تا وضعیت تغییر کند"></i>
                    </span>
                </span>
            </div>
        <?php endforeach; ?>
        <!-- <script>
            $(document).ready(function() {
                $('.like').click(function() {
                    alert('like');

                });
            });
        </script> -->
        <form class="theForm" action="<?= base_url() ?>product/comment/<?= $product['id'] ?>" method="post">
            <div class="form-group mr-5 ml-5 mb-5">
                <label for="my-textarea">
                    <h5 class="card-title m-3"> ثبت نظر:</h5>
                </label>
                <input class="form-control mb-3" type="text" name="product_title" placeholder="موضوع متن خود را بنویسید" minlength="5" required>
                <textarea id="my-textarea" class="form-control" name="product_comment" rows="5" <?= is_null($auth) ? 'readonly  placeholder="برای درج نظر ابتدا با نام کاربری وارد شوید"' : '' ?>minlength="15" required></textarea>
                <button class="btn btn-primary mt-3 ml-2" type="submit">ارسال</button>
            </div>
        </form>
    <?php else : ?>
        <form id="theForm" action="<?= base_url() ?>product/comment/<?= $product['id'] ?>" method="post">
            <div class="form-group mr-5 ml-5 mb-5">
                <label for="my-textarea">
                    <h5 class="card-title m-3">اولین نفری باشید که در مورد این محصول نظر میدهد :</h5>
                </label>
                <input class="form-control mb-3" type="text" name="product_title" placeholder="موضوع متن خود را بنویسید" minlength="5" required>
                <textarea id="my-textarea" class="form-control" name="product_comment" rows="5"></textarea>
                <button class="btn btn-primary mt-3 ml-2" type="submit">ارسال</button>
            </div>
        </form>
    <?php endif; ?>

</div>
<?php include(BASEPATH . "/App/Views/Frontend/product/script.php") ?>