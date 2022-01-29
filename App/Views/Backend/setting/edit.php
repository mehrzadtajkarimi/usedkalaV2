<div class="card">
    <div class="card-header">
        <h5>ویرایش (( <?= $setting['key'] ?> ))</h5>

    </div>
    <div class="card-body">
        <form action="<?= base_url() ?>admin/setting/<?= $setting['id'] ?>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="_method" value="patch" />
            <div class="form-group">
                <label for="key" class=" col-form-label"> کلید (فقط حروف انگلیسی) </label>
				<input name="key" type="text" class="form-control" id="key" value="<?= $setting['key'] ?? '' ?>" autofocus>
            </div>
            <div class="form-group ">
				<label for="value" class=" col-form-label"> مقدار </label>
				<input name="value" type="text" class="form-control" id="value" value="<?= $setting['value'] ?? '' ?>" placeholder="" required>
			</div>
            <div class="form-group row">
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">ذخیره</button>
                    <a href="<?= base_url() ?>admin/setting" class="btn btn-danger">انصراف</a>
                </div>
            </div>
        </form>
    </div>
</div>
<?php
include_once BASEPATH  . 'App/Views/Backend/layouts/include/ckeditor.php';
?>