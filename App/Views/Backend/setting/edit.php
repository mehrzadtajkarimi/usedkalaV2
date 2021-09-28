<div class="card">
    <div class="card-header">
        <h5>ویرایش (( <?= $setting->name ?> ))</h5>

    </div>
    <div class="card-body">
        <form action="<?= base_url() ?>admin/setting/<?= $setting->id ?>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="_method" value="patch" />
            <div class="form-group row">
                <label for="key" class="col-sm-2 col-form-label">موضوع</label>
                <div class="col-sm-10">
                    <input name="key" type="text" class="form-control" id="key" value="<?= $setting->name ?? '' ?>" placeholder="نام زیر دسته را وارد نمایید" autofocus>
                </div>
            </div>
            <div class="form-group row">
                <label for="slug" class="col-sm-2 col-form-label">slug</label>
                <div class="col-sm-10">
                    <input name="slug" type="text" class="form-control" id="slug" value="<?= $setting->name ?? '' ?>" placeholder="نام زیر دسته را وارد نمایید" autofocus>
                </div>
            </div>
            <div class="form-group ">
                <textarea name="value" id="mytextarea"><?= $setting->value ?></textarea>
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
<?php include(BASEPATH . "/App/Views/Backend/setting/script.php") ?>