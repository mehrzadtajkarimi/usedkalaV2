<script src='<?= asset_url() ?>Backend/plugins/ckeditor/ckeditor.js'></script>
<!-- <script src="//cdn.ckeditor.com/4.16.2/full/ckeditor.js"></script> -->
<div class="card-header">
    <h5>ایجاد بلاگ</h5>

</div>
<div class="card-body">
    <form action="<?= base_url() ?>admin/blog" method="post" enctype="multipart/form-data">
        <div class="form-group ">
            <label for="key" class=" col-form-label"> موضوع </label>
            <input name="key" type="text" class="form-control" id="key" placeholder="" required>
        </div>
        <div class="form-group ">
            <label for="slug" class=" col-form-label"> slug </label>
            <input name="slug" type="text" class="form-control" id="slug" placeholder="" required>
        </div>
        <div class="form-group ">
            <label for="image" class=" col-form-label">عکس</label>
            <div class="custom-file">
                <input name="image_blog" type="file" class="custom-file-input" id="image">
                <label class="custom-file-label" for="image">Choose file</label>
            </div>
        </div>
        <div class="form-group ">
            <textarea name="value" id="textarea">Hello, World!</textarea>
        </div>

        <button type="submit" class="float-left btn btn-primary btn-block">ذخیره </button>
    </form>
</div>
</div>
<?php include(BASEPATH . "/App/Views/Backend/blog/script.php") ?>