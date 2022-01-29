<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="callout callout-info noPrint">
                <h5><i class="fa fa-info"></i> نکته :</h5>
                این صفحه مناسب برای پرینت طراحی شده است برای تست روی دکمه پرینت کلیک کنید
            </div>


            <!-- Main content -->
            <div class="invoice p-3 mb-3">
                <!-- title row -->
                <div class="row">
                    <div class="col-12">
                        <h4>
                            <i class="fa fa-globe"></i> گزارش فروش
                            <small class="float-left">Date: <?= jdate('Y/m/d'); ?></small>
                        </h4>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- info row -->
                <div class="row invoice-info">
                    <div class="col-sm-4 invoice-col">
                        <address>
                            <strong>فروشگاه یوزد کالا</strong><br>
                            <b>آدرس : </b> <?= '---' ?>
                            <br>
                            <b>تــــلفن :</b> <?= $user["phone"] ?>
                            <br>
                            <b>ایــمیل :</b> <?= '---' ?>
                            <br>
                            <b>کد گزارش :</b> <?= substr(md5(mt_rand()), 0, 3) ?>
                        </address>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-4 invoice-col">
                        <br>
                        <b> از تـــــــاریخ :</b>
                        <?= jdate('l , j F Y   H:i:s ', $as); ?><br>
                        <b> تا تـــــــاریخ :</b>
                        <?= jdate('l , j F Y   H:i:s ', $to); ?><br>
                        <b>گزارشــــــگر :</b> <?= $user["first_name"] .  ' ' . $user["last_name"] ?>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->

                <!-- Table row -->
                <div class="row">
                    <div class="col-12 table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>تعداد</th>
                                    <th>نام کاربر</th>
                                    <th>توضیحات</th>
                                    <th>آدرس</th>
                                    <th>جمع تخفیف</th>
                                    <th>جمع پرداختی</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($orders as $value) : ?>
                                    <tr>
                                        <td>۱</td>
                                        <td><?= $value['user_full_name'] ?></td>
                                        <td><?= $value['note'] ?? '---' ?></td>
                                        <td><?= $value['address'] ?> </td>
                                        <td><?= number_format($value['discount_total'] ?? 0) ?> </td>
                                        <td><?= number_format($value['grand_total']) ?> </td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
                <!-- this row will not appear when printing -->
                <div class="row no-print">
                    <div class="col-12">
                        <button onclick="window.print();" class="btn btn-default"><i class="fa fa-print"></i> پرینت </button>
                        <a href="<?= base_url() ?>admin" class="btn btn-success float-left"> بازگشت
                        </a>
                        <button type="button" class="btn btn-primary float-left ml-2" style="margin-right: 5px;">
                            <i class="fa fa-download"></i> تولید PDF
                        </button>
                    </div>
                </div>
            </div>
            <!-- /.invoice -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</div>