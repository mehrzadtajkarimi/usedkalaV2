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
              ایجاد کپن تخفیف
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
                            <label for="discount-entity_type">نوع تخفیف </label>
                            <select name='discount-entity_type' class="form-control" id="discount-entity_type">
                              <?php foreach ($discount_entities as  $value) : ?>
                                <option value="<?= $value ?>"><?= $value ?></option>
                              <?php endforeach; ?>
                            </select>
                          </div>
                        </div>
                        <div class="col">
                          <div class="form-group ">
                            <label for="discount-percent">میزان تخفیف %</label>
                            <input name="discount-percent" type="number" class="form-control" id="discount-percent" placeholder="" required>
                          </div>
                        </div>
                      </div>
                      <div class="form-group  mb-5">
                        <label for="discount-description" class="col-form-label"> توضیحات</label>
                        <textarea name="discount-meta" type="text" class="form-control" id="discount-meta" placeholder="" rows="2" required></textarea>
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
                <th class="text-center" scope="col">نوع تخفیف</th>
                <th class="text-center" scope="col">میزان تخفیف</th>
                <th class="text-center" scope="col">توضیحات</th>
                <th class="text-center" scope="col">اعتبار</th>
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
                  <td class="text-center"><?= $value['entity_type'] ?></td>
                  <td class="text-center"><?= $value['percent'] ?></td>
                  <td class="text-center"><?= $value['description'] ?></td>
                  <td class="text-center"><?= $value['start_at'] ?></td>
                  <td class="text-center"><?= $value['finish_at'] ?></td>
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