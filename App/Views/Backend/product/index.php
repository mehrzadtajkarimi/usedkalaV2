<div class="card ">
  <div class="p-0 shadow-sm card-body">
    <div class="card-header">
      <div class="row">
        <div class="col-4">
          <h3 class="p-3 card-title"> لیست محصولات</h3>
        </div>
        <div class="offset-4"> </div>
        <div class="col-4">
          <div class="input-group input-group-sm">
            <input type="text" name="table_search" class="float-right form-control" placeholder="جستجو">
            <div class="input-group-append">
              <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
            </div>

            <!-- Button trigger modal -->
            <a href="<?= base_url() ?>admin/product/create" type="button" class="mr-2 shadow-sm btn btn-success " data-toggle="modal" data-target="#exampleModalCenter">
              ایجاد محصول
            </a>


            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
              <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-body">
                    <form action="<?= base_url() ?>admin/product" method="post" enctype="multipart/form-data">
                      <div class="form-group row">
                        <label for="product-name" class="col-2 col-form-label"> نام </label>
                        <div class="col-10">
                          <input name="product-name" type="text" class="form-control" id="product-name" placeholder="" required>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="product-slug" class="col-2 col-form-label"> slug </label>
                        <div class="col-10">
                          <input name="product-slug" type="text" class="form-control" id="product-slug" placeholder="" required>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="product-price" class="col-2 col-form-label"> قیمت </label>
                        <div class="col-10">
                          <input name="product-price" type="number" class="form-control" id="product-price" placeholder="" required>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="product-quantity" class="col-2 col-form-label"> موجودی </label>
                        <div class="col-10">
                          <input name="product-quantity" type="number" class="form-control" id="product-quantity" placeholder="" required>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="product-weight" class="col-2 col-form-label"> وزن </label>
                        <div class="col-10">
                          <input name="product-weight" type="number" class="form-control" id="product-weight" placeholder="" required>
                        </div>
                      </div>
                      <div class="form-group row" title="شناسه منحصر به فرد محصول">
                        <label for="product-sku" class="col-2 col-form-label"> SKU </label>
                        <div class="col-10">
                          <input name="product-sku" type="text" class="form-control" id="product-sku" placeholder="">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-2 col-form-label" for="product_category"> دسته بندی</label>
                        <div class="col-10">
                          <select name='product-category[]' id="product_category" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                            <?php foreach ($categories as $value) : ?>
                              <option value="<?= $value['id'] ?>"><?= $value['name'] ?></option>
                            <?php endforeach; ?>
                          </select>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-2 col-form-label" for="product_tag">تگ </label>
                        <div class="col-10">
                          <select name='product-tag[]' id="product_tag" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                            <?php foreach ($tags as $value) : ?>
                              <option value="<?= $value['id'] ?>"><?= $value['tag'] ?></option>
                            <?php endforeach; ?>
                          </select>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-2 col-form-label" for="product-brand">برند </label>
                        <div class="col-10">
                          <select name='product-brand' class="form-control" id="product-brand">
                            <?php foreach ($brands as $value) : ?>
                              <option value="<?= $value['id'] ?>"><?= $value['name'] ?></option>
                            <?php endforeach; ?>
                          </select>
                        </div>
                      </div>

                      <div class="form-group row">
                        <label for="product-meta" class="col-2 col-form-label"> متن متا</label>
                        <div class="col-10">
                          <textarea name="product-meta" type="text" class="form-control" id="product-meta" placeholder="" rows="2" required></textarea>
                        </div>
                      </div>

                      <div class="form-group row">
                        <label for="product-description" class="col-2 col-form-label"> درباره محصول </label>
                        <div class="col-10">
                          <textarea name="product-description" type="text" class="form-control" id="product-description" placeholder="" rows="3" required></textarea>
                        </div>
                      </div>
                      <hr>

                      <div class="form-group row">
                        <label for="H1" class="col-2 col-form-label">H1</label>
                        <div class="col-10">
                          <input name="seo-H1" type="text" class="form-control" id="H1" placeholder="ترجیحا بین 20 تا 70 کاراکتر" required>
                        </div>
                      </div>

                      <div class="form-group row">
                        <label for="Canonical" class="col-2 col-form-label">Canonical</label>
                        <div class="col-10">
                          <input name="seo-canonical" type="text" class="form-control" id="Canonical" placeholder="لینک را وارد نمایید">
                        </div>
                      </div>

                      <div class="form-group row">
                        <label for="seo-robots" class="col-2 col-form-label">robots</label>
                        <div class="col-10">
                          <select name='seo-robot' id="robots" class="form-control ">
                            <?php foreach ($robots as $key => $value) : ?>
                              <option value="<?= $key ?>"><?= $value ?></option>
                            <?php endforeach; ?>
                          </select>
                        </div>
                      </div>

                      <div class="form-group row">
                        <label for="title" class="col-2 col-form-label">title</label>
                        <div class="col-10">
                          <input name="seo-title" type="text" class="form-control" id="title" placeholder="title را وارد نمایید" required>
                        </div>
                      </div>

                      <div class="form-group row">
                        <label for="seo-description" class="col-2 col-form-label"> درباره محصول </label>
                        <div class="col-10">
                          <textarea name="seo-description" type="text" class="form-control" id="seo-description" placeholder="" rows="3" required></textarea>
                        </div>
                      </div>
                      <hr>

                      <div class="form-group row">
                        <label for="slug" class="col-2 col-form-label">عکس</label>
                        <div class="col-10">
                          <!-- <div class="custom-file">
                            <label class="custom-file-label" for="product-image">Choose file</label>
                            <input name="product_image" type="file" class="custom-file-input" id="product-image" required>
                          </div> -->
                          <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css">
                          <div class="card-block">
                            <div class="flex-row d-flex" id="coba"></div>
                          </div>
                        </div>
                      </div>

                      <script>
                        $(document).ready(function() {
                          $("#coba").spartanMultiImagePicker({
                            fieldName: 'product_image[]',
                            groupClassName: 'col-2',
                            rowHeight: '100px',
                          });

                        });
                      </script>
                      <hr>
                      <div class="pt-2 pb-2 form-check disabled ">
                        <input name="product-status" type="checkbox" class="form-check-input " id="product-status" checked disabled>
                        <label class="form-check-label" for="product-status">
                          وضعیت
                        </label>
                      </div>
                      <!-- <div class="pt-2 pb-2 form-check">
                        <input value="1" name="product-featured" type="checkbox" class="form-check-input" id="product-featured">
                        <label class="form-check-label" for="product-featured">
                          محصول ویژه
                        </label>
                      </div>

                      <div class="pt-2 pb-2 form-check">
                        <input value="1" name="product-sale" type="checkbox" class="form-check-input" id="product-sale">
                        <label class="form-check-label" for="product-sale">
                          محصول پرفروش
                          <small class="text-danger">
                            (جهت نمایش در صفحه اصلی قسمت پرفروشترین محصولات)
                          </small>
                        </label>
                      </div> -->



                      <!-- <div class="form-group row" >
                        <label class="col-2 col-form-label" for="product-product">تامین کننده </label>
                        <div class="col-10">
                          <select name='product-product' class="form-control" id="product-product" disabled>
                           //* <?php foreach ($suppliers as $value) : ?>
                           //*   <option value="<?= $value['id'] ?>"><?= $value['name'] ?></option>
                           //* <?php endforeach; ?>
                          </select>
                        </div>
                      </div> -->

                      <button type="submit" class="float-left btn btn-primary btn-block">ذخیره </button>
                    </form>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>
    <div class="p-0 card-body table-responsive">
      <div class="card ">
        <div class="card-body">

          <table class="table table--vertical_middle ">
            <thead>
              <tr>
                <th class="text-center" scope="col">#</th>
                <th class="text-center" scope="col">نام/متا</th>
                <th class="text-center" scope="col">قیمت</th>
                <th class="text-center" scope="col">موجودی/وزن</th>
                <th scope="col"> وضعیت/ویژه</th>
                <th class="text-center" scope="col">اصلاحات</th>
              </tr>
            </thead>
            <tbody>
              <?php
              $count = 0;
              foreach ($products as $value) :
              ?>
                <tr>
                  <td class="text-center" title="<?= $value['sku'] ?>"><?= $count++ ?></td>
                  <td class="text-center" title="<?= $value['meta_title'] ?>"><?= $value['title'] ?></td>
                  <td class="text-center"><?= number_format($value['price']) ?> ریال</td>
                  <td class="text-center" title="<?= $value['weight'] ?>"><?= $value['quantity'] ?></td>
                  <td>
                    <div>
                      وضـــــــــــــعــیـــــــــت :
                      <?php if ($value['status'] == 1) : ?>
                        <i class="fa fa-check text-success "></i>
                      <?php else : ?>
                        <i class="fa fa-times text-danger "></i>
                      <?php endif; ?>
                    </div>
                    <div>
                      محصـــــــول ویــــژه :
                      <?php if ($value['featured'] == 1) : ?>
                        <i class="fa fa-check text-success"></i>
                      <?php else : ?>
                        <i class="fa fa-times text-danger"></i>
                      <?php endif; ?>
                    </div>
                    <div>
                      محصول پرفروش :
                      <?php if ($value['featured'] == 1) : ?>
                        <i class="fa fa-check text-success"></i>
                      <?php else : ?>
                        <i class="fa fa-times text-danger"></i>
                      <?php endif; ?>
                    </div>
                  </td>
                  <td class="text-center">
                    <a href="<?= base_url() ?>admin/product/<?= $value['id'] ?>/edit" class="shadow-sm btn btn-warning btn-sm " style="padding: 0px 16px; border-radius: 18px;">ویرایش</a>
                    <form method="post" action="<?= base_url() ?>admin/product/<?= $value['id'] ?>" class="d-inline">
                      <input type="hidden" name="_method" value="delete" />
                      <input type="submit" class="shadow-sm btn btn-danger btn-sm " style="padding: 0px 20px; border-radius: 18px;" onclick="return confirm('آیا برای حذف اطلاعات اطمینان دارید');" value="حذف">
                    </form>
                  </td>
                </tr>
              <?php
              endforeach;
              ?>
            </tbody>
          </table>

        </div>
      </div>
      <p class="pr-4 text-muted font-italic">برای به دست آوردن نام متا - تخفیف یا وزن با موس روی نقطه مورد نظر هاور کنید</p>
    </div>
  </div>
</div>
<?php include(BASEPATH . "/App/Views/Backend/product/script.php") ?>