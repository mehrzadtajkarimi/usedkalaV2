<div class="card">
    <div class="card-header">
        <h5>ویرایش (( <?= $tag['tag'] ?> ))</h5>
    </div>
    <div class="card-body">
        <form action="<?= base_url() ?>admin/tag/<?= $tag['id'] ?>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="_method" value="patch" />
           
            <div class="form-group row">
                <label for="tag" class="col-sm-2 col-form-label">تگ</label>
                <div class="col-sm-10">
                    <input name="tag" type="text" class="form-control" id="tag" value="<?= $tag['tag'] ?? '' ?>" placeholder="نام زیر دسته را وارد نمایید" autofocus>
                </div>
            </div>
            


            <div class="form-group row">
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">ذخیره</button>
                    <a href="<?= base_url() ?>admin/tag" class="btn btn-danger">انصراف</a>
                </div>
            </div>
        </form>
    </div>
</div>
<?php include(BASEPATH . "/App/Views/Backend/tag/script.php") ?>