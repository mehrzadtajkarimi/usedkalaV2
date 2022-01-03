<div class="col-full products-row">
    <div class="row">
        <div id="primary" class="content-area">
            <main id="main" class="site-main">
                <div class="tab-content">
                    <div id="grid" class="tab-pane active" role="tabpanel">
                        <div class="woocommerce columns-7">
                            <div class="products">
                                <?php if (!empty($products)) : ?>
									<?php
									if (!isset($discounts) || !is_array($discounts))
										$discounts=[];
									$counter=0;
									foreach ($products as $value)
									{
										$counter++;
										if ($counter%7==1) $classStr=" first";
										else if ($counter%7==0) $classStr=" last";
										else $classStr="";
									?>
                                        <div class="product<?= $classStr ?>">
                                            <div class="yith-wcwl-add-to-wishlist">
                                                <a href="#" rel="nofollow" class="add_to_wishlist <?= in_array($value['id'], $selected_wishlist) ? 'active' : '' ?>" data-id="<?= $value['id'] ?>" data-type="Product"> افزودن به علاقه‌مندی‌ها</a>
                                            </div>
                                            <!-- .yith-wcwl-add-to-wishlist -->
                                            <a class="woocommerce-LoopProduct-link woocommerce-loop-product__link" href="<?= base_url() ?>product/<?= $value['id'] ?>/<?= $value['slug'] ?>">
                                                <img alt="<?= $value['alt'] ?>" class="attachment-shop_catalog size-shop_catalog wp-post-image uksquareimg" src="<?= $value['path'] ?>" width="224" height="197">
                                                <span class="price">
                                                    <?php if (in_array($value['id'], array_keys($discounts))) : ?>
                                                        <div>
                                                            <small>
                                                                <del>
                                                                    <?= number_format($value['price']) ?>
                                                                </del>
                                                            </small>
                                                            <span class="badge badge-pill badge-danger ">%<?= $discounts[$value['id']] ?></span>
                                                        </div>
                                                        <span class="woocommerce-Price-amount amount">
                                                            <p>
                                                                <?= $value['price'] - (($discounts[$value['id']] / 100) * $value['price']) ?>ریال
                                                            </p>
                                                        </span>
                                                    <?php else : ?>
                                                        <?= number_format($value['price']) ?> ریال
                                                    <?php endif; ?>
                                                </span>
                                                <h2 class="woocommerce-loop-product__title">
                                                    <?= $value['title'] ?>
                                                </h2>
                                            </a>
                                            <!-- .woocommerce-LoopProduct-link -->
                                            <div class="hover-area">
                                                <a href="<?= base_url() ?>cart/add/<?= $value['id'] ?>" class="button">افزودن به سبد خرید</a>
                                                <a class="add-to-compare-link" href="compare.html">مقایسه</a>
                                            </div>
                                            <!-- .hover-area -->
                                        </div>
                                    <?php
									}
									?>
                                <?php else : ?>
                                    <div class="alert alert-warning">محصولی یافت نشد </div>
                                <?php endif; ?>
                            </div>
                            <!-- .products -->
                        </div>
                        <!-- .woocommerce -->
                    </div>
                    <!-- .tab-pane -->
                    <div id="grid-extended" class="tab-pane" role="tabpanel">
                        <div class="woocommerce columns-7">
                            <div class="products">

                                <div class="product first">
                                    <div class="yith-wcwl-add-to-wishlist">
                                        <a href="wishlist.html" rel="nofollow" class="add_to_wishlist"> Add to Wishlist</a>
                                    </div>
                                    <!-- .yith-wcwl-add-to-wishlist -->
                                    <a class="woocommerce-LoopProduct-link woocommerce-loop-product__link" href="single-product-fullwidth.html">
                                        <img alt="" class="attachment-shop_catalog size-shop_catalog wp-post-image" src="" width="224" height="197">
                                        <span class="price">
                                            <span class="woocommerce-Price-amount amount">
                                                $۸۰۰.۰۰</span>
                                        </span>
                                        <h2 class="woocommerce-loop-product__title">Bluetooth on-ear PureBass Headphones</h2>
                                    </a>
                                    <!-- .woocommerce-LoopProduct-link -->
                                    <div class="techmarket-product-rating">
                                        <div title="Rated 5.00 out of 5" class="star-rating">
                                            <span style="width:100%">
                                                <strong class="rating">5.00</strong> out of 5</span>
                                        </div>
                                        <span class="review-count">(1)</span>
                                    </div>
                                    <!-- .techmarket-product-rating -->
                                    <span class="sku_wrapper">SKU:
                                        <span class="sku">5487FB8/13</span>
                                    </span>
                                    <div class="woocommerce-product-details__short-description">
                                        <ul>
                                            <li>Multimedia Speakers</li>
                                            <li>120 watts peak</li>
                                            <li>Front-facing subwoofer</li>
                                            <li>Refresh Rate: 120Hz (Effective)</li>
                                            <li>Backlight: LED</li>
                                            <li>Smart Functionality: Yes, webOS 3.0</li>
                                            <li>Dimensions (W x H x D): TV without stand: 43.5″ x 25.4″ x 3.0″, TV with stand: 43.5″ x 27.6″ x 8.5″</li>
                                            <li>Inputs: 3 HMDI, 2 USB, 1 RF, 1 Component, 1 Composite, 1 Optical, 1 RS232C, 1 Ethernet</li>
                                        </ul>
                                    </div>
                                    <!-- .woocommerce-product-details__short-description -->
                                    <a class="button product_type_simple add_to_cart_button" href="cart.html">Add to cart</a>
                                    <a class="add-to-compare-link" href="compare.html">Add to compare</a>
                                </div>

                            </div>
                            <!-- .products -->
                        </div>
                        <!-- .woocommerce -->
                    </div>
                    <!-- .tab-pane -->
                    <div id="list-view-large" class="tab-pane" role="tabpanel">
                        <div class="woocommerce columns-1">
                            <div class="products">
                                <div class="product list-view-large first ">
                                    <div class="media">
                                        <img alt="" class="attachment-shop_catalog size-shop_catalog wp-post-image" src="assets/images/products/1.jpg" width="224" height="197">
                                        <div class="media-body">
                                            <div class="product-info">
                                                <div class="yith-wcwl-add-to-wishlist">
                                                    <a href="wishlist.html" rel="nofollow" class="add_to_wishlist"> Add to Wishlist</a>
                                                </div>
                                                <!-- .yith-wcwl-add-to-wishlist -->
                                                <a class="woocommerce-LoopProduct-link woocommerce-loop-product__link" href="single-product-fullwidth.html">
                                                    <h2 class="woocommerce-loop-product__title">60UH6150 60-Inch 4K Ultra HD Smart LED TV</h2>
                                                    <div class="techmarket-product-rating">
                                                        <div title="Rated 5.00 out of 5" class="star-rating">
                                                            <span style="width:100%">
                                                                <strong class="rating">5.00</strong> out of 5</span>
                                                        </div>
                                                        <span class="review-count">(1)</span>
                                                    </div>
                                                </a>
                                                <!-- .woocommerce-LoopProduct-link -->
                                                <div class="brand">
                                                    <a href="#">
                                                        <img alt="galaxy" src="assets/images/brands/5.png">
                                                    </a>
                                                </div>
                                                <!-- .brand -->
                                                <div class="woocommerce-product-details__short-description">
                                                    <ul>
                                                        <li>CUJO smart firewall brings business-level Internet security to protect all of your home devices</li>
                                                        <li>Internet Security: Guard your network and smart devices against hacks, malware, and cyber threats</li>
                                                        <li>Mobile App: Monitor your wired and wireless network activity with a sleek iPhone or Android app</li>
                                                        <li>CUJO connects to your wireless router with an ethernet cable. CUJO is not compatible with Luma and does not support Google Wifi Mesh. CUJO works with Eero in Bridge mode.</li>
                                                    </ul>
                                                </div>
                                                <!-- .woocommerce-product-details__short-description -->
                                                <span class="sku_wrapper">SKU:
                                                    <span class="sku">5487FB8/13</span>
                                                </span>
                                            </div>
                                            <!-- .product-info -->
                                            <div class="product-actions">
                                                <div class="availability">
                                                    Availability:
                                                    <p class="stock in-stock">1000 in stock</p>
                                                </div>
                                                <span class="price">
                                                    <span class="woocommerce-Price-amount amount">
                                                        $۷۳۰.۰۰</span>
                                                </span>
                                                <!-- .price -->
                                                <a class="button add_to_cart_button" href="cart.html">Add to Cart</a>
                                                <a class="add-to-compare-link" href="compare.html">Add to compare</a>
                                            </div>
                                            <!-- .product-actions -->
                                        </div>
                                        <!-- .media-body -->
                                    </div>
                                    <!-- .media -->
                                </div>
                            </div>
                            <!-- .products -->
                        </div>
                        <!-- .woocommerce -->
                    </div>
                    <!-- .tab-pane -->
                    <div id="list-view" class="tab-pane" role="tabpanel">
                        <div class="woocommerce columns-1">
                            <div class="products">
                                <div class="product list-view last">
                                    <div class="media">
                                        <img alt="" class="attachment-shop_catalog size-shop_catalog wp-post-image" src="assets/images/products/1.jpg" width="224" height="197">
                                        <div class="media-body">
                                            <div class="product-info">
                                                <div class="yith-wcwl-add-to-wishlist">
                                                    <a href="wishlist.html" rel="nofollow" class="add_to_wishlist"> Add to Wishlist</a>
                                                </div>
                                                <!-- .yith-wcwl-add-to-wishlist -->
                                                <a class="woocommerce-LoopProduct-link woocommerce-loop-product__link" href="single-product-fullwidth.html">
                                                    <h2 class="woocommerce-loop-product__title">60UH6150 60-Inch 4K Ultra HD Smart LED TV</h2>
                                                    <div class="techmarket-product-rating">
                                                        <div title="Rated 5.00 out of 5" class="star-rating">
                                                            <span style="width:100%">
                                                                <strong class="rating">5.00</strong> out of 5</span>
                                                        </div>
                                                        <span class="review-count">(1)</span>
                                                    </div>
                                                </a>
                                                <!-- .woocommerce-LoopProduct-link -->
                                                <div class="brand">
                                                    <a href="#">
                                                        <img alt="galaxy" src="assets/images/brands/5.png">
                                                    </a>
                                                </div>
                                                <!-- .brand -->
                                                <div class="woocommerce-product-details__short-description">
                                                    <ul>
                                                        <li>CUJO smart firewall brings business-level Internet security to protect all of your home devices</li>
                                                        <li>Internet Security: Guard your network and smart devices against hacks, malware, and cyber threats</li>
                                                        <li>Mobile App: Monitor your wired and wireless network activity with a sleek iPhone or Android app</li>
                                                        <li>CUJO connects to your wireless router with an ethernet cable. CUJO is not compatible with Luma and does not support Google Wifi Mesh. CUJO works with Eero in Bridge mode.</li>
                                                    </ul>
                                                </div>
                                                <!-- .woocommerce-product-details__short-description -->
                                            </div>
                                            <!-- .product-info -->
                                            <div class="product-actions">
                                                <div class="availability">
                                                    Availability:
                                                    <p class="stock in-stock">1000 in stock</p>
                                                </div>
                                                <span class="price">
                                                    <span class="woocommerce-Price-amount amount">
                                                        $۷۳۰.۰۰</span>
                                                </span>
                                                <!-- .price -->
                                                <a class="button add_to_cart_button" href="cart.html">Add to Cart</a>
                                                <a class="add-to-compare-link" href="compare.html">Add to compare</a>
                                            </div>
                                            <!-- .product-actions -->
                                        </div>
                                        <!-- .media-body -->
                                    </div>
                                    <!-- .media -->
                                </div>
                            </div>
                            <!-- .products -->
                        </div>
                        <!-- .woocommerce -->
                    </div>
                    <!-- .tab-pane -->
                    <div id="list-view-small" class="tab-pane" role="tabpanel">
                        <div class="woocommerce columns-1">
                            <div class="products">
                                <div class="product list-view-small ">
                                    <div class="media">
                                        <img alt="" class="attachment-shop_catalog size-shop_catalog wp-post-image" src="assets/images/products/1.jpg" width="224" height="197">
                                        <div class="media-body">
                                            <div class="product-info">
                                                <div class="yith-wcwl-add-to-wishlist">
                                                    <a href="wishlist.html" rel="nofollow" class="add_to_wishlist"> Add to Wishlist</a>
                                                </div>
                                                <!-- .yith-wcwl-add-to-wishlist -->
                                                <a class="woocommerce-LoopProduct-link woocommerce-loop-product__link" href="single-product-fullwidth.html">
                                                    <h2 class="woocommerce-loop-product__title">60UH6150 60-Inch 4K Ultra HD Smart LED TV</h2>
                                                    <div class="techmarket-product-rating">
                                                        <div title="Rated 5.00 out of 5" class="star-rating">
                                                            <span style="width:100%">
                                                                <strong class="rating">5.00</strong> out of 5</span>
                                                        </div>
                                                        <span class="review-count">(1)</span>
                                                    </div>
                                                </a>
                                                <!-- .woocommerce-LoopProduct-link -->
                                                <div class="woocommerce-product-details__short-description">
                                                    <ul>
                                                        <li>CUJO smart firewall brings business-level Internet security to protect all of your home devices</li>
                                                        <li>Internet Security: Guard your network and smart devices against hacks, malware, and cyber threats</li>
                                                        <li>Mobile App: Monitor your wired and wireless network activity with a sleek iPhone or Android app</li>
                                                        <li>CUJO connects to your wireless router with an ethernet cable. CUJO is not compatible with Luma and does not support Google Wifi Mesh. CUJO works with Eero in Bridge mode.</li>
                                                    </ul>
                                                </div>
                                                <!-- .woocommerce-product-details__short-description -->
                                            </div>
                                            <!-- .product-info -->
                                            <div class="product-actions">
                                                <span class="price">
                                                    <span class="woocommerce-Price-amount amount">
                                                        $۷۳۰.۰۰</span>
                                                </span>
                                                <!-- .price -->
                                                <a class="button add_to_cart_button" href="cart.html">Add to Cart</a>
                                                <a class="add-to-compare-link" href="compare.html">Add to compare</a>
                                            </div>
                                            <!-- .product-actions -->
                                        </div>
                                        <!-- .media-body -->
                                    </div>
                                    <!-- .media -->
                                </div>
                            </div>
                            <!-- .products -->
                        </div>
                        <!-- .woocommerce -->
                    </div>
                    <!-- .tab-pane -->
                </div>
                <!-- .tab-content -->
                <?php /*
                    <div class="shop-control-bar-bottom">
                        <form class="form-techmarket-wc-ppp" method="POST">
                            <select class="techmarket-wc-wppp-select c-select" onchange="this.form.submit()" name="ppp">
                                <option value="20">Show 20</option>
                                <option value="40">Show 40</option>
                                <option value="-1">Show All</option>
                            </select>
                            <input type="hidden" value="5" name="shop_columns">
                            <input type="hidden" value="15" name="shop_per_page">
                            <input type="hidden" value="right-sidebar" name="shop_layout">
                        </form>
                        <!-- .form-techmarket-wc-ppp -->
                        <p class="woocommerce-result-count">
                            Showing 1–15 of 73 results
                        </p>
                        <!-- .woocommerce-result-count -->
                        <nav class="woocommerce-pagination">
                            <ul class="page-numbers">
                                <li>
                                    <span class="page-numbers current">1</span>
                                </li>
                                <li><a href="#" class="page-numbers">2</a></li>
                                <li><a href="#" class="page-numbers">3</a></li>
                                <li><a href="#" class="page-numbers">4</a></li>
                                <li><a href="#" class="page-numbers">5</a></li>
                                <li><a href="#" class="next page-numbers">→</a></li>
                            </ul>
                            <!-- .page-numbers -->
                        </nav>
                        <!-- .woocommerce-pagination -->
                    </div>
                    <!-- .shop-control-bar-bottom -->
                */ ?>
            </main>

        </div>
    </div>
</div>
<?php include(BASEPATH . "/App/Views/Frontend/product/script.php") ?>