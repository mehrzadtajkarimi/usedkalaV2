<div class="card ">
  <div class="p-0 shadow-sm card-body">
    <div class="card-header">
      <div class="row">
        <div class="col-4">
          <h3 class="p-3 card-title"> لیست سفارش ها</h3>
        </div>
        <div class="offset-4"> </div>
        <div class="col-4">
          <div class="input-group input-group-sm">
            <input type="text" name="table_search" class="float-right form-control" placeholder="جستجو">
            <div class="input-group-append">
              <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
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
                <th class="text-center" scope="col">نام</th>
                <th class="text-center" scope="col">شماره موبایل</th>
                <th class="text-center" scope="col">وضعیت</th>
                <th class="text-center" scope="col">رسیدگی شده توسط</th>
                <th class="text-center" scope="col">ارسال شده توسط</th>
                <th class="text-center" scope="col"> ارسال از طریق</th>
                <th class="text-center" scope="col">نمایش</th>
              </tr>
            </thead>
            <tbody>
              <style>
                .chkbx input[type=checkbox] {
                  display: none;
                }

                .chkbx {
                  position: relative;
                  cursor: pointer;
                }

                .chkbx .x {
                  display: block;
                  width: 90px;
                  height: 31px;
                  border: 2px solid #D3D3BE;
                  border-radius: 60px;
                  transition: 0.5s;
                }

                .chkbx .x:before {
                  content: "";
                  position: absolute;
                  width: 23px;
                  height: 23px;
                  top: 4px;
                  left: 4px;
                  box-sizing: border-box;
                  background: #D3D3BE;
                  border: 2px solid #D3D3BE;
                  border-radius: 40px;
                  transition: 0.5s;
                }

                .chkbx :checked~.x:before {
                  background: #dc3545;
                  border-color: #dc3545;
                  transform: translatex(58px);
                }

                .chkbx :checked~.x {
                  border-color: #dc3545;
                }
              </style>
              <?php foreach ($orders as $value) : ?>
                <tr>
                  <td class="text-center"><?= $value['user_full_name'] ?></td>
                  <td class="text-center"><?= $value['user_phone'] ?></td>
                  <td class="text-center" style="height: 118px;">
                    <div class="check-handler" style="display: <?= $value['status'] == 1 ? 'block'  : 'none' ?> ; ">
                      <div class="row ">
                        <div class="offset-3"></div>
                        <div class="col-3">
                          <p> رسیدگی </p>
                          <i class="fa fa-check-square-o fa-3x text-warning icon-check-box-order-handler" aria-hidden="true"></i>
                        </div>
                        <div class="col-3">
                          <label class="chkbx">
                            <input class="check-box-handler check-box-handler-<?= $value['id'] ?>" data-id="<?= $value['id'] ?>" <?= $value['status'] == 2 ? 'checked' : '' ?> onclick="return confirm(' آیا برای تغییر وضعیت اطلاعات اطمینان دارید... \n بعد از تغییر وضعیت به حالت بررسی \nبه نام شما ثبت شده و دیگر امکان بازگشت وجود نخواهد داشت ');" type="checkbox">
                            <span class="x"></span>
                          </label>
                        </div>
                      </div>
                    </div>
                    <div class="check-sender" style="display: <?= $value['status'] == 2 ? 'block'  : 'none' ?> ; ">
                      <div class="row">
                        <div class="offset-3"></div>
                        <div class="col-3">
                          <p> ارسال </p>
                          <div class="fa fa-paper-plane fa-3x text-primary icon-check-box-order-sender" aria-hidden="true"></div>
                        </div>
                        <div class="col-3">
                          <label class="chkbx">
                            <input class="check-box-sender check-box-sender-<?= $value['id'] ?>" data-status_sender="<?= $value['status_sender'] == 0 ?>" data-id="<?= $value['id'] ?>" <?= $value['status'] == 3 ? 'checked' : '' ?> type="checkbox">
                            <span class="x"></span>
                          </label>
                        </div>
                      </div>
                    </div>
                    <div class="check-delivery" style="display: <?= $value['status'] >= 3 ? 'block'  : 'none' ?> ; ">
                      <div class="row d-flex">
                        <div class="offset-3"></div>
                        <div class="col-3 align-self-center">
                          <p class="m-0"> تحویل </p>
                          <i class="fa fa-truck fa-3x text-danger icon-check-box-order-delivery" aria-hidden="true"></i>

                        </div>
                        <div class="col-3">

                          <span class="heck-box-delivery check-box-delivery-<?= $value['id'] ?> ">
                            <div>تایید کاربر</div>
                            <?php if ($value['status'] == 3) : ?>
                              <div class="fa fa-times-circle-o fa-2x text-danger" aria-hidden="true"></div>
                            <?php endif; ?>
                            <?php if ($value['status'] == 4) : ?>
                              <div class="fa fa-check-square-o fa-2x text-success" aria-hidden="true"></div>
                            <?php endif; ?>
                          </span>

                        </div>
                      </div>
                    </div>
                  </td>
                  <?php if ($value['handler_id'] != 0) : ?>
                    <td class="text-center">
                      <button type="button" data-id="<?= $value['id'] ?>" class="btn btn-link handler">مشاهده</button>
                    </td>
                    <?php if ($value['sender_id'] != 0) : ?>
                      <td class="text-center">
                        <button type="button" data-id="<?= $value['id'] ?>" class="btn btn-link sender">مشاهده</button>
                      </td>
                      <?php if ($value['status_sender'] != 0) : ?>
                        <td class="text-center">
                          <div style="color:#007bff" ><?= array_key_exists($value['status_sender'],status_sender())? status_sender()[$value['status_sender']] : '' ?></div>
                          <small class="text-muted"><?= $value['tracking'] ?></small>
                        </td>
                      <?php else : ?>
                        <td></td>
                      <?php endif; ?>
                    <?php else : ?>
                      <td></td>
                      <td></td>
                    <?php endif; ?>

                    <td class="text-center">
                      <?php if ($value['status'] >= 2 && $value['status_sender'] == 0) : ?>
                        <button data-id="<?= $value['id'] ?>" class="shadow-sm  btn btn-danger btn-sm" data-toggle="modal" data-target="#exampleModalCenters-<?= $value['id'] ?>" style="padding: 0px 9px; border-radius: 18px;">
                          روش ارسال
                        </button>
                        <!-- Modal -->
                        <div class="modal fade bd-example-modal-lg" id="exampleModalCenters-<?= $value['id'] ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle<?= $value['id'] ?>" aria-hidden="true">
                          <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">

                              <div class="modal-body">
                                <form action="<?= base_url() ?>admin/order/tracker/<?= $value['id'] ?>" method="post">
                                  <div class="form-group row">
                                    <label for="status_sender_<?= $value['id'] ?>" class="col-3 col-form-label"> ارسال</label>
                                    <div class="col-9">
                                      <select name='status-sender' id="status_sender_<?= $value['id'] ?>" class="form-control status_sender">
                                        <option value="0">انتخاب کنید</option>
                                        <option value="1"> پست</option>
                                        <option value="2">پست بار</option>
                                        <option value="3"> چاپار</option>
                                        <option value="4"> الوپیک</option>
                                        <option value="5"> اسنپ باکس</option>
                                      </select>
                                    </div>
                                  </div>
                                  <div class="form-group row tracker  tracker-post" style="display: none">
                                    <label for="tracker-post-<?= $value['id'] ?>" class="col-3 col-form-label">پست </label>
                                    <div class="col-9">
                                      <input name="tracker-post" type="text" class="form-control" id="tracker-post-<?= $value['id'] ?>" placeholder="شماره سفارش پست">
                                    </div>
                                  </div>
                                  <div class="form-group row tracker tracker-postbar" style="display: none">
                                    <label for="tracker-postbar-<?= $value['id'] ?>" class="col-3 col-form-label">پست بار</label>
                                    <div class="col-9">
                                      <input name="tracker-postbar" type="text" class="form-control" id="tracker-postbar-<?= $value['id'] ?>" placeholder="شماره سفارش  پست بار">
                                    </div>
                                  </div>
                                  <div class="form-group row tracker tracker-chapar" style="display: none">
                                    <label for="tracker-chapar-<?= $value['id'] ?>" class="col-3 col-form-label">چاپار</label>
                                    <div class="col-9">
                                      <input name="tracker-chapar" type="text" class="form-control" id="tracker-chapar-<?= $value['id'] ?>" placeholder="شماره سفارش چاپار">
                                    </div>
                                  </div>
                                  <div class="form-group row tracker tracker-alopeyk" style="display: none">
                                    <label for="tracker-alopeyk-<?= $value['id'] ?>" class="col-3 col-form-label">الوپیک</label>
                                    <div class="col-9">
                                      <input name="tracker-alopeyk" type="text" class="form-control" id="tracker-alopeyk-<?= $value['id'] ?>" placeholder="شماره سفارش الوپیک">
                                    </div>
                                  </div>
                                  <div class="form-group row tracker tracker-snappـbox" style="display: none">
                                    <label for="tracker-snappـbox-<?= $value['id'] ?>" class="col-3 col-form-label">اسنپ باکس</label>
                                    <div class="col-9">
                                      <input name="tracker-snappـbox" type="text" class="form-control" id="tracker-snappـbox-<?= $value['id'] ?>" placeholder="شماره سفارش اسنپ باکس" required>
                                    </div>
                                  </div>

                                  <button type="submit" class="float-left btn btn-primary btn-block btn-submit-order-tracing">ذخیره </button>
                                </form>
                              </div>
                            </div>
                          </div>
                        </div>
                      <?php endif; ?>
                      <button data-id="<?= $value['id'] ?>" class="shadow-sm access-show btn btn-warning btn-sm" style="padding: 0px 16px; border-radius: 18px;">
                        نـمایــــــش
                      </button>
                    </td>
                  <?php else : ?>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  <?php endif; ?>
                </tr>
                <tr class="target-collapse-response-<?= $value['id'] ?> " style="display: none;">
                  <td colspan="10" class=" ">
                    <table class="table  table-hover table--vertical_middle ">
                      <thead>
                        <tr class="">
                          <th class="text-center" scope="col">#</th>
                          <th class="text-center" scope="col">نام</th>
                          <th class="text-center" scope="col">قیمت</th>
                          <th class="text-center" scope="col">تعداد</th>
                          <th class="text-center" scope="col">جمع</th>
                        </tr>
                      </thead>
                      <tbody class="target-tbody">

                      </tbody>
                      <tfoot class="target-tfoot bg-light">

                      </tfoot>
                    </table>
                  </td>
                </tr>
              <?php endforeach; ?>

            </tbody>
          </table>
        </div>
      </div>
    </div>
    <nav aria-label="Page navigation example">
      <ul class="pagination justify-content-center">
        <li class="page-item <?php if (pagination_count('orders', 10) + 1 == 1 || (isset($_GET['page']) && $_GET['page'] == 1) || !isset($_GET['page'])) echo "disabled" ?>">
          <a class="page-link" href="<?= base_url() ?>admin/order?page=<?php if (isset($_GET['page']) && $_GET['page'] > 1) echo $_GET['page'] - 1; ?> " aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
        </li>
        <?php for ($i = 0; $i <=  pagination_count('orders', 10); $i++) : ?>
          <li class="page-item <?php if (isset($_GET['page']) && $_GET['page'] == ($i + 1)) echo "active";
                                else if (!isset($_GET['page']) && ($i + 1) == 1) echo "active" ?>">
            <a class="page-link" href="<?= base_url() ?>admin/order?page=<?= $i + 1 ?>"><?= $i + 1 ?></a>
          </li>
        <?php endfor; ?>
        <li class="page-item <?php if (pagination_count('orders', 10) + 1 == 1 || (isset($_GET['page']) &&  pagination_count('orders', 10) + 1  == $_GET['page'])) echo "disabled" ?>">
          <a class="page-link" href="<?= base_url() ?>admin/order?page=<?php if (isset($_GET['page'])) echo $_GET['page'] + 1;
                                                                        else echo 2 ?>" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
        </li>
      </ul>
    </nav>
  </div>
</div>

<?php
include(BASEPATH . "/App/Views/Backend/order/script.php");
include_once BASEPATH  . 'App/Views/Backend/layouts/include/ckeditor.php';
?>