<div class="card">
    <div class="card-header">
        <h5>ویرایش تخفیف (( <?= $cart['code'] ?> ))</h5>
    </div>
    <div class="card-body">
        <form action="<?= base_url() ?>admin/cart/<?= $cart['id'] ?>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="_method" value="patch" />
            <div class="form-group row">
                <label for="Input1" class="col-sm-2"> شروع</label>
                <div class="col-4">
                    <input type="text" class="form-control start_at" id="Input1" value="<?= $cart['start_at'] ?>" style="width: 448px !important;" required>
                </div>
                <input type="hidden" id="start_at" name="start_at">
            </div>
            <div class="form-group row">
                <label for="Input2" class="col-sm-2"> پایان</label>
                <div class="col-4">
                    <input type="text" class="form-control finish_at" id="Input2" value="<?= $cart['finish_at'] ?>" style="width: 448px !important;" required>
                </div>
                <input type="hidden" id="finish_at" name="finish_at">
            </div>
            <div class="form-group row">
                <label for="inputEmail3" class="col-sm-2 col-form-label">کد</label>
                <div class="col-sm-10">
                    <input name="cart-code" type="text" class="form-control" id="inputEmail3" value="<?= $cart['code'] ?>">
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="form-group row">
                        <label for="cart-title" class="col-sm-2 col-form-label">موضوع</label>
                        <div class="col-sm-10">
                            <input name="cart-title" type="text" class="form-control" id="cart-title" value="<?= $cart['title'] ?>" required>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="form-group row">
                        <label class="col-2 col-form-label" for="cart-percent">میزان تخفیف %</label>
                        <div class="col-10">
                            <input name="cart-percent" maxlength="3" type="text" class="form-control" id="cart-percent" value="<?= $cart['percent'] ?? '' ?>" placeholder="" required>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="form-group row">
                    <label class="col-2 col-form-label"> دسته بندی انتخابی</label>
                    <div class="col-10">
                        <select name='cart-category[]' id="cart_category" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                            <?php foreach ($categories as $value) : ?>
                                <option value="<?= $value['id'] ?>" <?= in_array($value['id'], $categories_selected) ? 'selected' : ''  ?>><?= $value['name'] ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="form-group row">
                    <label class="col-2 col-form-label">محصول انتخابی</label>
                    <div class="col-10">
                        <select name="cart-product[]" id="cart_product" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                            <?php foreach ($products as $value) : ?>
                                <option value="<?= $value['id'] ?>" <?= in_array($value['id'], $products_selected) ? 'selected' : ''  ?>><?= $value['title'] ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>
            </div>
            <div class="mb-5 form-group row">
                <label for="cart-description" class="col-2 col-form-label"> توضیحات</label>
                <div class="col-10">
                    <textarea name="cart-description" type="text" class="form-control" id="cart-description" placeholder="" rows="2" required><?= $cart['description'] ?></textarea>
                </div>
            </div>
            <div class="pt-1 pb-4 form-check disabled ">
                <input name="cart-status" type="checkbox" class="form-check-input " id="cart-status" <?= $cart['status'] == 1 ? 'checked' : ''  ?>>
                <label class="form-check-label" for="cart-status">
                    وضعیت
                </label>
            </div>
            <button type="submit" class="btn btn-primary">ذخیره</button>
            <a href="<?= base_url() ?>admin/cart" class="btn btn-danger">انصراف</a>
        </form>
    </div>
</div>
<?php include(BASEPATH . "/App/Views/Backend/cart/script.php") ?>