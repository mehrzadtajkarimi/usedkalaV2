<script src='<?= asset_url() ?>Backend/plugins/ckeditor/ckeditor.js'></script>
<!-- <script src="//cdn.ckeditor.com/4.16.2/full/ckeditor.js"></script> -->
<div class="card-header">
    <h5>ایجاد بلاگ</h5>

</div>
<div class="card-body">
    <form action="<?= base_url() ?>admin/blog" method="post" enctype="multipart/form-data">
        <div class="row">

            <div class="form-group col">
                <label for="key" class=" col-form-label"> موضوع </label>
                <input name="key" type="text" class="form-control" id="key" placeholder="" required>
            </div>
            <div class="form-group col">
                <label for="slug" class=" col-form-label"> slug </label>
                <input name="slug" type="text" class="form-control" id="slug" placeholder="" required>
            </div>
        </div>
        <div class="row">

            <div class="form-group col-6">
                <label class=" col-form-label" for="blog-category"> دسته بندی</label>
                <select name='blog-category[]' id="blog-category" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                    <?php foreach ($categories as $value) : ?>
                        <option value="<?= $value['id'] ?>"><?= $value['name'] ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="form-group col-6">
                <label class=" col-form-label" for="blog-tag"> تگ</label>
                <select name='blog-tag[]' id="blog-tag" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                    <?php foreach ($tags as $value) : ?>
                        <option value="<?= $value['id'] ?>"><?= $value['tag'] ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
        </div>
        <div class="form-group ">
            <label for="image" class=" col-form-label">عکس</label>
            <div class="custom-file">
                <input name="image_blog" type="file" class="custom-file-input" id="image">
                <label class="custom-file-label" for="image">Choose file</label>
            </div>
        </div>
        <hr class="mt-5">
        <div class="row">
            <div class="form-group col">
                <label for="H1" class=" col-form-label">H1</label>
                <div class="">
                    <input name="seo-H1" type="text" class="form-control" id="H1" placeholder="ترجیحا بین 20 تا 70 کاراکتر" required>
                </div>
            </div>
            <div class="form-group col">
                <label for="Canonical" class="c col-form-label">Canonical</label>
                <div class="">
                    <input name="seo-canonical" type="text" class="form-control" id="Canonical" placeholder="لینک را وارد نمایی" required>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col">
                <label for="seo-robots" class="col-form-label">robots</label>
                <div class="">
                    <select name='seo-robot' id="robots" class="form-control ">
                        <?php foreach ($robots as $key => $value) : ?>
                            <option value="<?= $key ?>"><?= $value ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <div class="form-group col">
                <label for="title" class=" col-form-label">title</label>
                <div class="">
                    <input name="seo-title" type="text" class="form-control" id="title" placeholder="title را وارد نمایی" required>
                </div>
            </div>
        </div>
        <div class="form-group ">
            <label for="seo-description" class="col-form-label"> description </label>
            <div class="">
                <textarea name="seo-description" type="text" class="form-control" id="seo-description" placeholder="" rows="3" required></textarea>
            </div>
        </div>
        <hr class="mt-5">

        <div class="form-group ">
            <textarea name="value" id="textarea">Hello, World!</textarea>
        </div>

        <button type="submit" class="float-left btn btn-primary btn-block">ذخیره </button>
    </form>
</div>
</div>
<?php include(BASEPATH . "/App/Views/Backend/blog/script.php") ?>