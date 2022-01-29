<style>
    @media print {
        .noPrint {
            display: none;
        }
    }
</style>
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
                            آدرس<br>
                            خیابان<br>
                            تلفن : (۸۰۴) ۱۲۳-۵۴۳۲<br>
                            ایمیل : info@roocket.ir
                        </address>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-4 invoice-col">
                        <br>
                        <b>کد گزارش :</b> ۴F۳S۸J<br>
                        <b> از تاریخ :</b>
                        -----
                        <br>
                        <b> تا تاریخ :</b>
                        -----
                        <br>
                        <b>اکانت :</b> ۹۶۸-۳۴۵۶۷
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
                                    <th>جمع پرداختی</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($orders as $value): ?>
                                    <tr>
                                        <td>۱</td>
                                        <td><?= $value['user_full_name'] ?></td>
                                        <td><?= $value['note']??'---' ?></td>
                                        <td><?= $value['address'] ?> </td>
                                        <td><?= number_format($value['grand_total'] ) ?> </td>
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