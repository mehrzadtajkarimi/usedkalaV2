<div class="card ">
  <div class="p-0 shadow-sm card-body">
    <div class="card-header">
      <div class="row">
        <div class="col-4">
          <h3 class="p-3 card-title"> لیست تخفیفات</h3>
        </div>
        <div class="offset-4"> </div>
        <div class="col-4">
          <div class="input-group input-group-sm">
            <input type="text" name="table_search" class="float-right form-control" placeholder="جستجو">
            <div class="input-group-append">
              <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
            </div>
            <!-- Button trigger modal -->
            <a href="<?= base_url() ?>admin/discount/create" type="button" class="mr-2 shadow-sm btn btn-success " data-toggle="modal" data-target="#exampleModalCenter">
              ایجاد کوپن تخفیف
            </a>
            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
              <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-body">
                    <form action="<?= base_url() ?>admin/discount" method="post" class="p-1">
                      <input type="hidden" name="code" value="<?= rand(100000, 999999) ?>">
                      <div class="row">
                        <div class="col">
                          <div class="form-group">
                            <label for="Input1" class=""> شروع</label>
                            <input type="text" class="form-control start_at" id="Input1" required>
                            <input type="hidden" id="start_at" name="start_at">
                          </div>
                        </div>
                        <div class="col">
                          <div class="form-group">
                            <label for="Input2" class=""> پایان</label>
                            <input type="text" class="form-control finish_at" id="Input2" required>
                            <input type="hidden" id="finish_at" name="finish_at">
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col">
                          <div class="form-group ">
                            <label for="discount-title">موضوع</label>
                            <input name="discount-title" type="text" class="form-control" id="discount-title" placeholder="" required>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col">
                          <div class="form-group ">
                            <label for="discount-percent">میزان تخفیف %</label>
                            <input name="discount-percent" type="text" maxlength="3" class="form-control" id="discount-percent" placeholder="" required>
                          </div>
                        </div>
                      </div>
                      <div class="col">
                        <div class="form-group ">
                          <label> دسته بندی انتخابی</label>
                          <select name='discount-category[]' id="discount_category" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                            <?php foreach ($categories as $value) : ?>
                              <option value="<?= $value['id'] ?>"><?= $value['name'] ?></option>
                            <?php endforeach; ?>
                          </select>
                        </div>
                      </div>
                      <div class="col">
                        <label>محصول انتخابی</label>
                        <select name="discount-product[]" id="discount_product" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                          <?php foreach ($products as $value) : ?>
                            <option value="<?= $value['id'] ?>"><?= $value['title'] ?></option>
                          <?php endforeach; ?>
                        </select>
                      </div>
                      <div class="form-group">
                        <label for="discount-description" class="col-form-label"> توضیحات</label>
                        <textarea name="discount-description" type="text" class="form-control" id="discount-description" placeholder="" rows="2" required></textarea>
                      </div>
                      <div class="pt-1 pb-4 form-check disabled ">
                        <input name="discount-status" type="checkbox" class="form-check-input " id="discount-status" checked>
                        <label class="form-check-label" for="discount-status">
                          وضعیت
                        </label>
                      </div>
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
                <th class="text-center" scope="col">کد</th>
                <th class="text-center" scope="col">موضوع</th>
                <th class="text-center" scope="col">میزان تخفیف</th>
                <th class="text-center" scope="col">توضیحات</th>
                <th class="text-center" scope="col">از تاریخ</th>
                <th class="text-center" scope="col">تا تاریخ</th>
                <th class="text-center" scope="col">وضعیت</th>
                <th class="text-center" scope="col">مشاهده</th>
                <th class="text-center" scope="col"> اصلاحات</th>
              </tr>
            </thead>
            <tbody>
              <?php
              $count = 0;
              foreach ($discounts as $value) :
              ?>
                <tr>
                  <td class="text-center" title="ردیف"><?= $count++ ?></td>
                  <td class="text-center"><?= $value['code'] ?></td>
                  <td class="text-center"><?= $value['title'] ?></td>
                  <td class="text-center"><?= $value['percent'] ?></td>
                  <td class="text-center"><?= $value['description'] ?></td>
                  <td class="text-center"><?= $value['start_at'] ?></td>
                  <td class="text-center"><?= $value['finish_at'] ?></td>
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
                      <i class="fa fa-times text-danger"></i>
                    </div>
                  </td>
                  <td class="text-center">
                    <a href="" class="p-4">
                      <i class="fa fa-folder-open fa-2x text-muted" aria-hidden="true"></i>
                    </a>
                  </td>
                  <td class="text-center ">
                      <a href="<?= base_url() ?>admin/discount/<?= $value['id'] ?>/edit" class=" shadow-sm btn btn-warning btn-sm p-0 pr-2 pl-2" style=" border-radius: 18px;">ویــرایـش</a>
                      <form method="post" action="<?= base_url() ?>admin/discount/<?= $value['id'] ?>" class="d-inline">
                        <input type="hidden" name="_method" value="delete" />
                        <input type="submit" class=" shadow-sm btn btn-danger btn-sm p-0 pr-2 pl-2" style="border-radius: 18px;" onclick="return confirm('آیا برای حذف اطلاعات اطمینان دارید');" value="حــــــــذف">
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
      <p class="text-muted font-italic pr-4">برای به دست آوردن نام متا - تخفیف یا وزن با موس روی نقطه مورد نظر هاور کنید</p>
    </div>
  </div>
</div>
<?php include(BASEPATH . "/App/Views/Backend/discount/script.php") ?>