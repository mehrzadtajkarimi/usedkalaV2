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
          </div>
        </div>
      </div>
    </div>
    <div class="p-0 card-body table-responsive">
      <div class="card ">
        <div class="card-body">

          <table class="table table-hover ">
            <!-- <thead>
              ddd
            </thead> -->

            <tbody>

              <tr>
                <th class="text-center" scope="col">#</th>
                <th class="text-center" scope="col">نام</th>
                <th class="text-center" scope="col">توضیح</th>
                <th class="text-center" scope="col">اقدامات</th>
              </tr>
              <?php foreach ($admins as $value) : ?>
                <tr>
                  <td class="text-center" title=""><?= $value['id'] ?></td>
                  <td class="text-center" title=""><?= $value['first_name'] . ' ' . $value['last_name'] ?></td>
                  <td class="text-center" title=""><?= $value['phone'] ?></td>
                  <td class="text-center">
                    <form method="post" action="<?= base_url() ?>admin/access/<?= $value['id'] ?>" class="d-inline">
                      <input type="hidden" name="_method" value="delete" />
                      <input type="submit" class="shadow-sm btn btn-danger btn-sm " style="padding: 0px 40px; border-radius: 18px;" onclick="return confirm('آیا برای حذف اطلاعات اطمینان دارید');" value="حـــــــذف">
                    </form>
                    <a data-id="<?= $value['id'] ?>" type="button" id="access-show" class="shadow-sm btn btn-warning btn-sm " style="padding: 0px 16px; border-radius: 18px;" data-toggle="collapse" data-target="#more<?= $value['id'] ?>" aria-expanded="false" aria-controls="more">نمایش و ویرایش</a>
                  </td>
                </tr>
                <tr class="collapse multi-collapse " id="more<?= $value['id'] ?>">
                  <td colspan="10" id="attr">
                    <div class="row">
                      <div class="col" id="response-permission">
                        <ul class="list-group list-group-flush">
                          <li class="list-group-item">

                          </li>
                        </ul>
                      </div>
                      <div class="col" id="response-role">
                        <ul class="list-group list-group-flush">
                          <li class="list-group-item">

                          </li>
                        </ul>
                      </div>
                      <pre class="ltr text-left col">
  dd
                      </pre>
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
<?php include(BASEPATH . "/App/Views/Backend/access/script.php") ?>