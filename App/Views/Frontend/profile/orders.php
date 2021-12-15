<section class="content">
    <div class="col-full desktop-only">
        <?= App\Utilities\FlashMessage::show_message(); ?>
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
                <?php if (!empty($orders)) : ?>
                    <table class="shop_table shop_table_responsive cart ">
                        <thead>
                            <tr>
                                <th class="text-center">شماره سفارش</th>
                                <th class="text-center">تعداد اقلام سفارش داده شده</th>
                                <th class="text-center">قیمت کل</th>
                                <th class="text-center">وضعیت</th>
                                <th class="text-center">تاریخ ایجاد</th>
                                <th class="text-center">وضعیت / مشاهده</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($orders as $value) : ?>
                                <tr class="text-center">
                                    <td class="text-center amount">
                                        <?= $value['order_number'] ?>
                                    </td>
                                    <td class="text-center amount">
                                        <?= $value['item_count'] ?>
                                    </td>
                                    <td class="text-center">
                                        <span class="woocommerce-Price-amount amount">
                                            <?= number_format($value['grand_total']) ?> ریال
                                        </span>
                                    </td>
                                    <td class="text-center">
                                        <?php if ($value['status'] == 1) : ?>
                                            در حال بررسی
                                        <?php endif; ?>
                                        <?php if ($value['status'] == 2) : ?>
                                            ارسال شده
                                        <?php endif; ?>
                                        <?php if ($value['status'] == 3) : ?>
                                            تکمیل شده
                                        <?php endif; ?>
                                    </td>
                                    <td class="text-center">
                                        <span class="woocommerce-Price-amount amount">
                                            <?= $value['created_at'] ?>
                                        </span>
                                    </td>
                                    <td class="text-center">
                                        <?php if ($value['status'] == 4) : ?>
                                            <a class="btn btn-link" href="<?= base_url() ?>profile/orders/<?= $value['id'] ?>">
                                                مشاهده سفارش
                                            </a>
                                        <?php elseif($value['status'] == 3) : ?>
                                            <a class="btn btn-link" href="<?= base_url() ?>profile/orders/status/<?= $value['id'] ?>">
                                                تحویل گرفتم
                                            </a>
                                        <?php endif; ?>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                <?php else : ?>
                    <div class="alert alert-warning">
                        شما هنوز سفارشی به ثبت نرسانده اید.
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </div>
</section>