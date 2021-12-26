<div class="card">
    <div class="card-header">
        <h5>ایجاد کد تخفیف</h5>

    </div>
    <div class="card-body">

        <form action="<?= base_url() ?>admin/coupon" method="post" class="p-1">
            <input type="hidden" name="code" value="<?= rand(100000, 999999) ?>">
            <div class="row">
                <div class="col">
                    <div class="form-group">
                        <label for="Input1" class=""> شروع</label>
                        <input type="text" class="form-control start_at" id="Input1" required>
                        <input type="hidden" id="start_at" name="start_at">
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <label for="Input2" class=""> پایان</label>
                        <input type="text" class="form-control finish_at" id="Input2" required>
                        <input type="hidden" id="finish_at" name="finish_at">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="form-group ">
                        <label for="coupon-title">موضوع</label>
                        <input name="coupon-title" type="text" class="form-control" id="coupon-title" placeholder="" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="form-group ">
                        <label for="coupon-percent">میزان تخفیف %</label>
                        <input name="coupon-percent" type="text" maxlength="3" class="form-control" id="coupon-percent" placeholder="" required>
                    </div>
                </div>
            </div>
            <div class="col">
                <label>محصول انتخابی</label>
                <select name="coupon-product[]" id="coupon_product" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                    <?php foreach ($products as $value) : ?>
                        <option value="<?= $value['id'] ?>"><?= $value['title'] ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="form-group">
                <label for="coupon-description" class="col-form-label"> توضیحات</label>
                <textarea name="coupon-description" type="text" class="form-control" id="coupon-description" placeholder="" rows="2" required></textarea>
            </div>
            <div class="pt-1 pb-4 form-check disabled ">
                <input value="1" name="coupon-status" type="checkbox" class="form-check-input " id="coupon-status" checked>
                <label class="form-check-label" for="coupon-status">
                    وضعیت
                </label>
            </div>
            <button type="submit" class="float-left btn btn-primary btn-block">ذخیره </button>
        </form>
    </div>
</div>
<?php include(BASEPATH . "/App/Views/Backend/coupon/script.php") ?>