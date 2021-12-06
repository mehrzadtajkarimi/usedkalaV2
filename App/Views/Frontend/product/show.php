<div class="col-full">
    <div class="row">

        <div id="primary" class="content-area">
            <main id="main" class="site-main">
                <div class="product product-type-simple">
                    <div class="single-product-wrapper">
                        <div class="product-images-wrapper thumb-count-4" dir="ltr">
                            <div id="techmarket-single-product-gallery" class="techmarket-single-product-gallery techmarket-single-product-gallery--with-images techmarket-single-product-gallery--columns-4 images" data-columns="4">
                                <div class="techmarket-single-product-gallery-images" data-ride="tm-slick-carousel" data-wrap=".woocommerce-product-gallery__wrapper" data-slick="{&quot;infinite&quot;:false,&quot;slidesToShow&quot;:1,&quot;slidesToScroll&quot;:1,&quot;dots&quot;:false,&quot;arrows&quot;:false,&quot;asNavFor&quot;:&quot;#techmarket-single-product-gallery .techmarket-single-product-gallery-thumbnails__wrapper&quot;}">
                                    <div class="woocommerce-product-gallery woocommerce-product-gallery--with-images woocommerce-product-gallery--columns-4 images" data-columns="4">
                                        <!-- <a href="#" class="woocommerce-product-gallery__trigger">🔍</a> -->
                                        <figure class="woocommerce-product-gallery__wrapper ">
                                            <?php foreach ($photos as  $photo) : ?>
                                                <div data-thumb="<?= $photo['path']  ?>" class="woocommerce-product-gallery__image">
                                                    <a href="<?= $photo['path'] ?>" target="_blank" tabindex="<?= array_key_first($photos) == 0 ? 0 : -1 ?>">
                                                        <img width="600" height="600" src="<?= $photo['path']  ?>" class="attachment-shop_single size-shop_single <?= array_key_first($photos) == 0 ? "wp-post-image" : '' ?>" alt="<?= $photo['alt']  ?>">
                                                    </a>
                                                </div>
                                            <?php endforeach; ?>
                                        </figure>
                                    </div>
                                    <!-- .woocommerce-product-gallery -->
                                </div>
                                <!-- .techmarket-single-product-gallery-images -->
                                <div class="techmarket-single-product-gallery-thumbnails" style="position: absolute;right: 0;" data-ride="tm-slick-carousel" data-wrap=".techmarket-single-product-gallery-thumbnails__wrapper" data-slick="{&quot;infinite&quot;:false,&quot;slidesToShow&quot;:4,&quot;slidesToScroll&quot;:1,&quot;dots&quot;:false,&quot;arrows&quot;:true,&quot;vertical&quot;:true,&quot;verticalSwiping&quot;:true,&quot;focusOnSelect&quot;:true,&quot;touchMove&quot;:true,&quot;asNavFor&quot;:&quot;#techmarket-single-product-gallery .woocommerce-product-gallery__wrapper&quot;,&quot;responsive&quot;:[{&quot;breakpoint&quot;:765,&quot;settings&quot;:{&quot;vertical&quot;:false,&quot;horizontal&quot;:true,&quot;verticalSwiping&quot;:false,&quot;slidesToShow&quot;:4}}]}">
                                    <figure class="techmarket-single-product-gallery-thumbnails__wrapper">
                                        <?php foreach (array_reverse($photos) as $i => $photo) : ?>
                                            <figure data-thumb="<?= $photo['path'] ?>" class="techmarket-wc-product-gallery__image">
                                                <a href="#">
                                                    <img width="180" height="180" src="<?= $photo['path'] ?>" class="attachment-shop_thumbnail size-shop_thumbnail  <?= array_key_first($photos) == 0 ? "wp-post-image" : '' ?>" alt="">
                                                </a>
                                            </figure>
                                        <?php endforeach; ?>
                                    </figure>
                                    <!-- .techmarket-single-product-gallery-thumbnails__wrapper -->
                                </div>
                                <!-- .techmarket-single-product-gallery-thumbnails -->
                            </div>
                            <!-- .techmarket-single-product-gallery -->
                            <div class="usedkala_product_enlarge">
                                <div style="background-image: url(<?= $rootPath . "dj_products/" . $prophotoRow['ID'] . ".jpg" ?>)"></div>
                            </div>
                            <script type="text/javascript">
                                $(".techmarket-single-product-gallery-images").mouseenter(function() {
                                    clicked = 3
                                });
                                $(".usedkala_product_enlarge").mouseout(function() {
                                    clicked = 0
                                });
                            </script>
                        </div>
                        <!-- .product-images-wrapper -->
                        <div class="col summary entry-summary">
                            <div class="single-product-header">
                                <h1 class="product_title entry-title"><?= $product['seo_H1'] != "" ? $product['seo_H1'] : $product['title'] ?></h1>
                                <?php if ($product['seo_H1'] != "" && $product['title'] != "" && $product['seo_H1'] != $product['title']) echo '<h2 class="product_title entry-title">' . $product['title'] . '</h2>'; ?>
                            </div>
                            <div class="single-product-meta">
                                <div class="brand">
                                    <img alt="galaxy" class="img-fluid" width="180" height="180" src="<?= $brand['path'] ?>">
                                </div>
                                <?php if ($cats) : ?>
                                    <div class="cat-and-sku">
                                        دسته‌بندی:
                                        <span class="posted_in categories">
                                            <a rel="tag" href="<?= base_url() ?>Category/<?= $cats[0]['id'] ?>/<?= $cats[0]['slug'] ?>"><?= $cats[0]['name'] ?></a>
                                        </span>
                                    </div>
                                <?php endif; ?>
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
                                                <span class="woocommerce-Price-amount amount"><?= number_format($product['price']) ?> ریال</span>
                                            </del>
                                            <ins>
                                                <span class="woocommerce-Price-amount amount"><?= round($product['price'] / $product['discounts_percent'] - $product['price'], 0, PHP_ROUND_HALF_UP) ?>ریال</span>
                                            </ins>
                                        <?php else : ?>
                                            <ins>
                                                <span class="woocommerce-Price-amount amount"><?= number_format($product['price']) ?> ریال</span>
                                            </ins>
                                        <?php endif; ?>
                                    </p>
                                    <!-- .single-product-header -->
                                    <form action="<?= base_url() ?>cart/add/<?= $product['id'] ?>" enctype="multipart/form-data" method="post" class="cart">
                                        <input type="hidden" name="photo_path" value="<?= $photo['path']  ?>">
                                        <div class="quantity">
                                            <label for="quantity-input">تعداد</label>
                                            <input name="product_quantity" type="number" size="4" class="input-text qty text" title="Qty" value="1" id="quantity-input">
                                        </div>
                                        <!-- .quantity -->
                                        <button class="single_add_to_cart_button button alt" value="185" name="add-to-cart" type="submit">افزودن به سبد خرید</button>
                                    </form>
                                    <div class=" p-3 pointer">
                                        <?php if (!empty($wish_list)) : ?>
                                            <i class="wish_list_btn  fa fa-heart text-danger" data-id="<?= $product['id'] ?>" data-type="Product"></i>
                                        <?php else : ?>
                                            <i class="wish_list_btn  fa fa-heart-o" data-id="<?= $product['id'] ?>" data-type="Product"></i>
                                        <?php endif; ?>
                                    </div>
                                    <!-- .cart -->
                                    <a class="add-to-compare-link" href="compare.html">مقایسه</a>
                                </div>
                                <!-- .product-actions -->
                                <div class="card  border-0 pt-5">
                                    <div class="card-body">
                                        <p class="card-text"><?= $product['description'] ?></p>
                                    </div>
                                </div>
                                <?php foreach ($tags as $value) : ?>
                                    <div class="ml-4 mb-2">
                                        <small>
                                            <a href="<?= base_url() . 'tags/' . $value['id'] . '/products' ?>">#<?= $value['tag'] ?></a>
                                        </small>
                                    </div>
                                <?php endforeach; ?>
                            </div>
                        </div>
                        <!-- .product -->
                        <div>
                            <?php if(count($related_products)>0): ?>
                                <h3>محصولات مرتبط:</h3>
                                <div class="d-flex">
                                    <?php foreach ($related_products as $value) : ?>
                                        <?php if($value['id'] !== $product_id): ?>
                                            <a href="<?= base_url() ?>product/<?= $value['id'] ?>/<?= $value['slug'] ?>" class="ml-4 mb-2 text-center related-product-item">
                                                <img src="<?= $value['img_path'] ?>" alt="<?= $value['img_alt'] ?>" width="180" height="180" class="m-auto">
                                                <p><?= $value['title'] ?></p>
                                            </a>
                                        <?php endif; ?>
                                    <?php endforeach; ?>
                                </div>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </main>
            <!-- #main -->
        </div>

    </div>
