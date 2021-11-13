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
                        <label for="slider-small">موضوع</label>
                        <textarea name="slider-small" type="text" class="form-control" id="slider-small" rows="1" placeholder=""><?= $slider['small_text'] ?> </textarea>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="form-group">
                        <label for="slider-description" class="col-form-label"> متن </label>
                        <textarea name="slider-description" type="text" class="form-control" id="slider-description" placeholder="" rows="7"><?= $slider['description'] ?></textarea>
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
                                            <input name="slider_image" id="input-edit" type="file">
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
            </div>



            <div class="row">
                <div class="col-3">
                    <div class="pt-1 pb-4  form-check">
                        <input class="form-check-input" type="radio" name="linktype" id="slider-status-link" value="link" <?php if ($slider['linktype']=="link") echo 'checked'; ?>>
                        <label class="form-check-label" for="slider-status-link">
                            لینک
                        </label>
                    </div>
                </div>
                <div class=" col-9">
                    <div class="form-group ">
                        <input name="slider-link" type="text" class="form-control" value="<?= $slider['link'] ?>" id="input_slider-link" required>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-3">
                    <div class="pt-1 pb-4  form-check">
                        <input class="form-check-input" type="radio" name="linktype" id="slider-status-category" value="category" <?php if ($slider['linktype']=="category") echo 'checked'; ?>>
                        <label class="form-check-label" for="slider-status-category">
                            دسته بندی انتخابی
                        </label>
                    </div>
                </div>
                <div class=" col-9">
                    <div class="form-group ">
                        <select name='category_id' id="slider_category" class=" form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                            <?php foreach ($categories as $value) : ?>
                                <option value="<?= $value['id'] ?>" <?= $slider['category_id'] == $value['id'] ? 'selected' : '' ?>><?= $value['name'] ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <div class="pt-1 pb-4  form-check">
                        <input class="form-check-input" type="radio" name="linktype" id="slider-status-product" value="product" <?php if ($slider['linktype']=="product") echo 'checked'; ?>>
                        <label class="form-check-label" for="slider-status-product">
                            محصول انتخابی
                        </label>
                    </div>
                </div>
                <div class=" col-9">
                    <select name="product_id" id="slider_product" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                        <?php foreach ($products as $value) : ?>
                            <option value="<?= $value['id'] ?>" <?= $slider['product_id'] == $value['id'] ? 'selected' : '' ?>><?= $value['title'] ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="form-check row pt-2 pb-2">
                    <input name="slider-status" type="checkbox" class="form-check-input" id="slider-status" <?= $slider['status'] ?  'checked' : ''  ?>>
                    <label class="form-check-label" for="slider-status">
                        وضعیت
                    </label>
                </div>
            </div>
            <button type="submit" class="float-left btn btn-primary btn-block">ذخیره </button>
        </form>







    </div>
</div>