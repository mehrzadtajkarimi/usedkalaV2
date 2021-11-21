<script src='<?= asset_url() ?>Backend/plugins/ckeditor/ckeditor.js'></script>
<div class="card ">
  <div class="p-0 shadow-sm card-body">
    <div class="card-header">
      <div class="row">
        <div class="col-4">
          <h3 class="p-3 card-title"> لیست مجوزها</h3>
        </div>
        <div class="offset-4"> </div>
        <div class="col-4">
          <div class="input-group input-group-sm">
            <input type="text" name="table_search" class="float-right form-control" placeholder="جستجو">
            <div class="input-group-append">
              <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
            </div>

            <!-- Button trigger modal -->
            <a href="<?= base_url() ?>admin/permission/create" type="button" class="mr-2 shadow-sm btn btn-success " data-toggle="modal" data-target="#exampleModalCenter">
              ایجاد مجوزها
            </a>


            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
              <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-body">
                    <form action="<?= base_url() ?>admin/permission" method="post" enctype="multipart/form-data">
                      <div class="form-group row">
                        <label for="permission-name" class="col-2 col-form-label"> نام </label>
                        <div class="col-10">
                          <input name="permission-name" type="text" class="form-control" id="permission-name" placeholder="" required>
                        </div>
                      </div>
                     
                      <hr>
                      <div class="pt-2 pb-2 form-check disabled ">
                        <input name="permission-status" type="checkbox" class="form-check-input " id="permission-status" checked disabled>
                        <label class="form-check-label" for="permission-status">
                          وضعیت
                        </label>
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

              </tr>
            </thead>
            <tbody>

                <tr>
                  <td class="text-center" title=""></td>
                </tr>

            </tbody>
          </table>

        </div>
      </div>
    </div>
  </div>
</div>
<?php include(BASEPATH . "/App/Views/Backend/permission/script.php") ?>