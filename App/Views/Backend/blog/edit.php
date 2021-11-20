<script src='<?= asset_url() ?>Backend/plugins/ckeditor/ckeditor.js'></script>
<div class="card">
    <div class="card-header">
        <h5>ویرایش (( <?= $blog['key'] ?> ))</h5>
    </div>
    <div class="card-body">
        <form action="<?= base_url() ?>admin/blog/<?= $blog['id'] ?>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="_method" value="patch" />
            <?php if (empty($photo['path'])) : ?>
                <div class=" form-group row">
                    <label for="slug" class="col-2 col-form-label">عکس</label>
                    <div class="col-10">
                        <div class="custom-file">
                            <input name="image_blog" type="file" class="custom-file-input" id="inputGroupFile04">
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
                                    <input name="image_blog" id="input-edit" type="file">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-success" data-dismiss="modal">تایید</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php include(BASEPATH . "App/Views/Backend/blog/script.php") ?>
                </div>
            <?php endif; ?>
            <div class="form-group row">
                <label for="key" class="col-sm-2 col-form-label">موضوع</label>
                <div class="col-sm-10">
                    <input name="key" type="text" class="form-control" id="key" value="<?= $blog['key'] ?? '' ?>" placeholder="نام زیر دسته را وارد نمایید" autofocus>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-2  col-form-label" for="blog-category"> دسته بندی</label>
                <div class="col-10">
                    <select name='blog-category[]' id="blog-category" class="col-10 form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                        <?php foreach ($categories as $value) : ?>
                            <option value="<?= $value['id'] ?>" <?= isset($categories_selected[$value['id']]) ? 'selected' : '' ?>><?= $value['name'] ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-2  col-form-label" for="blog-tag"> تگ</label>
                <div class="col-10">
                    <select name='blog-tag[]' id="blog-tag" class=" form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                        <?php foreach ($tags as $value) : ?>
                            <option value="<?= $value['id'] ?>" <?= isset($tags_selected[$value['id']]) == $value['id'] ? 'selected' : '' ?>><?= $value['tag'] ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label for="slug" class="col-sm-2 col-form-label"> slug </label>
                <div class="col-sm-10">
                    <input name="slug" type="text" class="form-control" id="slug" value="<?= $blog['slug'] ?? '' ?>" placeholder="" required>
                </div>
            </div>
            <hr>

            <div class="form-group row">
                <label for="H1" class="col-2 col-form-label">H1</label>
                <div class="col-10">
                    <input name="seo-H1" type="text" class="form-control" id="H1" value="<?= $blog['seo_H1'] ?>" placeholder="ترجیحا بین 20 تا 70 کاراکتر" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="Canonical" class="col-2 col-form-label">Canonical</label>
                <div class="col-10">
                    <input name="seo-canonical" type="text" class="form-control" id="Canonical" value="<?= $blog['seo_canonical'] ?>" placeholder="لینک را وارد نمایید">
                </div>
            </div>
            <div class="form-group row">
                <label for="robots" class="col-2 col-form-label">robots</label>
                <div class="col-10">
                    <select name='seo-robot' id="robots" class="form-control ">
                        <?php foreach ($robots as $key => $value) : ?>
                            <option value="<?= $key ?>" <?= $key == $blog['seo_robot'] ? 'selected' : '' ?>><?= $value ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label for="title" class="col-2 col-form-label">title</label>
                <div class="col-10">
                    <input name="seo-title" type="text" class="form-control" id="title" value="<?= $blog['seo_title'] ?>" placeholder="title را وارد نمایید" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="seo-description" class="col-2 col-form-label"> درباره محصول </label>
                <div class="col-10">
                    <textarea name="seo-description" type="text" class="form-control" id="seo-description" rows="3" required><?= $blog['seo_description'] ?></textarea>
                </div>
            </div>
            <div class="form-group row">
                <label for="blog-meta" class="col-2 col-form-label"> متن متا</label>
                <div class="col-10">
                    <textarea name="blog-meta" type="text" class="form-control" id="blog-meta" placeholder="" rows="2" required><?= $blog['meta_title'] ?></textarea>
                </div>
            </div>
            <hr>
            <div class="form-group ">
                <textarea name="value" id="textarea"><?= $blog['value'] ?></textarea>
            </div>


            <div class="form-group row">
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">ذخیره</button>
                    <a href="<?= base_url() ?>admin/blog" class="btn btn-danger">انصراف</a>
                </div>
            </div>
        </form>
    </div>
</div>
<?php include(BASEPATH . "/App/Views/Backend/blog/script.php") ?>