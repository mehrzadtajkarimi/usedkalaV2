<div class="card ">
  <div class="p-0 shadow-sm card-body">
    <div class="card-header">
      <div class="row">
        <div class="col-4">
          <h3 class="p-3 card-title">لیست پست‌های وبلاگ</h3>
        </div>
        <div class="offset-4"> </div>
        <div class="col-4">
          <div class="input-group input-group-sm">
            <input type="text" name="table_search" class="float-right form-control" placeholder="جستجو">
            <div class="input-group-append">
              <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
            </div>

            <!-- Button trigger modal -->
            <a href="<?= base_url() ?>admin/blog/create" type="button" class="mr-2 shadow-sm btn btn-success">
              ایجاد پست جدید
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
                <th class="text-center" scope="col">عنوان</th>
                <th class="text-center" scope="col">نمایش</th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($blogs as $value) : ?>
                <tr>
                  <td class="text-center"><?= $value['title'] ?></td>
                  <td class="text-center">
                    <a href="<?= base_url() ?>admin/blog/<?= $value['id'] ?>/edit" type="button" class="shadow-sm btn btn-success btn-sm " style="padding: 0px 20px; border-radius: 18px;">
                      ویرایش
                    </a>
                    <form method="post" action="<?= base_url() ?>admin/blog/<?= $value['id'] ?>" class="d-inline">
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
    <nav aria-label="Page navigation example">
      <ul class="pagination justify-content-center">
        <li class="page-item <?php if (pagination_count('blogs', 10) + 1 == 1 || (isset($_GET['page']) && $_GET['page'] == 1) || !isset($_GET['page'])) echo "disabled" ?>">
          <a class="page-link" href="<?= base_url() ?>admin/blog?page=<?php if (isset($_GET['page']) && $_GET['page'] > 1) echo $_GET['page'] - 1; ?> " aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
        </li>
        <?php for ($i = 0; $i <= pagination_count('blogs', 10); $i++) : ?>
          <li class="page-item <?php if (isset($_GET['page']) && $_GET['page'] == ($i + 1)) echo "active"; else if (!isset($_GET['page']) && ($i + 1) == 1) echo "active" ?>">
            <a class="page-link" href="<?= base_url() ?>admin/blog?page=<?= $i + 1 ?>"><?= $i + 1 ?></a>
          </li>
        <?php endfor; ?>
        <li class="page-item <?php if (pagination_count('blogs', 10) + 1 == 1 || (isset($_GET['page']) && pagination_count('blogs', 10) + 1  == $_GET['page'])) echo "disabled" ?>">
          <a class="page-link" href="<?= base_url() ?>admin/blog?page=<?php if (isset($_GET['page'])) echo $_GET['page'] + 1; else echo 2 ?>" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
        </li>
      </ul>
    </nav>
  </div>
</div>

<?php
include(BASEPATH . "/App/Views/Backend/blog/script.php");
// include_once BASEPATH  . 'App/Views/Backend/layouts/include/ckeditor.php';
?>