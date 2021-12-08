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

            <!-- Button trigger modal -->
            <a href="<?= base_url() ?>admin/order/create" type="button" class="mr-2 shadow-sm btn btn-success ">
              ایجاد سفارش
            </a>


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
                <th class="text-center" scope="col">نمایش</th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($orders as $value) : ?>
                <tr>
                  <td class="text-center"><?= $value['user_full_name'] ?></td>
                  <td class="text-center"><?= $value['user_phone'] ?></td>
                  <td class="text-center">
                    <button data-id="<?= $value['id'] ?>" data-target="#collapse<?= $value['id'] ?>" class="shadow-sm button-collapse access-show btn btn-warning btn-sm" style="padding: 0px 16px; border-radius: 18px;">
                      نـمایــــــش
                    </button>

                    <a href="<?= base_url() ?>admin/order/<?= $value['id'] ?>/edit" type="button" class="shadow-sm btn btn-success btn-sm " style="padding: 0px 20px; border-radius: 18px;">
                      ویرایش
                    </a>
                    <form method="post" action="<?= base_url() ?>admin/order/<?= $value['id'] ?>" class="d-inline">
                      <input type="hidden" name="_method" value="delete" />
                      <input type="submit" class="shadow-sm btn btn-danger btn-sm " style="padding: 0px 20px; border-radius: 18px;" onclick="return confirm('آیا برای حذف اطلاعات اطمینان دارید');" value="حـــــذف">
                    </form>
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