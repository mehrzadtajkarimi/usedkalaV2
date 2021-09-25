<script src="<?= asset_url() ?>Backend/plugins/tinymce/tinymce.min.js" referrerpolicy="origin"></script>
<div class="card ">
  <div class="p-0 shadow-sm card-body">
    <div class="card-header">
      <div class="row">
        <div class="col-4">
          <h3 class="p-3 card-title"> لیست برند</h3>
        </div>
        <div class="offset-4"> </div>
        <div class="col-4">
          <div class="input-group input-group-sm">
            <input type="text" name="table_search" class="float-right form-control" placeholder="جستجو">
            <div class="input-group-append">
              <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
            </div>

            <!-- Button trigger modal -->
            <a type="button" class="mr-2 shadow-sm btn btn-success " data-toggle="modal" data-target="#exampleModalCenter">
              ایجاد تنظیمات
            </a>


            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
              <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-body">
                    <form action="<?= base_url() ?>admin/setting" method="post" enctype="multipart/form-data">
                      <div class="form-group ">
                        <label for="key" class=" col-form-label"> موضوع </label>
                        <input name="key" type="text" class="form-control" id="key" placeholder="" required>
                      </div>
                      <div class="form-group ">
                        <textarea name="value" id="mytextarea">Hello, World!</textarea>
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
  </div>
  <div class="p-0 card-body table-responsive">
    <div class="card ">
      <div class="card-body">
        <table class="table table--vertical_middle ">
          <thead>
            <tr>
              <th class="text-center" scope="col">نام</th>
              <th class="text-center" scope="col">نمایش</th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($settings as $value) : ?>
              <tr>
                <td class="text-center"><?= $value['key'] ?></td>
                <td class="text-center">
                  <a href="<?= base_url() ?>admin/setting/<?= $value['id'] ?>/edit" type="button" class="btn btn-success shadow-sm mr-2  ">
                    ویرایش
                  </a>
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

<?php include(BASEPATH . "/App/Views/Backend/setting/script.php") ?>