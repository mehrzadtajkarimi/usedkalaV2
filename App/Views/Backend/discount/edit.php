<div class="card">
    <div class="card-header">
        <h5>ویرایش تخفیف (( <?= $discount['code'] ?> ))</h5>
    </div>
    <div class="card-body">
        <form action="<?= base_url() ?>admin/discount/<?= $discount['id'] ?>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="_method" value="patch" />
            <div class="form-group row">
                <label for="Input1" class="col-sm-2"> شروع</label>
                <div class="col-4">
                    <input type="text" class="form-control start_at" id="Input1" value="<?= $discount['start_at'] ?>" style="width: 448px !important;" required>
                </div>
                <input type="hidden" id="start_at" name="start_at">
            </div>
            <div class="form-group row">
                <label for="Input2" class="col-sm-2"> پایان</label>
                <div class="col-4">
                    <input type="text" class="form-control finish_at" id="Input2" value="<?= $discount['finish_at'] ?>" style="width: 448px !important;" required>
                </div>
                <input type="hidden" id="finish_at" name="finish_at">
            </div>
            <div class="form-group row">
                <label for="inputEmail3" class="col-sm-2 col-form-label">کد</label>
                <div class="col-sm-10">
                    <input name="discount-code" type="text" class="form-control" id="inputEmail3" value="<?= $discount['code'] ?? '' ?>">
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="form-group row">
                        <label class="col-2 col-form-label" for="discount-percent">میزان تخفیف %</label>
                        <div class="col-10">
                            <input name="discount-percent" type="number" class="form-control" id="discount-percent" value="<?= $discount['percent'] ?? '' ?>" placeholder="" required>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="form-group row">
                    <label class="col-2 col-form-label"> دسته بندی انتخابی</label>
                    <div class="col-10">
                        <select name='discount-category[]' id="discount_category" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                            <?php foreach ($categories as $value) : ?>
                                <option value="<?= $value['id'] ?>" selected><?= $value['name'] ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="form-group row">
                    <label class="col-2 col-form-label">محصول انتخابی</label>
                    <div class="col-10">
                        <select name="discount-product[]" id="discount_product" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                            <?php foreach ($products as $value) : ?>
                                <option value="<?= $value['id'] ?>" selected><?= $value['title'] ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-group  row mb-5">
                <label for="discount-description" class="col-2  col-form-label"> توضیحات</label>
                <div class="col-10">
                    <textarea name="discount-description" type="text" class="form-control" id="discount-description" placeholder="" rows="2" required></textarea>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">ذخیره</button>
            <a href="<?= base_url() ?>admin/discount" class="btn btn-danger">انصراف</a>
        </form>
    </div>
</div>
<?php include(BASEPATH . "/App/Views/Backend/discount/script.php") ?>