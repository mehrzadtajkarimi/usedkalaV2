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
          <table class="table table-hover table--vertical_middle">
            <tbody class="">
              <tr>
                <th class="text-center" scope="col">#</th>
                <th class="text-center" scope="col">نام</th>
                <th class="text-center" scope="col">توضیح</th>
                <th class="text-center" scope="col">اقدامات</th>
              </tr>
              <?php foreach ($admins as $admin) : ?>
                <tr>
                  <td class="text-center" title=""><?= $admin['id'] ?></td>
                  <td class="text-center" title=""><?= $admin['first_name'] . ' ' . $admin['last_name'] ?></td>
                  <td class="text-center" title=""><?= $admin['phone'] ?></td>
                  <td class="text-center">
                    <p><?= $admin['id'] ?></p>
                    <!-- Button trigger modal -->
                    <!-- <div> -->

                    <div class="mb-1">
                      <button type="button" id="add-permission" class="shadow-sm btn btn-success btn-sm" style="padding: 0px 30px; border-radius: 18px;" data-toggle="modal" data-target="#add_permission_<?= $admin['id'] ?>">
                        ایجـــــــــاد مجـوز
                      </button>
                      <!-- Modal permission-->
                      <div class="modal fade" id="add_permission_<?= $admin['id'] ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                          <div class="modal-content">
                            <div class="modal-body">
                              <form action="<?= base_url() ?>admin/access/add_access/permission/<?= $admin['id'] ?>" method="post" class="p-1">
                                <div class="row">
                                  <div class="form-group col">
                                    <label class=" col-form-label" for="access-permission-<?= $admin['id'] ?>"> دسته بندی</label>
                                    <select name='access-permission[]' id="access-permission-<?= $admin['id'] ?>" class="access-permission form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                                      <?php foreach ($permissions as $value) : ?>
                                        <option value="<?= $value['id'] ?>"><?= $value['name'] ?></option>
                                      <?php endforeach; ?>
                                    </select>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col">
                                    <button type="submit" class="float-left btn btn-primary btn-block">ذخیره </button>
                                  </div>
                                  <div class="col">
                                    <a href="" class="float-right btn btn-danger btn-block">انصراف</a>
                                  </div>
                                </div>
                              </form>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="mb-1">
                      <button type="button" id="add-role" class="shadow-sm btn btn-success btn-sm" style="padding: 0px 30px; border-radius: 18px;" data-toggle="modal" data-target="#add_role_<?= $admin['id'] ?>">
                        ایجـــــــــاد سمت
                      </button>
                      <!-- Modal role-->
                      <div class="modal fade" id="add_role_<?= $admin['id'] ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                          <div class="modal-content">
                            <div class="modal-body">
                              <form action="<?= base_url() ?>admin/access/add_access/role/<?= $admin['id'] ?>" method="post" class="p-1">
                                <div class="row">
                                  <div class="form-group col">
                                    <label class=" col-form-label" for="access-role-<?= $admin['id'] ?>"> دسته بندی</label>
                                    <select name='access-role[]' id="access-role-<?= $admin['id'] ?>" class="access-role form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                                      <?php foreach ($roles as $value) : ?>
                                        <option value="<?= $value['id'] ?>"><?= $value['name'] ?></option>
                                      <?php endforeach; ?>
                                    </select>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col">
                                    <button type="submit" class="float-left btn btn-primary btn-block">ذخیره </button>
                                  </div>
                                  <div class="col">
                                    <a href="" class="float-right btn btn-danger btn-block">انصراف</a>
                                  </div>
                                </div>
                              </form>
                            </div>
                          </div>
                        </div>
                      </div>

                    </div>

                    <form method="post" action="<?= base_url() ?>admin/access/<?= $admin['id'] ?>" class="d-inline">
                      <input type="hidden" name="_method" value="delete" />
                      <input type="submit" class="shadow-sm btn btn-danger btn-sm " style="padding: 0px 16px; border-radius: 18px;" onclick="return confirm('آیا برای حذف اطلاعات اطمینان دارید');" value="حـذف">
                    </form>
                    <button data-id="<?= $admin['id'] ?>" data-target="#collapse<?= $admin['id'] ?>" class="button-collapse shadow-sm access-show btn btn-warning btn-sm" style="padding: 0px 16px; border-radius: 18px;">
                      نمایش
                    </button>
                  </td>
                </tr>
                <tr id="collapse<?= $admin['id'] ?>" class="target-collapse" style="display: none">
                  <td colspan="10" id="attr">
                    <div class="row">
                      <span>سطوح دسترسی :</span>
                      <div class="col" >
                        <ul class="list-group list-group-flush">
                          <li class="list-group-item" id="response-permission-<?= $admin['id'] ?>" >

                          </li>
                        </ul>
                      </div>
                      <span>نقش :</span>
                      <div class="col"  >
                        <ul class="list-group list-group-flush">
                          <li class="list-group-item" id="response-role-<?= $admin['id'] ?>">

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
<?php include(BASEPATH . "/App/Views/Backend/access/script.php") ?>