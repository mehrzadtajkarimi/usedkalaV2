<div class="card-header">
    <h5>ایجاد بلاگ</h5>

</div>
<div class="card-body">
    <form action="<?= base_url() ?>admin/order" method="post" enctype="multipart/form-data">
        <div class="row">

            <div class="form-group col">
                <label for="title" class=" col-form-label"> موضوع </label>
                <input name="title" type="text" class="form-control" id="title" placeholder="" required>
            </div>
            <div class="form-group col">
                <label for="slug" class=" col-form-label"> slug </label>
                <input name="slug" type="text" class="form-control" id="slug" placeholder="" required>
            </div>
        </div>
       

        <button type="submit" class="float-left btn btn-primary btn-block">ذخیره </button>
    </form>
</div>
</div>
<?php
include(BASEPATH . "/App/Views/Backend/order/script.php");
include_once BASEPATH  . 'App/Views/Backend/layouts/include/ckeditor.php';
?>