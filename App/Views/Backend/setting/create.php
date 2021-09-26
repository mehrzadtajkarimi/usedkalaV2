<script src='<?= asset_url() ?>Backend/plugins/tinymce/js/tinymce/tinymce.js'></script>
<div class="card-header">
    <h5>ایجاد تنظیمات</h5>

</div>
<div class="card-body">
    <form action="<?= base_url() ?>admin/setting" method="post" enctype="multipart/form-data">
        <div class="form-group ">
            <label for="key" class=" col-form-label"> موضوع </label>
            <input name="key" type="text" class="form-control" id="key" placeholder="" required>
        </div>
        <div class="form-group ">
            <label for="slug" class=" col-form-label"> slug </label>
            <input name="slug" type="text" class="form-control" id="slug" placeholder="" required>
        </div>
        <div class="form-group ">
            <textarea name="value" id="mytextarea">Hello, World!</textarea>
        </div>

        <button type="submit" class="float-left btn btn-primary btn-block">ذخیره </button>
    </form>
</div>
</div>
<?php include(BASEPATH . "/App/Views/Backend/setting/script.php") ?>