<script src='<?= asset_url() ?>Backend/plugins/ckeditor/ckeditor.js'></script>
<div class="card ">
  <div class="p-0 shadow-sm card-body">
    <div class="card-header">
      <div class="row">
        <div class="col-4">
          <h3 class="p-3 card-title"> لیست ادمین ها</h3>
        </div>
        <div class="offset-4"> </div>
        <div class="col-4">
          <div class="input-group input-group-sm">
            <input type="text" name="table_search" class="float-right form-control" placeholder="جستجو">
            <div class="input-group-append">
              <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
            </div>

            <!-- Button trigger modal -->
            <a href="<?= base_url() ?>admin/access/create" type="button" class="mr-2 shadow-sm btn btn-success " data-toggle="modal" data-target="#exampleModalCenter">
              ایجاد ادمین ها
            </a>


            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
              <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-body">
                    <form action="<?= base_url() ?>admin/access" method="post" enctype="multipart/form-data">

                      <div class="form-group row">
                        <label for="access-phone" class="col-2 col-form-label"> شماره موبایل </label>
                        <div class="col-9">
                          <input name="access-phone" type="text" class="form-control" id="access-phone" placeholder="" required>
                        </div>

                        <a class="btn btn-primary d-inline col-1 " href="#" role="button" title="استعلام شماره">
                          <i class="fa fa-refresh" aria-hidden="true"></i>
                        </a>
                      </div>

                      <hr>
                      <div class="pt-3 pb-2 form-check disabled ">
                        <input name="access-status" type="checkbox" class="form-check-input pt-2" id="access-status"  onclick="return confirm('آیا برای ایجاد دسترسی به اطلاعات اطمینان دارید');" >
                        <label class="form-check-label" for="access-status" >
                          وضعیت
                        </label>
                      </div>
                      <button type="submit" class="float-left btn btn-primary btn-block" onclick="return confirm('آیا برای ذخیره ایجاد دسترسی به اطلاعات اطمینان دارید');">ذخیره </button>
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
                <th class="text-center" scope="col">نام</th>
                <th class="text-center" scope="col">توضیح</th>
                <th class="text-center" scope="col">اقدامات</th>

              </tr>
            </thead>
            <tbody>

              <?php foreach ($roles as $value) : ?>
                <tr>
                  <td class="text-center" title=""><?= $value['id'] ?></td>
                  <td class="text-center" title=""><?= $value['name'] ?></td>
                  <td class="text-center" title=""><?= $value['label'] ?></td>
                  <td class="text-center">
                    <a href="<?= base_url() ?>admin/access/<?= $value['id'] ?>/edit" class="shadow-sm btn btn-warning btn-sm " style="padding: 0px 16px; border-radius: 18px;">ویرایش</a>
                    <form method="post" action="<?= base_url() ?>admin/access/<?= $value['id'] ?>" class="d-inline">
                      <input type="hidden" name="_method" value="delete" />
                      <input type="submit" class="shadow-sm btn btn-danger btn-sm " style="padding: 0px 20px; border-radius: 18px;" onclick="return confirm('آیا برای حذف اطلاعات اطمینان دارید');" value="حذف">
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
<?php include(BASEPATH . "/App/Views/Backend/access/script.php") ?>