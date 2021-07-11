<div class="card">
    <div class="card-header">
        <h5>ویرایش زیر دسته (( <?= $category['name'] ?> ))</h5>

    </div>
    <div class="card-body">



        <form action="<?= base_url() ?>admin/category/<?= $category['id'] ?>" method="post">
            <input type="hidden" name="_method" value="patch" />
            <div class="form-group row">
                <label for="inputEmail3" class="col-sm-2 col-form-label">نام</label>
                <div class="col-sm-10">
                    <input name="name" type="text" class="form-control" id="inputEmail3" placeholder="نام زیر دسته را وارد نمایید" autofocus>
                </div>
            </div>
            <div class="form-group row">

                <label for="inputPassword3" class="col-sm-2 col-form-label">slug</label>
                <div class="col-sm-10">
                    <input name="slug" type="text" class="form-control" id="inputPassword3" placeholder="نامه دسته بندی جهت نمایش در url"">
                </div>
            </div>
            <?php if (empty($photo['path'])) : ?>
                <div class=" form-group row">
                    <label for="slug" class="col-2 col-form-label">عکس</label>
                    <div class="col-10">
                        <div class="custom-file">
                            <input name="image" type="file" class="custom-file-input" id="inputGroupFile04">
                            <label class="custom-file-label" for="inputGroupFile04">Choose file</label>
                        </div>
                    </div>
                </div>
            <?php else : ?>
                <div class="text-center">
                    <img src="<?= $photo['path'] ?>" class="rounded img-fluid w-50" alt="<?= $photo['name'] ?>" />
                </div>
            <?php endif; ?>

            <div class="form-group row">
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">ذخیره</button>
                    <a href="<?= base_url() ?>admin/category" class="btn btn-danger">انصراف</a>
                </div>
            </div>
        </form>
    </div>
</div>