</div>

<div class="col-full">
    <div class="row">
        <div class="content-area" style="width: 100%;">
            <hr>
            <?= App\Utilities\FlashMessage::show_message(); ?>
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
                            <span class="m-2 pointer dislike text-muted ">
                                <small class="count"><?= $value['dislike'] ?></small>
                                <i class="dislike_btn fa fa-thumbs-down fa-1x " data-id="<?= $value['id'] ?>" data-type="Product" title="کلیک کنید تا وضعیت تغییر کند"></i>
                            </span>
                            <span class="m-2 pointer like text-darkBrandController">
                                <small class="count"><?= $value['like'] ?></small>
                                <i class="like_btn fa fa-thumbs-up  fa-1x " data-id="<?= $value['id'] ?>" data-type="Product" title="کلیک کنید تا وضعیت تغییر کند"></i>
                            </span>
                        </span>
                    </div>
                <?php endforeach; ?>

                <form class="theForm" action="<?= base_url() ?>comment/Product/<?= $product['id'] ?>/<?= $product['slug'] ?>" method="post">
                    <div class="form-group mr-5 ml-5 mb-5">
                        <label for="my-textarea">
                            <h5 class="card-title m-3"> ثبت نظر:</h5>
                        </label>
                        <input class="form-control mb-3" type="text" name="title" placeholder="موضوع متن خود را بنویسید" minlength="5" required>
                        <textarea id="my-textarea" class="form-control" name="comment" rows="5" <?= is_null($auth) ? 'readonly  placeholder="برای درج نظر ابتدا با نام کاربری وارد شوید"' : '' ?>minlength="15" required></textarea>
                        <button class="btn btn-primary mt-3 ml-2" type="submit">ارسال</button>
                    </div>
                </form>
            <?php else : ?>
                <form id="theForm" action="<?= base_url() ?>comment/Product/<?= $product['id'] ?>/<?= $product['slug'] ?>" method="post">
                    <div class="form-group mr-5 ml-5 mb-5">
                        <label for="my-textarea">
                            <h5 class="card-title m-3">اولین نفری باشید که در مورد این محصول نظر میدهد :</h5>
                        </label>
                        <input class="form-control mb-3" type="text" name="title" placeholder="موضوع متن خود را بنویسید" minlength="5" required>
                        <textarea id="my-textarea" class="form-control" name="comment" rows="5"></textarea>
                        <button class="btn btn-primary mt-3 ml-2" type="submit">ارسال</button>
                    </div>
                </form>
            <?php endif; ?>
            <!--/div-->

        </div>
    </div>
</div>
<?php include(BASEPATH . "/App/Views/Frontend/product/script.php") ?>