<script src='<?= asset_url() ?>Backend/plugins/ckeditor/ckeditor.js'></script>
<div class="card">
    <div class="card-header">
        <h5>ویرایش مجوزها (( <?= $permission['name'] ?> ))</h5>
    </div>
    <div class="card-body">
        <form action="<?= base_url() ?>admin/permission/<?= $permission['id'] ?>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="_method" value="patch" />
            <div class="form-group row">
                <label for="inputEmail3" class="col-sm-2 col-form-label">نام</label>
                <div class="col-sm-10">
                    <input name="permission-name" type="text" class="form-control" id="inputEmail3" value="<?= $permission['name'] ?? '' ?>" placeholder="نام زیر دسته را وارد نمایید" autofocus>
                </div>
            </div>
            <div class="form-group row">
                <label for="permission-label" class="col-2 col-form-label"> label </label>
                <div class="col-10">
                    <input name="permission-label" type="text" class="form-control" id="permission-label" value="<?= $permission['label']  ?>" required>
                </div>
            </div>

            <hr>

            <div class="pt-2 pb-2 form-check row">
                <input name="permission-status" type="checkbox" value="1" class="form-check-input" id="permission-status" <?= $permission['status'] ?  'checked' : ''  ?>>
                <label class="form-check-label" for="permission-status">
                    وضعیت
                </label>
            </div>

            <div class="form-group row">
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">ذخیره</button>
                    <a href="<?= base_url() ?>admin/permission" class="btn btn-danger">انصراف</a>
                </div>
            </div>
        </form>
    </div>
</div>
<?php include(BASEPATH . "/App/Views/Backend/permission/script.php") ?>