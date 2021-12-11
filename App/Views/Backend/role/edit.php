<div class="card">
    <div class="card-header">
        <h5>ویرایش نقش ها (( <?= $role['name'] ?> ))</h5>
    </div>
    <div class="card-body">
        <form action="<?= base_url() ?>admin/role/<?= $role['id'] ?>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="_method" value="patch" />
            <div class="form-group row">
                <label for="role-name" class="col-2 col-form-label"> نام </label>
                <div class="col-10">
                    <input name="role-name" value="<?= $role['name'] ?>" type="text" class="form-control" id="role-name" placeholder="" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="role-name" class="col-2 col-form-label"> توضیح </label>
                <div class="col-10">
                    <input name="role-label" value="<?= $role['label'] ?>" type="text" class="form-control" id="role-name" placeholder="" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-2 col-form-label" for="role_permission"> سطوح دسترسی</label>
                <div class="col-10">
                    <select name='role-permission[]' id="role_permission" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                        <?php foreach ($permissions as $value) : ?>
                            <option value="<?= $value['id'] ?>" <?= isset($permissions_selected[$value['id']]) ? 'selected' : '' ?>><?= $value['name'] ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <hr>
            <div class="pt-2 pb-2 form-check disabled ">
                <input name="role-status" type="checkbox" class="form-check-input " id="role-status" checked disabled>
                <label class="form-check-label" for="role-status">
                    وضعیت
                </label>
            </div>

            <div class="form-group row">
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">ذخیره</button>
                    <a href="<?= base_url() ?>admin/role" class="btn btn-danger">انصراف</a>
                </div>
            </div>
        </form>
    </div>
</div>
<?php
include(BASEPATH . "/App/Views/Backend/role/script.php");
include_once BASEPATH  . 'App/Views/Backend/layouts/include/ckeditor.php';
?>