<div class="card">
    <div class="card-header">
        <h5>ایجاد اشانتیون</h5>

    </div>
    <div class="card-body">

        <form action="<?= base_url() ?>admin/sample" method="post" class="p-1">
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
                        <label for="sample-title">موضوع</label>
                        <input name="sample-title" type="text" class="form-control" id="sample-title" placeholder="" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="form-group ">
                        <label for="sample-percent">میزان تخفیف %</label>
                        <input name="sample-percent" type="text" maxlength="3" class="form-control" id="sample-percent" placeholder="" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="form-group">
                        <label for="Input3" class=""> از مبلغ</label>
                        <input type="number" name="start_price" class="form-control " id="Input3" required>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <label for="Input4" class=""> تا مبلغ</label>
                        <input type="number" name="finish_price" class="form-control " id="Input4" disabled>
                    </div>
                </div>
            </div>
            <!-- <div class="col">
                <div class="form-group ">
                    <label> دسته بندی انتخابی</label>
                    <select name='sample-category[]' id="sample_category" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                        <?php foreach ($categories as $value) : ?>
                            <option value="<?= $value['id'] ?>"><?= $value['name'] ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div> -->
            <div class="col">
                <label>محصول انتخابی</label>
                <select name="sample-product[]" id="sample_product" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple" disabled>
                    <?php foreach ($products as $value) : ?>
                        <option value="<?= $value['id'] ?>"><?= $value['title'] ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="form-group">
                <label for="sample-description" class="col-form-label"> توضیحات</label>
                <textarea name="sample-description" type="text" class="form-control" id="sample-description" placeholder="" rows="2" required></textarea>
            </div>
            <div class="pt-1 pb-4 form-check disabled ">
                <input name="sample-status" type="checkbox" class="form-check-input " id="sample-status" checked>
                <label class="form-check-label" for="sample-status">
                    وضعیت
                </label>
            </div>
            <button type="submit" class="float-left btn btn-primary btn-block">ذخیره </button>
        </form>
    </div>
</div>
<?php include(BASEPATH . "/App/Views/Backend/sample/script.php") ?>