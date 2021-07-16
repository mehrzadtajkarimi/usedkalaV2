<div class="card">
    <div class="card-header">
        <h5>ویرایش (( <?= $brands->name ?> ))</h5>

    </div>
    <div class="card-body">
        <form action="<?= base_url() ?>admin/brand/<?= $brands->id ?>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="_method" value="patch" />
            <div class="form-group row">
                <label for="inputEmail3" class="col-sm-2 col-form-label">نام</label>
                <div class="col-sm-10">
                    <input name="brand-name" type="text" class="form-control" id="inputEmail3" value="<?= $brands->name ?? '' ?>" placeholder="نام زیر دسته را وارد نمایید" autofocus>
                </div>
            </div>
            <div class="form-group row">
                <label for="inputPassword3" class="col-sm-2 col-form-label">sort</label>
                <div class="col-sm-10">
                    <input name="brand-sort" type="text" class="form-control" id="inputPassword3" value="<?= $brands->sort ?? '' ?>" placeholder="نامه دسته بندی جهت نمایش در url"">
                </div>
            </div>
            <?php if (is_null($photo['path'])) : ?>
                <div class=" form-group row">
                    <label for="sort" class="col-2 col-form-label">عکسdd</label>
                    <div class="col-10">
                        <div class="custom-file">
                            <input name="brand_image" type="file" class="custom-file-input" id="inputGroupFile04">
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
                                    <input name="brand_image" id="input-edit" type="file">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-success" data-dismiss="modal">تایید</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php include(BASEPATH . "views/backend/brand/script.php") ?>
                </div>
            <?php endif; ?>
            <div class="form-group row">
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">ذخیره</button>
                    <a href="<?= base_url() ?>admin/brand" class="btn btn-danger">انصراف</a>
                </div>
            </div>
        </form>
    </div>
</div>