<section class="content">
    <div class="col-full desktop-only">
        <div class="mt-4 row">
            <div class="col-2">
                <div class="card">
                    <div class="p-3 card-body">
                        <!-- <img src="" class="m-auto rounded-circle" alt="Cinque Terre"> -->


                        <!-- Button trigger modal -->
                        <span type="button" class="btn" data-toggle="modal" data-target="#form-modal-edit-photo" title="جهت ویرایش کلیک کتید">
                            <img id="img-edit" src="<?= $data['path'] ??  asset_url() . 'Frontend/images/users/user4-128x128.jpg' ?> " class="rounded img-fluid profile-img" data-img-name="" alt="<?= $data['alt'] ?? '' ?>" />
                        </span>
                        <!-- Modal -->
                        <div id="form-modal-edit-photo" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <input name="profile_image" id="input-edit" type="file">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-success" data-dismiss="modal">تایید</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <?php include(BASEPATH . "App/Views/Frontend/user/script.php") ?>



                        <div class="mt-3">
                            <div class="list-group list-group-flush">
                                <a href="<?= base_url() ?>profile" class="list-group-item list-group-item-action font-weight-bold">ویرایش پروفایل</a>
                                <a href="<?= base_url() ?>profile/orders" class="list-group-item list-group-item-action font-weight-bold">سفارش‌های من</a>
                                <a href="#" class="list-group-item list-group-item-action font-weight-bold">نظرات</a>
                                <a href="#" class="list-group-item list-group-item-action font-weight-bold">کارت های هدیه</a>
                                <a href="#" class="list-group-item list-group-item-action font-weight-bold">بازدید های اخیر</a>
                            </div>
                            <a href="<?= base_url() ?>logout" class="mt-5 btn btn-primary btn-lg active btn-block" role="button" aria-pressed="true">خروج</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-10">
                <h3>اطلاعات سفارش:</h3>
                <div>
                    <?php foreach ($order as $value) : ?>
                        <div>
                            <span>شماره سفارش: </span><span><?= $value['order_number'] ?></span>
                        </div>
                        <div>
                            <h6>اطلاعات  تحویل گیرنده سفارش</h6>
                            <div>
                                <span>نام و نام خانوادگی: </span><span><?= $value['user_full_name'] ?></span>
                            </div>
                            <div>
                                <span>شماره تماس: </span><span class="woocommerce-Price-amount amount"><?= $value['user_phone'] ?></span>
                            </div>
                            <div>
                                <span>آدرس: </span><span class="woocommerce-Price-amount amount"><?= $province['name'] ?>، <?= $city['name'] ?>، <?= $value['address'] ?></span>
                            </div>
                            <div>
                                <span>کد پستی: </span><span class="woocommerce-Price-amount amount"><?= $value['postal_code'] ?></span>
                            </div>
                        </div>
                        <div>
                            <span>تعداد اقلام سفارش: </span><span class="woocommerce-Price-amount amount"><?= $value['item_count'] ?></span>
                        </div>
                        <div>
                            <span>مبلغ کل سفارش: </span><span class="woocommerce-Price-amount amount"><?= number_format($value['grand_total']) ?> ریال</span>
                        </div>
                        <div>
                            <span>تخفیف کل سفارش: </span><span class="woocommerce-Price-amount amount"><?= number_format($value['discount_total']) ?> ریال</span>
                        </div>
                        <div>
                            <span>هزینه ارسال سفارش: </span><span class="woocommerce-Price-amount amount"><?= number_format($value['shipping_cost']) ?> ریال</span>
                        </div>
                        <div>
                            <span>اطلاعات تکمیلی سفارش: </span><span class="woocommerce-Price-amount amount"><?= $value['notes'] ?></span>
                        </div>
                    <?php endforeach; ?>
                </div>
                <div>
                    <table class="shop_table shop_table_responsive cart ">
                        <thead>
                            <tr>
                                <th class="text-center">&nbsp;</th>
                                <th class="text-center">نام محصول</th>
                                <th class="text-center">تعداد محصول</th>
                                <th class="text-center">قیمت واحد</th>
                                <th class="text-center">قیمت کل</th>
                                <th class="text-center">تخفیف</th>
                                <th class="text-center">&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($order_items as $value) : ?>
                                <tr class="text-center">
                                    <td>
                                        <img width="180" height="180" alt="" class="wp-post-image" src="<?= $value['img_path'] ?>" alt="<?= $value['img_alt'] ?>">
                                    </td>
                                    <td class="text-center amount">
                                        <?= $value['order_item_name'] ?>
                                    </td>
                                    <td class="text-center amount">
                                        <span class="woocommerce-Price-amount amount">
                                            <?= number_format($value['quantity']) ?>
                                        </span>
                                    </td>
                                    <td class="text-center">
                                        <span class="woocommerce-Price-amount amount">
                                            <?= number_format($value['price']) ?> ریال
                                        </span>
                                    </td>
                                    <td class="text-center">
                                        <span class="woocommerce-Price-amount amount">
                                            <?= number_format($value['price'] * $value['quantity']) ?> ریال
                                        </span>
                                    </td>
                                    <td class="text-center">
                                        <span class="woocommerce-Price-amount amount">
                                            <?= number_format($value['discount']) ?> ریال
                                        </span>
                                    </td>
                                    <td class="text-center">
                                        <a href="<?= base_url() ?>product/<?= $value['product_id'] ?>/<?= $value['slug'] ?>">
                                            مشاهده کالا
                                        </a>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>