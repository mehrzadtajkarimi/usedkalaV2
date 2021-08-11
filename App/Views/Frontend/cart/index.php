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
                                        <table class="shop_table shop_table_responsive cart">
                                            <thead>
                                                <tr>
                                                    <th class="product-remove">&nbsp;</th>
                                                    <th class="product-thumbnail">&nbsp;</th>
                                                    <th class="product-name">محصول</th>
                                                    <th class="product-price">قیمت</th>
                                                    <th class="product-quantity">تعداد</th>
                                                    <th class="product-subtotal">قیمت کل</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="product-remove">
                                                        <a class="remove" href="#">×</a>
                                                    </td>
                                                    <td class="product-thumbnail">
                                                        <a href="single-product-fullwidth.html">
                                                            <img width="180" height="180" alt="" class="wp-post-image" src="single-product-fullwidth.html">
                                                        </a>
                                                    </td>
                                                    <td data-title="Product" class="product-name">
                                                        <div class="media cart-item-product-detail">
                                                            <a href="single-product-fullwidth.html">
                                                                <img width="180" height="180" alt="" class="wp-post-image" src="assets/images/products/1-1.jpg">
                                                            </a>
                                                            <div class="media-body align-self-center">
                                                                <a href="single-product-fullwidth.html">55" KU6470 6 Series UHD Crystal Colour HDR Smart TV</a>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td data-title="Price" class="product-price">
                                                        <span class="woocommerce-Price-amount amount">
                                                            <span class="woocommerce-Price-amount amount"> 9990000 ریال</span>
                                                        </span>
                                                    </td>
                                                    <td class="product-quantity" data-title="Quantity">
                                                        <div class="quantity">
                                                            <label for="quantity-input-1">Quantity</label>
                                                            <input id="quantity-input-1" type="number" name="cart[e2230b853516e7b05d79744fbd4c9c13][qty]" value="1" title="Qty" class="input-text qty text" size="4">
                                                        </div>
                                                    </td>
                                                    <td data-title="Total" class="product-subtotal">
                                                        <span class="woocommerce-Price-amount amount">
                                                            <span class="woocommerce-Price-amount amount"> 9990000 ریال</span>
                                                        </span>
                                                        <a title="Remove this item" class="remove" href="#">×</a>
                                                    </td>
                                                </tr>
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
                                                            <span class="woocommerce-Price-amount amount">
                                                                <span class="woocommerce-Price-amount amount"> 9990000 ریال</span>
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
                                                                <span class="woocommerce-Price-amount amount">
                                                                    <span class="woocommerce-Price-amount amount"> 9990000 ریال</span>
                                                            </strong>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <!-- .shop_table shop_table_responsive -->
                                            <div class="wc-proceed-to-checkout">


                                                <form action="<?= base_url('payment') ?>" method="post">
                                                    <div class='comments pay-type'>
                                                        <label for="pay-w">
                                                            <input type="radio" id="pay-w" name="payType" value='Wallet'> پرداخت کیف پول
                                                        </label>
                                                        &nbsp; &nbsp; &nbsp; &nbsp;
                                                        <label for="pay-o">
                                                            <input type="radio" id="pay-o" name="payType" value='Online' > پرداخت آنلاین
                                                        </label>
                                                        &nbsp; &nbsp; &nbsp; &nbsp;
                                                        <label for="pay-o">
                                                            <input type="radio" id="pay-o" name="payType" value='COD' checked> پرداخت در محل
                                                        </label>
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