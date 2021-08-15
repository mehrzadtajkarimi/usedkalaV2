<div id="content" class="site-content">
    <div class="col-full">
        <div class="row">
            <nav class="woocommerce-breadcrumb">
                <a href="home-v1.html">خانه</a>
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
                                    <form method="post" action="#" class="woocommerce-cart-form">
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
                                                                    <a href="single-product-fullwidth.html "><?= $value['title'] ?></a>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td data-title="Price" class="product-price text-center ">
                                                            <span class="woocommerce-Price-amount amount">
                                                                <span class="woocommerce-Price-amount amount "><?= $value['price'] ?></span>
                                                            </span>
                                                        </td>
                                                        <td class="product-quantity text-center " data-title="Quantity">
                                                            <div class="quantity row d-flex justify-content-center">
                                                                <span class="woocommerce-Price-amount amount  m-2" style="align-self: center">
                                                                    <span id="quantity" class="woocommerce-Price-amount amount"><?= $value['count'] ?></span>
                                                                </span>
                                                                <div class="d-flex flex-column  ">
                                                                    <a id="plus" href="<?= base_url() ?>cart/plus/<?= $value['id'] ?>" class="fa fa-chevron-up text-muted   pl-3 pr-3 quantity wow " data-wow-iteration="2" aria-hidden="true"></a>
                                                                    <a id="minus" href="<?= base_url() ?>cart/minus/<?= $value['id'] ?>" class="fa fa-chevron-down text-muted   pl-3 pr-3 quantity wow " data-wow-iteration="2" aria-hidden="true"></a>
                                                                </div>
                                                                <script>
                                                                    new WOW().init();
                                                                </script>
                                                            </div>
                                                        </td>
                                                        <td data-title="Total" class="product-subtotal text-center ">
                                                            <span class="woocommerce-Price-amount amount">
                                                                <span class="woocommerce-Price-amount amount subtotal"><?= $value['count'] * $value['price'] ?></span>
                                                            </span>
                                                            <a title="Remove this item" class="remove" href="<?= base_url() ?>cart/remove/<?= $value['id'] ?>">×</a>
                                                        </td>
                                                    </tr>
                                                <?php endforeach; ?>
                                            </tbody>
                                        </table>
                                        <!-- .shop_table shop_table_responsive -->
                                    </form>
                                    <!-- .woocommerce-cart-form -->
                                    <div class="cart-collaterals">
                                        <div class="cart_totals">
                                            <h2>قیمت نهایی</h2>
                                            <table class="shop_table shop_table_responsive">
                                                <tbody>
                                                    <tr class="cart-subtotal">
                                                        <th>مجموع کل</th>
                                                        <td data-title="Subtotal">
                                                            <span class="woocommerce-Price-amount amount"><?= $cart_total ?></span>
                                                        </td>
                                                    </tr>
                                                    <tr class="shipping">
                                                        <th>هزینه ارسال</th>
                                                        <td data-title="Shipping">Flat rate</td>
                                                    </tr>
                                                    <tr class="order-total">
                                                        <th>قیمت کل</th>
                                                        <td data-title="Total">
                                                            <strong>
                                                                <span class="woocommerce-Price-amount amount"><?= $cart_total ?></span>
                                                            </strong>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <!-- .shop_table shop_table_responsive -->
                                            <div class="wc-proceed-to-checkout">


                                                <form action="<?= base_url('payment') ?>" method="post">
                                                    <div class='comments pay-type mb-4'>
                                                        <div>
                                                            <label for="pay-w">
                                                                <input type="radio" id="pay-w" name="payType" value='Wallet'> پرداخت کیف پول
                                                            </label>
                                                        </div>
                                                        <div>
                                                            <label for="pay-o">
                                                                <input type="radio" id="pay-o" name="payType" value='Online'> پرداخت آنلاین
                                                            </label>
                                                        </div>
                                                        <div>
                                                            <label for="pay-o">
                                                                <input type="radio" id="pay-o" name="payType" value='COD' checked> پرداخت در محل
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class='cart-buttons'>
                                                        <button type='submit' class='checkout-button button alt wc-forward'>پرداخت نهایی</button>
                                                        <a class='back-to-shopping' href="<?= base_url('') ?>">ادامه خرید</a>
                                                    </div>
                                                </form>
                                            </div>
                                            <!-- .wc-proceed-to-checkout -->
                                        </div>
                                        <!-- .cart_totals -->
                                    </div>
                                    <!-- .cart-collaterals -->
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