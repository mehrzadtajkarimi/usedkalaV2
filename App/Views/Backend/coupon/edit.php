<div class="card">
    <div class="card-header">
        <h5>ویرایش تخفیف (( <?= $coupon['code'] ?> ))</h5>
    </div>
    <div class="card-body">
        <form action="<?= base_url() ?>admin/coupon/<?= $coupon['id'] ?>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="_method" value="patch" />
            <div class="form-group row">
                <label for="Input1" class="col-sm-2"> شروع</label>
                <div class="col-4">
                    <input type="text" class="form-control start_at" id="Input1" value="<?= $coupon['start_at'] ?>" style="width: 448px !important;" required>
                </div>
                <input type="hidden" id="start_at" name="start_at">
            </div>
            <div class="form-group row">
                <label for="Input2" class="col-sm-2"> پایان</label>
                <div class="col-4">
                    <input type="text" class="form-control finish_at" id="Input2" value="<?= $coupon['finish_at'] ?>" style="width: 448px !important;" required>
                </div>
                <input type="hidden" id="finish_at" name="finish_at">
            </div>
            <div class="form-group row">
                <label for="inputEmail3" class="col-sm-2 col-form-label">کد</label>
                <div class="col-sm-10">
                    <input name="coupon-code" type="text" class="form-control" id="inputEmail3" value="<?= $coupon['code'] ?>">
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="form-group row">
                        <label for="coupon-title" class="col-sm-2 col-form-label">موضوع</label>
                        <div class="col-sm-10">
                            <input name="coupon-title" type="text" class="form-control" id="coupon-title" value="<?= $coupon['title'] ?>" required>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="form-group row">
                        <label class="col-2 col-form-label" for="coupon-percent">میزان تخفیف %</label>
                        <div class="col-10">
                            <input name="coupon-percent" maxlength="3" type="text" class="form-control" id="coupon-percent" value="<?= $coupon['percent'] ?? '' ?>" placeholder="" required>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="form-group row">
                    <label class="col-2 col-form-label">محصول انتخابی</label>
                    <div class="col-10">
                        <select name="coupon-product[]" id="coupon_product" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                            <?php foreach ($products as $value) : ?>
                                <option value="<?= $value['id'] ?>" <?= in_array($value['id'], $products_selected) ? 'selected' : ''  ?>><?= $value['title'] ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>
            </div>
            <div class="mb-5 form-group row">
                <label for="coupon-description" class="col-2 col-form-label"> توضیحات</label>
                <div class="col-10">
                    <textarea name="coupon-description" type="text" class="form-control" id="coupon-description" placeholder="" rows="2" required><?= $coupon['description'] ?></textarea>
                </div>
            </div>
            <div class="pt-1 pb-4 form-check disabled ">
                <input name="coupon-status" type="checkbox" class="form-check-input " id="coupon-status" <?= $coupon['status'] == 1 ? 'checked' : ''  ?>>
                <label class="form-check-label" for="coupon-status">
                    وضعیت
                </label>
            </div>
            <button type="submit" class="btn btn-primary">ذخیره</button>
            <a href="<?= base_url() ?>admin/coupon" class="btn btn-danger">انصراف</a>
        </form>
    </div>
</div>
<?php include(BASEPATH . "/App/Views/Backend/coupon/script.php") ?>