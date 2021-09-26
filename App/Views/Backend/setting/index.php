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
            <a href="<?= base_url() ?>admin/setting/create" type="button" class="mr-2 shadow-sm btn btn-success "  " >
              ایجاد تنظیمات
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