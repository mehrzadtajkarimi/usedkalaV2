<div class="card-header">
    <h5>ایجاد صفحه درباره ما</h5>

</div>
<div class="card-body">
    <form action="<?= base_url() ?>admin/setting" method="post" enctype="multipart/form-data">
        <div class="form-group ">
            <label for="key" class=" col-form-label"> کلید (فقط حروف انگلیسی) </label>
            <input name="key" type="text" class="form-control" id="key" placeholder="" required>
        </div>
        <div class="form-group ">
            <label for="value" class=" col-form-label"> مقدار </label>
            <input name="value" type="text" class="form-control" id="value" placeholder="" required>
        </div>

        <div class="form-group "id="slug" style="display: none">
            <label for="slug" class=" col-form-label"> slug </label>
            <input name="slug" type="text" class="form-control"  placeholder="" >
        </div>
        <div class="form-group ">
            <textarea name="description" class="description " id="textarea"   ></textarea>
        </div>

        <div class="pt-1  form-check  ">
            <input value="1"  type="checkbox" class="form-check-input " id="show-slug" >
            <label class="check-label" for="show-slug">
                افزودن slug
            </label>
        </div>

        <!-- <div class="pt-1 form-check  ">
            <input value="1" name="show-description" type="checkbox" class="form-check-input " id="show-description" >
            <label class="check-label" for="show-description">
            افزودن توضیحات
            </label>
        </div> -->


        <button type="submit" class="float-left btn btn-primary btn-block">ذخیره </button>
    </form>
</div>
<?php
include(BASEPATH . "/App/Views/Backend/setting/script.php");
include_once BASEPATH  . 'App/Views/Backend/layouts/include/ckeditor.php';
?>