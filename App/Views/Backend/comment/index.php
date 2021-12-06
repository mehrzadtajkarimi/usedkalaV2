<script src='<?= asset_url() ?>Backend/plugins/ckeditor/ckeditor.js'></script>

<div class="card ">
  <div class="p-0 shadow-sm card-body">
    <div class="card-header">
      <div class="row">
        <div class="col-4">
          <h3 class="p-3 card-title"> فهرست دیدگاه های ارسالی</h3>
        </div>
        <div class="offset-4"> </div>
        <div class="col-4">
          <div class="input-group input-group-sm">
            <input type="text" name="table_search" class="float-right form-control" placeholder="جستجو">
            <div class="input-group-append">
              <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
            </div>

            <!-- Button trigger modal -->
            <!-- <a href="<?= base_url() ?>admin/comment/create" type="button" class="mr-2 shadow-sm btn btn-success "  " >
              ایجاد کامنت
            </a> -->


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
                <th class="text-center" scope="col" style="width: 130px;">قسمت</th>
                <th class="text-center" scope="col">نام کاربر</th>
                <th class="text-center" scope="col">موضوع</th>
                <th class="text-center" scope="col">وضعیت</th>
                <th class="text-center" scope="col">اصلاحات</th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($comments as $value) : ?>
                <tr>
                  <td class="text-center"><?= $value['entity_type'] ?> / <?= $value['entity_name'] ?></td>
                  <td class="text-center"><?= $value['user_name'] != "" ? $value['user_name'] : 'کاربر مهمان' ?></td>
                  <td class="text-center"><?= $value['title'] ?></td>
                  <td class="text-center">
                      <i class="publish-status fa fa-thumbs-up <?= $value['status'] == 1 ? ' text-success' : 'text-secondary' ?> fa-2x pointer p-2" data-id="<?= $value['id'] ?>" data-status="1" title="انتشار دیدگاه" ></i>
                      <i class="reject-status fa fa-thumbs-down <?= $value['status'] == -1 ?' text-danger' : 'text-secondary' ?> fa-2x pointer p-2" data-id="<?= $value['id'] ?>" data-status="-1" title="عدم انتشار دیدگاه" ></i>
                  </td>
                  <td class="text-center">
                    <a href="<?= base_url() ?>admin/comment/<?= $value['id'] ?>" type="button" class="shadow-sm btn btn-info btn-sm " style="padding: 0px 20px; border-radius: 18px;">
                      پــــاســــــخ
                    </a>
                    <a href="<?= base_url() ?>admin/comment/<?= $value['id'] ?>/edit" type="button" class="shadow-sm btn btn-success btn-sm " style="padding: 0px 20px; border-radius: 18px;">
                      ویرایش
                    </a>
                    <form method="post" action="<?= base_url() ?>admin/comment/<?= $value['id'] ?>" class="d-inline">
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

<?php include(BASEPATH . "/App/Views/Backend/comment/script.php") ?>