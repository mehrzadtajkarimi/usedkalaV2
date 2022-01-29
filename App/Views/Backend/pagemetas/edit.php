<div class="card">
    <div class="card-header">
        <h5>ویرایش متای «<?= $pageMeta['title'] ?>»</h5>

    </div>
    <div class="card-body">
        <form action="<?= base_url() ?>admin/pagemetas/<?= $pageMeta['id'] ?>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="_method" value="patch" />
			
            <div class="form-group row">
                <label for="key" class="col-sm-2 col-form-label">HTML Title</label>
                <div class="col-sm-10">
                    <input name="html_title" type="text" class="form-control" id="key" value="<?= $pageMeta['html_title'] ?? '' ?>" required autofocus>
                </div>
            </div>
			
            <div class="form-group row">
                <label for="slug" class="col-sm-2 col-form-label">HTML Description</label>
                <div class="col-sm-10">
                    <input name="html_desc" type="text" class="form-control" id="slug" value="<?= $pageMeta['html_desc'] ?? '' ?>" required>
                </div>
            </div>
			
            <div class="form-group row">
                <label for="slug" class="col-sm-2 col-form-label">Robots</label>
                <div class="col-sm-10">
                    <input name="robots" type="text" class="form-control" id="slug" value="<?= $pageMeta['robots'] ?? '' ?>" required>
                </div>
            </div>
			
            <div class="form-group row">
                <label for="slug" class="col-sm-2 col-form-label">Canonical</label>
                <div class="col-sm-10">
                    <input name="canonical" type="text" class="form-control" id="slug" value="<?= $pageMeta['canonical'] ?? '' ?>">
                </div>
            </div>
						
            <div class="form-group row">
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">ذخیره</button>
                    <a href="<?= base_url() ?>admin/pagemetas" class="btn btn-danger">انصراف</a>
                </div>
            </div>
			
        </form>
    </div>
</div>
<?php
include_once BASEPATH  . 'App/Views/Backend/layouts/include/ckeditor.php';
?>