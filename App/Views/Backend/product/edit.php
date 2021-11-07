<div class="card">
    <div class="card-header">
        <h5>ویرایش محصول (( <?= $products['title'] ?> ))</h5>
    </div>
    <div class="card-body">
        <form action="<?= base_url() ?>admin/product/<?= $products['id'] ?>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="_method" value="patch" />
            <div class="form-group row">
                <label for="inputEmail3" class="col-sm-2 col-form-label">نام</label>
                <div class="col-sm-10">
                    <input name="product-name" type="text" class="form-control" id="inputEmail3" value="<?= $products['title'] ?? '' ?>" placeholder="نام زیر دسته را وارد نمایید" autofocus>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-2 col-form-label" for="product-category">دسته </label>
                <div class="col-10">
                    <select name='product-category[]' id="product_category" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                        <?php foreach ($categories as $key => $value) : ?>
                            <option value="<?= $value['id'] ?>" <?php if (isset($categories_selected[$value['id']])) echo 'selected'; ?>><?= $value['name'] ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-2 col-form-label" for="product-tag">تگ </label>
                <div class="col-10">
                    <select name='product-tag[]' id="product_tag" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                        <?php foreach ($tags as $key => $value) : ?>
                            <option value="<?= $value['id'] ?>" <?php if (isset($tags_selected[$value['id']])) echo 'selected'; ?>><?= $value['tag'] ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-2 col-form-label" for="product-brand">برند </label>
                <div class="col-10">
                    <select name='product-brand' class="form-control" id="product-brand">
                        <?php foreach ($brands as $value) : ?>
                            <option value="<?= $value['id'] ?>" <?= $products['brand_id'] == $value['id'] ? 'selected' : '' ?>><?= $value['name'] ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label for="product-slug" class="col-2 col-form-label"> slug </label>
                <div class="col-10">
                    <input name="product-slug" type="text" class="form-control" id="product-slug" value="<?= $products['slug']  ?>" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="product-price" class="col-2 col-form-label"> قیمت </label>
                <div class="col-10">
                    <input name="product-price" type="number" class="form-control" id="product-price" value="<?= $products['price']  ?>" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="product-quantity" class="col-2 col-form-label"> موجودی </label>
                <div class="col-10">
                    <input name="product-quantity" type="number" class="form-control" id="product-quantity" value="<?= $products['quantity']  ?>" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="product-weight" class="col-2 col-form-label"> وزن </label>
                <div class="col-10">
                    <input name="product-weight" type="number" class="form-control" id="product-weight" value="<?= $products['weight']  ?>" required>
                </div>
            </div>

            <div class="form-group row" title="شناسه منحصر به فرد محصول">
                <label for="product-sku" class="col-2 col-form-label"> SKU </label>
                <div class="col-10">
                    <input name="product-sku" type="text" class="form-control" id="product-sku" value="<?= $products['sku']  ?>" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="product-meta" class="col-2 col-form-label"> متن متا</label>
                <div class="col-10">
                    <textarea name="product-meta" type="text" class="form-control" id="product-meta" rows="2" required><?= $products['meta_title']  ?></textarea>
                </div>
            </div>
            <div class="form-group row">
                <label for="product-description" class="col-2 col-form-label"> درباره محصول </label>
                <div class="col-10">
                    <textarea name="product-description" type="text" class="form-control" id="product-description" rows="3" required><?= $products['description']  ?></textarea>
                </div>
            </div>
            <div class="pt-2 pb-2 form-check row">
                <input name="product-featured" type="checkbox" class="form-check-input" id="product-featured" <?= $products['featured'] ?  'checked' : ''  ?>>
                <label class="form-check-label" for="product-featured">
                    محصول ویژه
                </label>
            </div>
            <div class="pt-2 pb-2 form-check row">
                <input name="product-status" type="checkbox" class="form-check-input" id="product-status" <?= $products['status'] ?  'checked' : ''  ?>>
                <label class="form-check-label" for="product-status">
                    وضعیت
                </label>
            </div>

            <div class="pt-2 pb-2 form-check row">
                <input name="product-sale" type="checkbox" class="form-check-input" id="product-sale" <?= $products['sale'] ?  'checked' : ''  ?>>
                <label class="form-check-label" for="product-sale">
                    محصول پرفروش
                    <small class="text-danger">
                        (جهت نمایش در صفحه اصلی قسمت پرفروشترین محصولات)
                    </small>
                </label>
            </div>
            <?php if (empty($photo['path'])) : ?>
                <div class=" form-group row">
                    <label for="slug" class="col-2 col-form-label">عکس</label>
                    <div class="col-10">
                        <div class="custom-file">
                            <input name="product_image" type="file" class="custom-file-input" id="inputGroupFile04">
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
                                    <input name="product_image" id="input-edit" type="file">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-success" data-dismiss="modal">تایید</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php include(BASEPATH . "App/Views/Backend/product/script.php") ?>
                </div>
            <?php endif; ?>
            <div class="form-group row">
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">ذخیره</button>
                    <a href="<?= base_url() ?>admin/product" class="btn btn-danger">انصراف</a>
                </div>
            </div>
        </form>
    </div>
</div>
<?php include(BASEPATH . "/App/Views/Backend/product/script.php") ?>