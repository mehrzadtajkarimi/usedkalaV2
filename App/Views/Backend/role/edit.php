<script src='<?= asset_url() ?>Backend/plugins/ckeditor/ckeditor.js'></script>
<div class="card">
    <div class="card-header">
        <h5>ویرایش نقش دستهها (( <?= $roles['title'] ?> ))</h5>
    </div>
    <div class="card-body">
        <form action="<?= base_url() ?>admin/role/<?= $roles['id'] ?>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="_method" value="patch" />
            <div class="form-group row">
                <label for="inputEmail3" class="col-sm-2 col-form-label">نام</label>
                <div class="col-sm-10">
                    <input name="role-name" type="text" class="form-control" id="inputEmail3" value="<?= $roles['title'] ?? '' ?>" placeholder="نام زیر دسته را وارد نمایید" autofocus>
                </div>
            </div>
            <div class="form-group row">
                <label for="role-slug" class="col-2 col-form-label"> slug </label>
                <div class="col-10">
                    <input name="role-slug" type="text" class="form-control" id="role-slug" value="<?= $roles['slug']  ?>" required>
                </div>
            </div>

            <div class="form-group row">
                <label for="role-price" class="col-2 col-form-label"> قیمت </label>
                <div class="col-10">
                    <input name="role-price" type="number" class="form-control" id="role-price" value="<?= $roles['price']  ?>" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="role-quantity" class="col-2 col-form-label"> موجودی </label>
                <div class="col-10">
                    <input name="role-quantity" type="number" class="form-control" id="role-quantity" value="<?= $roles['quantity']  ?>" required>
                </div>
            </div>

            <div class="form-group row">
                <label for="role-weight" class="col-2 col-form-label"> وزن </label>
                <div class="col-10">
                    <input name="role-weight" type="number" class="form-control" id="role-weight" value="<?= $roles['weight']  ?>" required>
                </div>
            </div>

            <div class="form-group row" title="شناسه منحصر به فرد نقش دستهها">
                <label for="role-sku" class="col-2 col-form-label"> SKU </label>
                <div class="col-10">
                    <input name="role-sku" type="text" class="form-control" id="role-sku" value="<?= $roles['sku']  ?>">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-2 col-form-label" for="role-category">دسته </label>
                <div class="col-10">
                    <select name='role-category[]' id="role_category" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                        <?php foreach ($categories as $key => $value) : ?>
                            <option value="<?= $value['id'] ?>" <?php if (isset($categories_selected[$value['id']])) echo 'selected'; ?>><?= $value['name'] ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-2 col-form-label" for="role-tag">تگ </label>
                <div class="col-10">
                    <select name='role-tag[]' id="role_tag" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                        <?php foreach ($tags as $key => $value) : ?>
                            <option value="<?= $value['id'] ?>" <?php if (isset($tags_selected[$value['id']])) echo 'selected'; ?>><?= $value['tag'] ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-2 col-form-label" for="role-brand">برند </label>
                <div class="col-10">
                    <select name='role-brand' class="form-control" id="role-brand">
                        <?php foreach ($brands as $value) : ?>
                            <option value="<?= $value['id'] ?>" <?= $roles['brand_id'] == $value['id'] ? 'selected' : '' ?>><?= $value['name'] ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>



            <div class="form-group row">
                <label for="role-meta" class="col-2 col-form-label"> متن متا</label>
                <div class="col-10">
                    <textarea name="role-meta" type="text" class="form-control" id="role-meta" rows="2" required><?= $roles['meta_title']  ?></textarea>
                </div>
            </div>
            <div class="form-group row">
                <label for="role-description" class="col-2 col-form-label"> درباره نقش دستهها </label>
                <div class="col-10">
                    <textarea name="role-description" type="text" class="form-control" id="role-description" rows="3" required><?= $roles['description']  ?></textarea>
                </div>
            </div>
            <hr>

            <div class="form-group row">
                <label for="H1" class="col-2 col-form-label">H1</label>
                <div class="col-10">
                    <input name="seo-H1" type="text" class="form-control" id="H1" value="<?= $roles['seo_H1'] ?>" placeholder="ترجیحا بین 20 تا 70 کاراکتر" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="Canonical" class="col-2 col-form-label">Canonical</label>
                <div class="col-10">
                    <input name="seo-canonical" type="text" class="form-control" id="Canonical" value="<?= $roles['seo_canonical'] ?>" placeholder="لینک را وارد نمایید">
                </div>
            </div>
            <div class="form-group row">
                <label for="robots" class="col-2 col-form-label">robots</label>
                <div class="col-10">
                    <select name='seo-robot' id="robots" class="form-control ">
                        <?php foreach ($robots as $key => $value) : ?>
                            <option value="<?= $key ?>" <?= $key == $roles['seo_robot'] ? 'selected' : '' ?>><?= $value ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label for="title" class="col-2 col-form-label">title</label>
                <div class="col-10">
                    <input name="seo-title" type="text" class="form-control" id="title" value="<?= $roles['seo_title'] ?>" placeholder="title را وارد نمایید" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="seo-description" class="col-2 col-form-label"> درباره نقش دستهها </label>
                <div class="col-10">
                    <textarea name="seo-description" type="text" class="form-control" id="seo-description" rows="3" required><?= $roles['seo_description'] ?></textarea>
                </div>
            </div>
            <hr>

            <?php if (empty($photo['path'])) : ?>
                <div class=" form-group row">
                    <label for="slug" class="col-2 col-form-label">عکس</label>
                    <div class="col-10">
                        <div class="custom-file">
                            <input name="role_image" type="file" class="custom-file-input" id="inputGroupFile04">
                            <label class="custom-file-label" for="inputGroupFile04">Choose file</label>
                        </div>
                    </div>
                </div>
            <?php else : ?>
                <div class="text-center">
                    <!-- Button trigger modal -->
                    <span type="button" class="btn w-50" data-toggle="modal" data-target="#form-modal-edit-photo" title="جهت ویرایش کلیک کتید">
                        <img id="img-edit" src="<?= $photo['path'] ?>" class="rounded img-fluid " data-img-name="" alt="<?= $photo['alt'] ?>" />
                    </span>
                    <!-- Modal -->
                    <div id="form-modal-edit-photo" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <input name="role_image" id="input-edit" type="file">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-success" data-dismiss="modal">تایید</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php include(BASEPATH . "App/Views/Backend/role/script.php") ?>
                </div>
            <?php endif; ?>
            <hr>

            <div class="pt-2 pb-2 form-check row">
                <input name="role-status" type="checkbox" class="form-check-input" id="role-status" <?= $roles['status'] ?  'checked' : ''  ?>>
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
<?php include(BASEPATH . "/App/Views/Backend/role/script.php") ?>