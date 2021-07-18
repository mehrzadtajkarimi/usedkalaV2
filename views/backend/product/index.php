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
            <a href="<?= base_url() ?>admin/product/create" type="button" class="btn btn-success shadow-sm mr-2  " data-toggle="modal" data-target="#exampleModalCenter">
              ایجاد حصول
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
                        <label for="product-sale" class="col-2 col-form-label"> % تخفیف </label>
                        <div class="col-10">
                          <input name="product-sale" type="number" class="form-control" id="product-sale" placeholder="" required>
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
                          <input name="product-sku" type="text" class="form-control" id="product-sku" placeholder="" required>
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
                      <div class="form-group row">
                        <label class="col-2 col-form-label" for="product-category">دسته </label>
                        <div class="col-10">
                          <select name='product-category' class="form-control" id="product-category">
                            <?php foreach ($categories as $value) : ?>
                              <option value="<?= $value['id'] ?>"><?= $value['name'] ?></option>
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
                        <label for="slug" class="col-2 col-form-label">عکس</label>
                        <div class="col-10">
                          <div class="custom-file">
                            <label class="custom-file-label" for="product-image">Choose file</label>
                            <input name="product_image" type="file" class="custom-file-input" id="product-image">
                          </div>
                        </div>
                      </div>

                      <div class="form-check pt-2 pb-2">
                        <input name="product-featured" type="checkbox" class="form-check-input" id="product-featured">
                        <label class="form-check-label" for="product-featured">
                          محصول ویژه
                        </label>
                      </div>
                      <div class="form-check pt-2 pb-2 disabled ">
                        <input name="product-status" type="checkbox" class="form-check-input " id="product-status" checked disabled>
                        <label class="form-check-label" for="product-status">
                          وضعیت
                        </label>
                      </div>



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

                      <button type="submit" class="btn btn-primary float-left btn-block">ذخیره </button>
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
                <th class="text-center" scope="col">قیمت/تخفیف</th>
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
                  <td class="text-center"  title="<?= $value['sku'] ?>"><?= $count++ ?></td>
                  <td class="text-center"  title="<?= $value['meta_title'] ?>"><?= $value['title'] ?></td>
                  <td class="text-center"  title="<?= $value['sale_price'] ?>"><?= $value['price'] ?></td>
                  <td class="text-center"  title="<?= $value['weight'] ?>"><?= $value['quantity'] ?></td>
                  <td>
                    <div>
                      وضــــــــــعــیـت :
                      <?php if ($value['status'] == 1) : ?>
                        <i class="fa fa-check text-success "></i>
                      <?php else : ?>
                        <i class="fa fa-times text-danger "></i>
                      <?php endif; ?>
                    </div>
                    <div>
                      محصول ویژه :
                      <?php if ($value['featured'] == 1) : ?>
                        <i class="fa fa-check text-success"></i>
                      <?php else : ?>
                        <i class="fa fa-times text-danger"></i>
                      <?php endif; ?>
                    </div>
                  </td>
                  <td class="text-center" >
                    <a href="<?= base_url() ?>admin/product/<?= $value['id'] ?>/edit" class="btn btn-warning btn-sm shadow-sm " style="padding: 0px 16px; border-radius: 18px;">ویرایش</a>
                    <form method="post" action="<?= base_url() ?>admin/product/<?= $value['id'] ?>" class="d-inline">
                      <input type="hidden" name="_method" value="delete" />
                      <input type="submit" class="btn btn-danger btn-sm shadow-sm " style="padding: 0px 20px; border-radius: 18px;" onclick="return confirm('آیا برای حذف اطلاعات اطمینان دارید');" value="حذف">
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
    </div>
  </div>
</div>