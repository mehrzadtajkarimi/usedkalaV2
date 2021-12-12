<script src='<?= asset_url() ?>Backend/plugins/ckeditor/ckeditor.js'></script>

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
                <th class="text-center" scope="col">نمایش</th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($orders as $value) : ?>
                <tr>
                  <td class="text-center"><?= $value['user_full_name'] ?></td>
                  <td class="text-center"><?= $value['user_phone'] ?></td>
                  <td class="text-center" style="height: 118px;">
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
                    <div class="check-handler" style="display: <?= $value['status'] == 1 ? 'block'  : 'none' ?> ; ">
                      <div class="row ">
                        <div class="offset-3"></div>
                        <div class="col-3">
                          <p> رسیدگی </p>
                        </div>
                        <div class="col-3">
                          <label class="chkbx">
                            <input class="check-box-handler check-box-handler-<?= $value['id'] ?>" data-id="<?= $value['id'] ?>" <?= $value['status'] != 1 ? 'checked' : '' ?> onclick="return confirm(' آیا برای تغییر وضعیت اطلاعات اطمینان دارید... \n بعد از تغییر وضعیت به حالت بررسی \nبه نام شما ثبت شده و دیگر امکان بازگشت وجود نخواهد داشت ');" type="checkbox">
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
                        </div>
                        <div class="col-3">
                          <label class="chkbx">
                            <input class="check-box-sender check-box-sender-<?= $value['id'] ?>" data-id="<?= $value['id'] ?>" <?= $value['status'] != 1 ? 'checked' : '' ?> onclick="return confirm(' آیا برای تغییر وضعیت اطلاعات اطمینان دارید... \n بعد از تغییر وضعیت به حالت بررسی \nبه نام شما ثبت شده و دیگر امکان بازگشت وجود نخواهد داشت ');" type="checkbox">
                            <span class="x"></span>
                          </label>
                        </div>
                      </div>
                    </div>
                    <div class="check-delivery" style="display: <?= $value['status'] == 2 ? 'block'  : 'none' ?> ; ">
                      <div class="row">
                        <div class="offset-3"></div>
                        <div class="col-3">
                          <p> تحویل </p>
                        </div>
                        <div class="col-3">
                          <label class="chkbx">
                            <input class="check-box-sender check-box-sender-<?= $value['id'] ?>" data-id="<?= $value['id'] ?>" <?= $value['status'] != 1 ? 'checked' : '' ?> onclick="return confirm(' آیا برای تغییر وضعیت اطلاعات اطمینان دارید... \n بعد از تغییر وضعیت به حالت بررسی \nبه نام شما ثبت شده و دیگر امکان بازگشت وجود نخواهد داشت ');" type="checkbox">
                            <span class="x"></span>
                          </label>
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
                    <?php else : ?>
                      <td></td>
                    <?php endif; ?>

                    <td class="text-center">
                      <button data-id="<?= $value['id'] ?>" data-target="#collapse<?= $value['id'] ?>" class="shadow-sm access-show btn btn-warning btn-sm" style="padding: 0px 16px; border-radius: 18px;">
                        نـمایــــــش
                      </button>
                    </td>
                  <?php else : ?>
                    <td></td>
                    <td></td>
                    <td></td>
                  <?php endif; ?>
                </tr>
                <tr id="collapse<?= $value['id'] ?>" class="target-collapse" style="display: none">
                  <td colspan="10" id="attr">
                    <div class="row">
                      <div class="col">
                        <ul class="list-group list-group-flush">
                          <li class="list-group-item" id="response-order-<?= $value['id'] ?>">

                          </li>
                        </ul>
                      </div>
                    </div>
                  </td>
                </tr>
              <?php endforeach; ?>

            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>

<?php include(BASEPATH . "/App/Views/Backend/order/script.php") ?>