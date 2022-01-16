<section class="content">
    <div class="col-full">
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


                        <!-- sidebar -->

                        <?php include(BASEPATH . "App/Views/Frontend/profile/layouts/sidebar.php") ?>

                        <!-- sidebar -->
                    </div>
                </div>
            </div>
            <div class="col-10">
                <h3 class="ukorderdetails_title">اطلاعات سفارش:</h3>
                <div class="ukorderdetails">
                    <?php foreach ($order as $value) : ?>
					<div>
						<div>
							<span>شماره سفارش: </span><span><?= $value['order_number'] ?></span>
						</div>
						<div>
							<span>تعداد اقلام سفارش: </span><span class="woocommerce-Price-amount amount"><?= $value['item_count'] ?></span>
						</div>
						<div class="text-danger">
							<span><b>مبلغ کل سفارش: </b></span><span><b class="woocommerce-Price-amount amount"><?= number_format($value['grand_total']) ?> ریال</b></span>
						</div>
						<?php /*
						<div>
							<span>تخفیف کل سفارش: </span><span class="woocommerce-Price-amount amount"><?= number_format($value['discount_total']) ?> ریال</span>
						</div> */ ?>
						<div>
							<span>هزینه ارسال سفارش: </span><span class="woocommerce-Price-amount amount"><?= number_format($value['shipping_cost']) ?> ریال</span>
						</div>
						<div>
							<span>توضیحات: </span><span class="woocommerce-Price-amount amount"><?= $value['notes'] ?></span>
						</div>
					</div>
					<div>
						<h6>اطلاعات تحویل گیرنده سفارش:</h6>
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
                    <?php endforeach; ?>
                </div>
                <div>
                    <table class="shop_table shop_table_responsive cart ukorderproducts">
                        <thead>
                            <tr>
                                <th class="text-center">&nbsp;</th>
                                <th class="text-center">نام محصول</th>
                                <th class="text-center">تعداد محصول</th>
                                <th class="text-center">قیمت واحد</th>
                                <th class="text-center">قیمت کل</th>
                                <th class="text-center">قیمت کل با کد تخفیف</th>
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
                                    <?php if (!empty($value['discount_code'])) : ?>

                                        <td class="text-center">
                                            <div>
                                                <small>
                                                    <del class="text-danger">
                                                        <?= number_format($value['price']) ?>
                                                    </del>
                                                </small>
                                                <div class="woocommerce-Price-amount amount">
                                                    <?= number_format($value['discount_code']) ?>
                                                </div>
                                            </div>
                                        </td>
                                    <?php else : ?>
                                        <td class="text-center">
                                            <span class="woocommerce-Price-amount amount">
                                                <?= number_format($value['price']) ?> ریال
                                            </span>
                                        </td>
                                    <?php endif; ?>
                                    <?php if (!empty($value['discount_code'])) : ?>
                                        <td class="text-center">
                                            <span class="woocommerce-Price-amount amount">
                                                <?= number_format($value['discount_code'] * $value['quantity']) ?> ریال
                                            </span>
                                        </td>
                                    <?php else : ?>
                                        <td class="text-center">
                                            <span class="woocommerce-Price-amount amount">
                                                <?= number_format($value['price'] * $value['quantity']) ?> ریال
                                            </span>
                                        </td>
                                    <?php endif; ?>
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