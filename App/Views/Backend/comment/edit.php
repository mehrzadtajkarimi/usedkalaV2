<div class="card">
    <div class="card-header">
        <h5>ویرایش (( <?= $comment['title'] ??'' ?> ))</h5>
    </div>
    <div class="card-body">
        <form action="<?= base_url() ?>admin/comment/<?= $comment['id'] ?>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="_method" value="patch" />
            <div class="form-group row">
                <label for="title" class="col-sm-2 col-form-label">موضوع</label>
                <div class="col-sm-10">
                    <input name="title" type="text" class="form-control" id="title" value="<?= $comment['title'] ?? '' ?>" placeholder="نام زیر دسته را وارد نمایید" autofocus>
                </div>
            </div>
            <div class="form-group ">
                <textarea name="message" id="textarea"><?= $comment['message'] ?? '' ?></textarea>
            </div>


            <div class="form-group row">
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">ذخیره</button>
                    <a href="<?= base_url() ?>admin/comment" class="btn btn-danger">انصراف</a>
                </div>
            </div>
        </form>
    </div>
</div>
<?php
include(BASEPATH . "/App/Views/Backend/comment/script.php");
include_once BASEPATH  . 'App/Views/Backend/layouts/include/ckeditor.php';
?>