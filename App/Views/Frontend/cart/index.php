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
                                                                <a href="<?= base_url() ?>product/<?= $value['id'] ?>/<?= $value['title'] ?>">
                                                                    <img width="180" height="180" alt="" class="wp-post-image" src="<?= $value['photo_path'] ?>">
                                                                </a>
                                                                <div class="media-body align-self-center ">
                                                                    <a href="<?= base_url() ?>product/<?= $value['id'] ?>/<?= $value['title'] ?>"><?= $value['title'] ?></a>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td data-title="Price" class="product-price text-center ">
                                                            <span class="">
                                                                <?php if (in_array($value['id'], array_keys($discounts))) : ?>
                                                                    <div>
                                                                        <small>
                                                                            <del>
                                                                                <?= number_format($value['price']) ?>
                                                                            </del>
                                                                        </small>
                                                                        <span class="badge badge-pill badge-danger ">%
                                                                            <?= $discounts[$value['id']] ?>
                                                                        </span>
                                                                    </div>
                                                                    <span class="woocommerce-Price-amount amount">
                                                                        <span class="woocommerce-Price-amount amount ">
                                                                            <?= number_format($value['price'] - (($discounts[$value['id']] / 100) * $value['price'])) ?>ریال
                                                                        </span>
                                                                    </span>
                                                                <?php else : ?>
                                                                    <?= number_format($value['price']) ?> ریال
                                                                <?php endif; ?>
                                                            </span>
                                                        </td>
                                                        <td class=" text-center " data-title="Quantity">
                                                            <div class=" row d-flex justify-content-center">
                                                                <span class="woocommerce-Price-amount amount product-quantity-<?= $value['id'] ?> m-2" style="align-self: center">
                                                                    <span class=""><?= $value['count'] ?></span>
                                                                </span>

                                                                <div class="d-flex flex-column quantity ">
                                                                    <a href="<?= base_url() ?>cart/plus/<?= $value['id'] ?>" data-id="<?= $value['id'] ?>" class="fa fa-chevron-up text-muted pr-4 pl-4 pt-4"></a>
                                                                    <a href="<?= base_url() ?>cart/minus/<?= $value['id'] ?>" data-id="<?= $value['id'] ?>" class="fa fa-chevron-down text-muted pr-4 pl-4 pb-4 "></a>
                                                                </div>

                                                            </div>
                                                        </td>
                                                        <td data-title="Total" class="product-subtotal text-center ">
                                                            <?php if (in_array($value['id'], array_keys($discounts))) : ?>
                                                                <span class="woocommerce-Price-amount amount product-total-price-<?= $value['id'] ?>">
                                                                    <span class="woocommerce-Price-amount amount subtotal"><?= number_format($value['count'] * ($value['price'] - (($discounts[$value['id']] / 100) * $value['price']))) ?> ریال</span>
                                                                </span>
                                                            <?php else : ?>
                                                                <span class="woocommerce-Price-amount amount product-total-price-<?= $value['id'] ?>">
                                                                    <span class="woocommerce-Price-amount amount subtotal"><?= number_format($value['count'] * $value['price']) ?> ریال</span>
                                                                </span>
                                                            <?php endif; ?>
                                                            <a title="Remove this item" class="remove" href="<?= base_url() ?>cart/remove/<?= $value['id'] ?>">×</a>
                                                        </td>
                                                    </tr>
                                                <?php endforeach; ?>
                                            </tbody>
                                        </table>
                                        <!-- .shop_table shop_table_responsive -->
                                        <!-- .woocommerce-cart-form -->
                                        <div class="cart-collaterals">
                                            <?= App\Utilities\FlashMessage::show_message(); ?>
                                            <div class="cart_totals">
                                                <h2>قیمت نهایی</h2>
                                                <table class="shop_table shop_table_responsive">
                                                    <tbody>
                                                        <tr class="cart-subtotal">
                                                            <th>مجموع سبد خرید:</th>
                                                            <td data-title="Subtotal">
                                                                <span class="woocommerce-Price-amount amount"><?= number_format($cart_total) ?> ریال</span>
                                                            </td>
                                                        </tr>
                                                        <tr class="cart-subtotal">
                                                            <th> تخفیفات :</th>
                                                            <td data-title="Subtotal">
                                                                <span class="woocommerce-Price-amount amount subtotal"><?=  $cart_coupon ? $cart_coupon .'%':'0 ریال' ?></span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>هزینه ارسال:</th>
                                                            <td data-title="Shipping">۰ ریال</td>
                                                        </tr>
                                                        <tr>
                                                            <th>هزینه بسته بندی:</th>
                                                            <td data-title="Shipping">۰ ریال</td>
                                                        </tr>
                                                        <tr class="order-total">
                                                            <th>مجموع کل:</th>
                                                            <td data-title="Total">
                                                                <strong>
                                                                    <span class="woocommerce-Price-amount amount"><?= number_format($cart_total) ?> ریال</span>
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
                                    <form action="<?= base_url() ?>cart/has_coupon" method="post">
                                    <div class="card border-0" style="background-color: #f9f9f9;">
                                        <div class="card-body pt-4 pl-5 pr-5">
                                            <p class="card-text">

                                                <div class="row">
                                                    <div class="col-2">
                                                        <p>  کد تخفیف :</p>
                                                    </div>
                                                    <div class="col-7">
                                                        <div class="form-group">
                                                            <input name="has_coupon" type="text" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="col-3">
                                                        <button type='submit' class='btn btn-block bg-dark text-white'> بـررسـی کـد</button>
                                                    </div>
                                                </div>
                                            </p>
                                        </div>
                                    </div>
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