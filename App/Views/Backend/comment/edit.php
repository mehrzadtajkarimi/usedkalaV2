<script src='<?= asset_url() ?>Backend/plugins/ckeditor/ckeditor.js'></script>
<div class="card">
    <div class="card-header">
        <h5>ویرایش (( <?= $comment['key'] ?> ))</h5>
    </div>
    <div class="card-body">
        <form action="<?= base_url() ?>admin/comment/<?= $comment['id'] ?>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="_method" value="patch" />
            <?php if (empty($photo['path'])) : ?>
                <div class=" form-group row">
                    <label for="slug" class="col-2 col-form-label">عکس</label>
                    <div class="col-10">
                        <div class="custom-file">
                            <input name="image_comment" type="file" class="custom-file-input" id="inputGroupFile04">
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
                                    <input name="image_comment" id="input-edit" type="file">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-success" data-dismiss="modal">تایید</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php include(BASEPATH . "App/Views/Backend/comment/script.php") ?>
                </div>
            <?php endif; ?>
            <div class="form-group row">
                <label for="key" class="col-sm-2 col-form-label">موضوع</label>
                <div class="col-sm-10">
                    <input name="key" type="text" class="form-control" id="key" value="<?= $comment['key'] ?? '' ?>" placeholder="نام زیر دسته را وارد نمایید" autofocus>
                </div>
            </div>
            <div class="form-group row">
                <label for="slug" class="col-sm-2 col-form-label"> slug </label>
                <div class="col-sm-10">
                    <input name="slug" type="text" class="form-control" id="slug" value="<?= $comment['slug'] ?? '' ?>" placeholder="" required>
                </div>
            </div>
            <div class="form-group ">
                <textarea name="value" id="textarea"><?= $comment['value'] ?></textarea>
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
<?php include(BASEPATH . "/App/Views/Backend/comment/script.php") ?>