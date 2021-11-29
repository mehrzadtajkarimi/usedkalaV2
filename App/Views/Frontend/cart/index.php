<div id="content" class="site-content">
    <div class="col-full">
        <div class="row">
            <nav class="woocommerce-breadcrumb">
                <a href="<?= base_url() ?>">خانه</a>
                <span class="delimiter">
                    <i class="fa fa-arrow-left"></i>
                </span>
                سبد خرید
            </nav>
            <!-- .woocommerce-breadcrumb -->
            <div id="primary" class="content-area">
                <main id="main" class="site-main">
                    <div class="type-page hentry">
                        <div class="entry-content">
                            <div class="woocommerce">
                                <div class="cart-wrapper">
                                    <form method="post" action="<?= base_url() ?>order/create" class="woocommerce-cart-form order-form">
                                        <table class="shop_table shop_table_responsive cart ">
                                            <thead>
                                                <tr>
                                                    <th class="text-center product-remove">&nbsp;</th>
                                                    <th class="text-center product-thumbnail">&nbsp;</th>
                                                    <th class="text-center product-name">محصول</th>
                                                    <th class="text-center product-price">قیمت</th>
                                                    <th class="text-center product-quantity">تعداد</th>
                                                    <th class="text-center product-subtotal">قیمت کل</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php foreach ($cart_items as $value) : ?>
                                                    <tr class="text-center">
                                                        <td class="product-remove text-center ">
                                                            <a class="text-center remove" href="#">×</a>
                                                        </td>
                                                        <td class="product-thumbnail text-center ">
                                                            <a href="single-product-fullwidth.html text-center ">
                                                                <img width="180" height="180" alt="" class="wp-post-image" src="">
                                                            </a>
                                                        </td>
                                                        <td data-title="Product" class="product-name ">
                                                            <div class="media cart-item-product-detail ">
                                                                <a href="single-product-fullwidth.html ">
                                                                    <img width="180" height="180" alt="" class="wp-post-image" src="<?= $value['photo_path'] ?>">
                                                                </a>
                                                                <div class="media-body align-self-center ">
                                                                    <a href="<?= base_url() ?>product/<?= $value['id'] ?>"><?= $value['title'] ?></a>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td data-title="Price" class="product-price text-center ">
                                                            <span class="woocommerce-Price-amount amount">
                                                                <span class="woocommerce-Price-amount amount "><?= number_format($value['price']) ?> ریال</span>
                                                            </span>
                                                        </td>
                                                        <td class="product-quantity text-center " data-title="Quantity">
                                                            <div class="quantity row d-flex justify-content-center">
                                                                <span class="woocommerce-Price-amount amount  m-2" style="align-self: center">
                                                                    <span id="ss" class="woocommerce-Price-amount amount"><?= $value['count'] ?></span>
                                                                </span>
                                                                <div class="d-flex flex-column quantity ">
                                                                    <a href="<?= base_url() ?>cart/plus/<?= $value['id'] ?>" class="fa fa-chevron-up text-muted pr-4 pl-4 pt-4"></a>
                                                                    <a href="<?= base_url() ?>cart/minus/<?= $value['id'] ?>" class="fa fa-chevron-down text-muted pr-4 pl-4 pb-4 "></a>
                                                                    <!-- <span  data-href="<?= base_url() ?>cart/plus/<?= $value['id'] ?>" class="fa fa-chevron-up text-muted pr-4 pl-4 pt-4" ></span> -->
                                                                    <!-- <span  data-href="<?= base_url() ?>cart/minus/<?= $value['id'] ?>" class="fa fa-chevron-down text-muted pr-4 pl-4 pb-4 "></span> -->
                                                                </div>

                                                            </div>
                                                        </td>
                                                        <td data-title="Total" class="product-subtotal text-center ">
                                                            <span class="woocommerce-Price-amount amount">
                                                                <span class="woocommerce-Price-amount amount subtotal"><?= number_format($value['count'] * $value['price']) ?> ریال</span>
                                                            </span>
                                                            <a title="Remove this item" class="remove" href="<?= base_url() ?>cart/remove/<?= $value['id'] ?>">×</a>
                                                        </td>
                                                    </tr>
                                                <?php endforeach; ?>
                                            </tbody>
                                        </table>
                                        <!-- .shop_table shop_table_responsive -->
                                        <!-- .woocommerce-cart-form -->
                                        <div class="cart-collaterals">
                                            <div class="cart_totals">
                                                <h2>قیمت نهایی</h2>
                                                <table class="shop_table shop_table_responsive">
                                                    <tbody>
                                                        <tr class="cart-subtotal">
                                                            <th>مجموع کل</th>
                                                            <td data-title="Subtotal">
                                                                <span class="woocommerce-Price-amount amount"><?= number_format($cart_total) ?> ریال</span>
                                                            </td>
                                                        </tr>
                                                        <tr class="shipping">
                                                            <th>هزینه ارسال</th>
                                                            <td data-title="Shipping">۵۰۰،۰۰۰ ریال</td>
                                                        </tr>
                                                        <tr class="order-total">
                                                            <th>قیمت کل</th>
                                                            <td data-title="Total">
                                                                <strong>
                                                                    <span class="woocommerce-Price-amount amount"><?= number_format($cart_total + 500000) ?> ریال</span>
                                                                </strong>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <!-- .shop_table shop_table_responsive -->
                                                <div class="wc-proceed-to-checkout">
                                                    <div class="form-group">
                                                        <label for="order-notes">اطلاعات تکمیلی سفارش</label>
                                                        <textarea class="form-control" name="order-notes" id="order-notes" placeholder="اطلاعات تکمیلی سفارش"></textarea>
                                                    </div>
                                                    <div class='cart-buttons'>
                                                        <button type='submit' class='checkout-button button alt wc-forward'>ثبت سفارش</button>
                                                        <a class='back-to-shopping' href="<?= base_url('') ?>">ادامه خرید</a>
                                                    </div>
                                                </div>
                                                <!-- .wc-proceed-to-checkout -->
                                            </div>
                                            <!-- .cart_totals -->
                                        </div>
                                        <!-- .cart-collaterals -->
                                    </form>
                                </div>
                                <!-- .cart-wrapper -->
                            </div>
                            <!-- .woocommerce -->
                        </div>
                        <!-- .entry-content -->
                    </div>
                    <!-- .hentry -->
                </main>
                <!-- #main -->
            </div>
            <!-- #primary -->
        </div>
        <!-- .row -->
    </div>
    <!-- .col-full -->
</div>
<?php
include BASEPATH . "App/Views/Frontend/cart/script.php";
?>