<?php include(BASEPATH . "/App/Views/Backend/script.php") ?>




<div class="container-fluid">
  <div class="row">
    <div class="col-lg-12">

      <div class="row">
        <div class="col-12 col-sm-6 col-md-3">
          <div class="info-box">
            <span class="info-box-icon bg-info elevation-1"><i class="fa fa-gear"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">ترافیک Cpu</span>
              <span class="info-box-number">
                ۱۰
                <small>%</small>
              </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-12 col-sm-6 col-md-3">
          <div class="info-box mb-3">
            <span class="info-box-icon bg-danger elevation-1"><i class="fa fa-google-plus"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">لایک‌ها</span>
              <span class="info-box-number">۴۱,۴۱۰</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->

        <!-- fix for small devices only -->
        <div class="clearfix hidden-md-up"></div>

        <div class="col-12 col-sm-6 col-md-3">
          <div class="info-box mb-3">
            <span class="info-box-icon bg-success elevation-1"><i class="fa fa-shopping-cart"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">فروش</span>
              <span class="info-box-number">۷۶۰</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-12 col-sm-6 col-md-3">
          <div class="info-box mb-3">
            <span class="info-box-icon bg-warning elevation-1"><i class="fa fa-users"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">اعضای جدید</span>
              <span class="info-box-number">۲,۰۰۰</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
      </div>

    </div>
  </div>
  <div class="row">
    <div class="col-lg-12">

      <div class="card">
        <div class="card-header border-0  d-flex  ">
          <h3 class="position-absolute " style="right:15px">پرفروش ترین ها</h3>
          <div class="m-auto">
            <div class="btn-group  btn-group-sm shadow wow fadeInRight" id="btn-date">
              <button type="button" data-time="year" class="btn btn-secondary active  ">ســال</button>
              <button type="button" data-time="month" class="btn btn-secondary  ">مــاه</button>
              <button type="button" data-time="week" class="btn btn-secondary  ">هفته</button>
              <button type="button" data-time="day" class="btn btn-secondary  ">روز</button>
            </div>
            <div class="btn-group  btn-group-sm mr-3 shadow wow fadeInRight" data-wow-delay="0.2s" id="btn-quantity">
              <a href="<?= base_url() ?>admin/dashboard/grand_total" class="btn btn-secondary btn-price  <?= $quantity_chart_pir == 'grand_total' ? 'active' : '' ?>">قیـمت</a>
              <a href="<?= base_url() ?>admin/dashboard/quantity_total" class="btn btn-secondary btn-quantity  <?= $quantity_chart_pir == 'quantity_total' ? 'active' : '' ?>">تــعداد</a>
            </div>
            <div class="btn-group  btn-group-sm mr-3 shadow wow fadeInRight" data-wow-delay="0.6s" id="btn-count">
              <?php foreach ($limits_chart_pir as $key => $value) : ?>
                <button type="button" data-count="<?= $key ?>" class="btn btn-secondary <?= $value ?>"><?= $key ?></button>
              <?php endforeach; ?>
            </div>
          </div>
          <div class="position-absolute " style="left:15px">

            <!-- Button trigger modal -->
            <button type="button" class="btn btn-link float-right" data-toggle="modal" data-target="#limits_chart_pirModalCenter">
              مشاهده گزارش
            </button>

            <!-- Modal -->
            <div class="modal fade" id="limits_chart_pirModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                  <form action="<?= base_url() ?>admin/bestsellers/best_selling_products" method="post">
                    <div class="modal-header">
                      <h5 class="modal-title" id="my-modal-title">گزارش پرفروش ترین محصولات</h5>
                    </div>
                    <div class="modal-body">
                      <div class="row">
                        <div class="col">
                          <div class="form-group">
                            <label for="Input3" class=""> شروع</label>
                            <input type="text" class="form-control start_at-1" id="Input3">
                            <input type="hidden" id="start_at-1" name="start_at">
                          </div>
                        </div>
                        <div class="col">
                          <div class="form-group">
                            <label for="Input4" class=""> پایان</label>
                            <input type="text" class="form-control finish_at-1" id="Input4">
                            <input type="hidden" id="finish_at-1" name="finish_at">
                          </div>
                        </div>
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

          <div class="row">
            <div class="col-md-8">
              <div class="chart-responsive">
                <b class="text-center text-muted d-block">
                  <i class="fa fa-hand-o-down wow flash pr-3" data-wow-duration="2.5s" data-wow-iteration="8" aria-hidden="true"></i>
                  <span>درصد - مقایسه فروش محصولات به نسبت کل است</span>
                  <i class="fa fa-hand-o-down wow flash " data-wow-duration="2.5s" data-wow-iteration="8" aria-hidden="true"></i>
                </b>
                <canvas id="pieChart" height="80"></canvas>
              </div>
              <div class="text-center">
                <div class="row  m-auto  pt-4">
                  <div class="col">
                    <b class="float-left"> مقایسه از بازده تاریــخ : </b>
                  </div>
                  <div class="col">
                    <div class="edit-started float-right">
                      <span class="badge badge-pill badge-secondary  shadow" id="chart_pir_this">
                        <?= $chart_pir_this_to ?>
                        <i class="fa fa-arrow-left pr-1 pl-2  text-warning wow fadeInRight" data-wow-delay="1s" data-wow-iteration="5" aria-hidden="true"></i>
                        <?= $chart_pir_this_as ?>
                      </span>
                    </div>
                  </div>
                </div>
                <div class="row  pt-4">
                  <div class="col">
                    <b class="float-left"> تا تاریــخ :</b>
                  </div>
                  <div class="col ">
                    <div class="edit-finished float-right">
                      <span class="badge badge-pill badge-secondary shadow" id="chart_pir_last">
                        <?= $chart_pir_last_to ?>
                        <i class="fa fa-arrow-left pr-1 pl-2  text-warning wow fadeInRight" data-wow-delay="1s" data-wow-iteration="5" aria-hidden="true"></i>
                        <?= $chart_pir_last_as ?>
                      </span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <ul class="chart-legend clearfix" id="li-chart-pir">
                <?php foreach ($chart_pir as $key => $value) : ?>
                  <li>
                    <i class="fa fa-square <?= "text-$chart_pir_color[$key]" ?>" title="شماره شناسه محصول : <?= $value['product_id'] ?>">
                      <?= $value['product_name'] ?>
                    </i>
                  </li>
                <?php endforeach; ?>
              </ul>
            </div>
          </div>
        </div>
        <div class="card-footer bg-white p-0">
          <div class="row">
            <div class="col-2 ">
              <b class='text-muted font-weight-bold d-block text-center pt-1 h3'> درصد مقایسه در بازده : </b>
            </div>
            <div class="col-10">
              <ul class="nav nav-pills flex-column" id="change-item-sale">
                <?php foreach ($change_item_sale_year as $value) : ?>
                  <?php if (!empty($value)) : ?>
                    <li class="nav-item">
                      <a href="<?= base_url() ?>product/<?= $value[2] ?>" class="nav-link">
                        <?= $value[1] ?>
                        <span class="float-left text-<?= $value[0] > 0 ?  'success' : 'danger'  ?>">
                          <i class="fa fa-arrow-<?= $value[0] > 0 ? 'up' : 'down' ?>" text-sm"></i>
                          <?= $value[0] ?>%</span>
                      </a>
                    </li>
                  <?php endif; ?>
                <?php endforeach; ?>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
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
                  <form action="<?= base_url() ?>admin/sales_report" method="post">
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
            <canvas id="visitors-chart" height="250"></canvas>
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
            <h3 class="card-title"> تعداد بازدید</h3>
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-link" data-toggle="modal" data-target="#exampleModalCenter">
              مشاهده گزارش
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                  <form action="<?= base_url() ?>admin/dashboard" method="post">
                    <div class="modal-header">
                      <h5 class="modal-title" id="my-modal-title">گزارش فروش</h5>
                    </div>
                    <div class="modal-body">
                      <div class="row">
                        <div class="col">
                          <div class="form-group">
                            <label for="Input5" class=""> شروع</label>
                            <input type="text" class="form-control start_at" id="Input5">
                            <input type="hidden" id="start_at" name="start_at">
                          </div>
                        </div>
                        <div class="col">
                          <div class="form-group">
                            <label for="Input6" class=""> پایان</label>
                            <input type="text" class="form-control finish_at" id="Input6">
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