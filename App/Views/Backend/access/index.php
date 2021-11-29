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
              <?php foreach ($admins as $value) : ?>
                <tr>
                  <td class="text-center" title=""><?= $value['id'] ?></td>
                  <td class="text-center" title=""><?= $value['first_name'] . ' ' . $value['last_name'] ?></td>
                  <td class="text-center" title=""><?= $value['phone'] ?></td>
                  <td class="text-center">
                    <!-- Button trigger modal -->
                    <!-- <div> -->

                    <div>
                      <button type="button" id="add-permission" class="shadow-sm btn btn-success btn-sm" style="padding: 0px 30px; border-radius: 18px;" data-toggle="modal" data-target="#add_permission">
                        ایجـــــــــاد مجـوز
                      </button>
                      <!-- Modal permission-->
                      <div class="modal fade" id="add_permission" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <div class="modal-body">
                              <form action="<?= base_url() ?>/admin/access/add_access/role/<?= $value['id'] ?>" method="post" class="p-1">
                                <div class="row">
                                  <div class="form-group col">
                                    <label class=" col-form-label" for="access-permission"> دسته بندی</label>
                                    <select name='access-permission[]' id="access-permission" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                                      <?php foreach ($permissions as $value) : ?>
                                        <option value="<?= $value['id'] ?>"><?= $value['name'] ?></option>
                                      <?php endforeach; ?>
                                    </select>
                                  </div>
                                </div>
                                <button type="submit" class="float-left btn btn-primary btn-block">ذخیره </button>
                              </form>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div>
                      <button type="button" id="add-role" class="shadow-sm btn btn-success btn-sm" style="padding: 0px 30px; border-radius: 18px;" data-toggle="modal" data-target="#add_role">
                        ایجـــــــــاد سمت
                      </button>
                      <!-- Modal role-->
                      <div class="modal fade" id="add_role" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <div class="modal-body">
                              <form action="<?= base_url() ?>/admin/access/add_access/role/<?= $value['id'] ?>" method="post" class="p-1">
                                <div class="row">
                                  <div class="form-group col">
                                    <label class=" col-form-label" for="access-role"> دسته بندی</label>
                                    <select name='access-role[]' id="access-role" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                                      <?php foreach ($roles as $value) : ?>
                                        <option value="<?= $value['id'] ?>"><?= $value['name'] ?></option>
                                      <?php endforeach; ?>
                                    </select>
                                  </div>
                                </div>
                                <button type="submit" class="float-left btn btn-primary btn-block">ذخیره </button>
                              </form>
                            </div>
                          </div>
                        </div>
                      </div>

                    </div>




                    <form method="post" action="<?= base_url() ?>admin/access/<?= $value['id'] ?>" class="d-inline">
                      <input type="hidden" name="_method" value="delete" />
                      <input type="submit" class="shadow-sm btn btn-danger btn-sm " style="padding: 0px 16px; border-radius: 18px;" onclick="return confirm('آیا برای حذف اطلاعات اطمینان دارید');" value="حـذف">
                    </form>
                    <a data-id="<?= $value['id'] ?>" type="button" id="access-show" class="shadow-sm btn btn-warning btn-sm " style="padding: 0px 16px; border-radius: 18px;" data-toggle="collapse" data-target="#more<?= $value['id'] ?>" aria-expanded="false" aria-controls="more">نمایش </a>
                  </td>
                </tr>
                <tr class="collapse multi-collapse " id="more<?= $value['id'] ?>">
                  <td colspan="10" id="attr">
                    <div class="row">
                      <a href="<?= base_url() ?>">
                        <i class="fa fa-plus-square text-success" aria-hidden="true"></i>
                      </a>
                    </div>
                    <div class="row">
                      <span>سطوح دسترسی :</span>
                      <div class="col" id="response-permission">
                        <ul class="list-group list-group-flush">
                          <li class="list-group-item">

                          </li>
                        </ul>
                      </div>
                      <span>نقش :</span>
                      <div class="col" id="response-role">
                        <ul class="list-group list-group-flush">
                          <li class="list-group-item">

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