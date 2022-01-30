<div class="card">
    <div class="card-header">
        <h5>ویرایش «<?= $staticPage['key'] ?>»</h5>

    </div>
    <div class="card-body">
        <form action="<?= base_url() ?>admin/staticpage/<?= $staticPage['id'] ?>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="_method" value="patch" />
            <div class="form-group row">
                <label for="key" class="col-sm-2 col-form-label">موضوع</label>
                <div class="col-sm-10">
                    <input name="key" type="text" class="form-control" id="key" value="<?= $staticPage['key'] ?? '' ?>" placeholder="نام زیر دسته را وارد نمایید" autofocus>
                </div>
            </div>
            <div class="form-group row">
                <label for="slug" class="col-sm-2 col-form-label">Slug</label>
                <div class="col-sm-10">
                    <input name="slug" type="text" class="form-control" id="slug" value="<?= $staticPage['slug'] ?? '' ?>" placeholder="" required>
                </div>
            </div>
			
            <div class="form-group row">
                <label for="html_title" class="col-sm-2 col-form-label">Html Title</label>
                <div class="col-sm-10">
                    <input name="html_title" type="text" class="form-control" id="html_title" value="<?= $staticPage['html_title'] ?? '' ?>" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="input_html_desc" class="col-sm-2 col-form-label">Html Description</label>
                <div class="col-sm-10">
                    <input name="html_desc" type="text" class="form-control" id="input_html_desc" value="<?= $staticPage['html_desc'] ?? '' ?>" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="input_robots" class="col-sm-2 col-form-label">Robots</label>
                <div class="col-sm-10">
                    <input name="robots" type="text" class="form-control" id="input_robots" value="<?= $staticPage['robots'] ?? '' ?>" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="input_canonical" class="col-sm-2 col-form-label">Canonical</label>
                <div class="col-sm-10">
                    <input name="canonical" type="text" class="form-control" id="input_canonical" value="<?= $staticPage['canonical'] ?? '' ?>">
                </div>
            </div>
			
            <div class="form-group ">
                <textarea name="value" id="textarea"><?= $staticPage['value'] ?></textarea>
            </div>
            <div class="form-group row">
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">ذخیره</button>
                    <a href="<?= base_url() ?>admin/staticpage" class="btn btn-danger">انصراف</a>
                </div>
            </div>
        </form>
    </div>
</div>
<?php
include_once BASEPATH  . 'App/Views/Backend/layouts/include/ckeditor.php';
?>