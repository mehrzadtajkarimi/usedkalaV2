<div class="card">
    <div class="card-header">
        <h5>ویرایش اسلایدر (( <?= $slider['small_text'] ?> ))</h5>
    </div>
    <div class="card-body">
        <form action="<?= base_url() ?>admin/slider/<?= $slider['id'] ?>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="_method" value="patch" />
            <div class="row">
                <div class="col">
                    <div class="form-group ">
                        <label for="slider-small">خلاصه مطلب</label>
                        <textarea name="slider-small" type="text" class="form-control" id="slider-small" rows="1" placeholder="" required><?= $slider['small_text'] ?> </textarea>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <?php if (empty($photo['path'])) : ?>
                        <div class="form-group ">
                            <label for="slug" class="col-form-label">عکس</label>
                            <div class="card-block row">
                                <div class="flex-row d-flex w-100 " id="coba"></div>
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
                                            <input name="product_image" id="input-edit" type="file">
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-success" data-dismiss="modal">تایید</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php include(BASEPATH . "App/Views/Backend/slider/script.php") ?>
                        </div>
                    <?php endif; ?>
                </div>
                <div class="col">
                    <div class="form-group">
                        <label for="slider-description" class="col-form-label"> متن مطلب</label>
                        <textarea name="slider-description" type="text" class="form-control" id="slider-description" placeholder="" rows="7" required><?= $slider['description'] ?></textarea>
                    </div>
                </div>
            </div>
            <div class="form-group ">
                <label> دسته بندی انتخابی</label>
                <select name='category_id' id="slider_category" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                    <?php foreach ($categories as $value) : ?>
                        <option value="<?= $value['id'] ?>" <?= $slider['category_id'] == $value['id'] ? 'selected' : '' ?>><?= $value['name'] ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="form-group ">
                <label>محصول </label>
                <select name='product_id' id="slider_product" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                    <?php foreach ($products as $value) : ?>
                        <option value="<?= $value['id'] ?>" <?= $slider['product_id'] == $value['id'] ? 'selected' : '' ?>><?= $value['name'] ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="form-check row pt-2 pb-2">
                <input name="product-status" type="checkbox" class="form-check-input" id="product-status" <?= $slider['status'] ?  'checked' : ''  ?>>
                <label class="form-check-label" for="product-status">
                    وضعیت
                </label>
            </div>
            <button type="submit" class="float-left btn btn-primary btn-block">ذخیره </button>
        </form>
    </div>
</div>