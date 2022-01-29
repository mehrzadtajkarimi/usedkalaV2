<div class="container-fluid">
  <div class="row">
    <div class="col-lg-6">
      <div class="card">
        <div class="card-header no-border">
          <div class="d-flex justify-content-between">
            <h3 class="card-title"> نمودار فروش</h3>
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-link" data-toggle="modal" data-target="#exampleModalCenter">
              مشاهده گزارش
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                  <form action="<?= base_url() ?>admin/report" method="post">
                    <div class="modal-header">
                      <h5 class="modal-title" id="my-modal-title">گزارش فروش</h5>
                    </div>
                    <div class="modal-body">
                      <div class="row">
                        <div class="col">
                          <div class="form-group">
                            <label for="Input1" class=""> شروع</label>
                            <input type="text" class="form-control start_at" id="Input1">
                            <input type="hidden" id="start_at" name="start_at">
                          </div>
                        </div>
                        <div class="col">
                          <div class="form-group">
                            <label for="Input2" class=""> پایان</label>
                            <input type="text" class="form-control finish_at" id="Input2">
                            <input type="hidden" id="finish_at" name="finish_at">
                          </div>
                        </div>
                      </div>
                      <div class="col">
                        <label>گزارش بر اساس </label>
                        <select name="order-type" id="discount_product" class="form-control">
                          <option value="all">همه </option>
                          <option value="discount_total">با تخفیف </option>
                          <option value="grand_total">بدون تخفیف </option>
                        </select>
                      </div>
                    </div>
                    <div class="modal-footer row">
                      <button type="submit" class="btn btn-primary col ml-2">نمایش </button>
                      <button type="button" class="btn btn-secondary col" data-dismiss="modal">انصراف</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="card-body">
          <div class="d-flex">
            <p class="d-flex flex-column">
              <span>
                <span class="text-bold text-lg"><?= $count_order ?></span>
                <span> سفارش</span>
              </span>
              <span>
                <span class="text-bold text-lg"><?= number_format($avg_grand) ?></span>
                <span>میانگین سفارشات</span>
              </span>

            </p>
            <p class="mr-auto d-flex flex-column text-right">
              <?php if ($change_sale_year >= 0) : ?>
                <span class="text-success ">
                  <i class="fa fa-arrow-up"></i> <?= $change_sale_year ?>%
                </span>
              <?php else : ?>
                <span class="text-danger ">
                  <i class="fa text-danger fa-arrow-down"></i> <?= $change_sale_year ?>%
                </span>
              <?php endif; ?>
              <span class="text-muted">از سال گذشته</span>
            </p>
            <p class="mr-auto d-flex flex-column text-right">
              <?php if ($change_sale_mount >= 0) : ?>
                <span class="text-success ">
                  <i class="fa fa-arrow-up"></i> <?= $change_sale_mount ?>%
                </span>
              <?php else : ?>
                <span class="text-danger ">
                  <i class="fa text-danger fa-arrow-down"></i> <?= $change_sale_mount ?>%
                </span>
              <?php endif; ?>
              <span class="text-muted">از ماه گذشته</span>
            </p>
            <p class="mr-auto d-flex flex-column text-right">
              <?php if ($change_sale_week >= 0) : ?>
                <span class="text-success ">
                  <i class="fa fa-arrow-up"></i> <?= $change_sale_week ?>%
                </span>
              <?php else : ?>
                <span class="text-danger ">
                  <i class="fa text-danger fa-arrow-down"></i> <?= $change_sale_week ?>%
                </span>
              <?php endif; ?>
              <span class="text-muted">از هفته گذشته</span>
            </p>
            <p class="mr-auto d-flex flex-column text-right">
              <?php if ($change_sale_day >= 0) : ?>
                <span class="text-success ">
                  <i class="fa fa-arrow-up"></i> <?= $change_sale_day ?>%
                </span>
              <?php else : ?>
                <span class="text-danger ">
                  <i class="fa text-danger fa-arrow-down"></i> <?= $change_sale_day ?>%
                </span>
              <?php endif; ?>
              <span class="text-muted">از روز گذشته</span>
            </p>
          </div>

          <div class="position-relative mb-4">
            <canvas id="visitors-chart" height="200"></canvas>
          </div>

          <div class="d-flex flex-row justify-content-end">
            <span class="ml-2">
              <i class="fa fa-square text-primary"></i> مجموع سفارشات
            </span>

            <span>
              <i class="fa fa-square " style="color:#ced4da"></i> مجموع تخفیفات
            </span>
          </div>
        </div>
      </div>

      <div class="card">
        <div class="card-header no-border">
          <h3 class="card-title">محصولات</h3>
          <div class="card-tools">
            <a href="#" class="btn btn-tool btn-sm">
              <i class="fa fa-download"></i>
            </a>
            <a href="#" class="btn btn-tool btn-sm">
              <i class="fa fa-bars"></i>
            </a>
          </div>
        </div>
        <div class="card-body p-0">
          <table class="table table-striped table-valign-middle">
            <thead>
              <tr>
                <th>محصولات</th>
                <th>قیمت</th>
                <th>فروش</th>
                <th>بیشتر</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>
                  <img src="dist/img/default-150x150.png" alt="Product 1" class="img-circle img-size-32 mr-2">
                  تلویزیون هوشمند
                </td>
                <td>13 تومان</td>
                <td>
                  <small class="text-success mr-1">
                    <i class="fa fa-arrow-up"></i>
                    12%
                  </small>
                  12,000 فروش
                </td>
                <td>
                  <a href="#" class="text-muted">
                    <i class="fa fa-search"></i>
                  </a>
                </td>
              </tr>
              <tr>
                <td>
                  <img src="dist/img/default-150x150.png" alt="Product 1" class="img-circle img-size-32 mr-2">
                  محصول ایکس
                </td>
                <td>29 تومان</td>
                <td>
                  <small class="text-warning mr-1">
                    <i class="fa fa-arrow-down"></i>
                    0.5%
                  </small>
                  123,234 فروش
                </td>
                <td>
                  <a href="#" class="text-muted">
                    <i class="fa fa-search"></i>
                  </a>
                </td>
              </tr>
              <tr>
                <td>
                  <img src="dist/img/default-150x150.png" alt="Product 1" class="img-circle img-size-32 mr-2">
                  محصول پرفروش
                </td>
                <td>1,230 تومان</td>
                <td>
                  <small class="text-danger mr-1">
                    <i class="fa fa-arrow-down"></i>
                    3%
                  </small>
                  198 فروش
                </td>
                <td>
                  <a href="#" class="text-muted">
                    <i class="fa fa-search"></i>
                  </a>
                </td>
              </tr>
              <tr>
                <td>
                  <img src="dist/img/default-150x150.png" alt="Product 1" class="img-circle img-size-32 mr-2">
                  محصول جدید
                  <span class="badge bg-danger">جدید</span>
                </td>
                <td>199 تومان</td>
                <td>
                  <small class="text-success mr-1">
                    <i class="fa fa-arrow-up"></i>
                    63%
                  </small>
                  87 فروش
                </td>
                <td>
                  <a href="#" class="text-muted">
                    <i class="fa fa-search"></i>
                  </a>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <div class="col-lg-6">
      <div class="card">
        <div class="card-header no-border">
          <div class="d-flex justify-content-between">
            <h3 class="card-title">فروش</h3>
            <a href="javascript:void(0);">مشاهده گزارش</a>
          </div>
        </div>
        <div class="card-body">
          <div class="d-flex">
            <p class="d-flex flex-column">
              <span class="text-bold text-lg">تومان 18,230.00</span>
              <span>فروش در طول زمان</span>
            </p>
            <p class="mr-auto d-flex flex-column text-right">
              <span class="text-success">
                <i class="fa fa-arrow-up"></i> 33.1%
              </span>
              <span class="text-muted">از ماه گذشته</span>
            </p>
          </div>
          <div class="position-relative mb-4">
            <canvas id="sales-chart" height="200"></canvas>
          </div>

          <div class="d-flex flex-row justify-content-end">
            <span class="ml-2">
              <i class="fa fa-square text-primary"></i> امسال
            </span>

            <span>
              <i class="fa fa-square text-gray"></i> سال گذشته
            </span>
          </div>
        </div>
      </div>

      <div class="card">
        <div class="card-header no-border">
          <h3 class="card-title">بررسی اجمالی فروشگاه آنلاین</h3>
          <div class="card-tools">
            <a href="#" class="btn btn-sm btn-tool">
              <i class="fa fa-download"></i>
            </a>
            <a href="#" class="btn btn-sm btn-tool">
              <i class="fa fa-bars"></i>
            </a>
          </div>
        </div>
        <div class="card-body">
          <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
            <p class="text-success text-xl">
              <i class="ion ion-ios-refresh-empty"></i>
            </p>
            <p class="d-flex flex-column text-right">
              <span class="font-weight-bold">
                <i class="ion ion-android-arrow-up text-success"></i> 12%
              </span>
              <span class="text-muted">نرخ تبدیل</span>
            </p>
          </div>
          <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
            <p class="text-warning text-xl">
              <i class="ion ion-ios-cart-outline"></i>
            </p>
            <p class="d-flex flex-column text-right">
              <span class="font-weight-bold">
                <i class="ion ion-android-arrow-up text-warning"></i> 0.8%
              </span>
              <span class="text-muted">نرخ فروش</span>
            </p>
          </div>
          <!-- /.d-flex -->
          <div class="d-flex justify-content-between align-items-center mb-0">
            <p class="text-danger text-xl">
              <i class="ion ion-ios-people-outline"></i>
            </p>
            <p class="d-flex flex-column text-right">
              <span class="font-weight-bold">
                <i class="ion ion-android-arrow-down text-danger"></i> 1%
              </span>
              <span class="text-muted">نرخ ثبت نام</span>
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<?php include(BASEPATH . "/App/Views/Backend/script.php") ?>