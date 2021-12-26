<div class="card ">
  <div class="p-0 shadow-sm card-body">
    <div class="card-header">
      <div class="row">
        <div class="col-4">
          <h3 class="p-3 card-title"> لیست تخفیفات</h3>
        </div>
        <div class="offset-4"> </div>
        <div class="col-4">
          <div class="input-group input-group-sm">
            <input type="text" name="table_search" class="float-right form-control" placeholder="جستجو">
            <div class="input-group-append">
              <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
            </div>
            <!-- Button trigger modal -->
            <a href="<?= base_url() ?>admin/discount/create" type="button" class="mr-2 shadow-sm btn btn-success ">
              ایجاد کوپن تخفیف
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
                <th class="text-center" scope="col">#</th>
                <th class="text-center" scope="col">کد</th>
                <th class="text-center" scope="col">موضوع</th>
                <th class="text-center" scope="col">میزان تخفیف</th>
                <th class="text-center" scope="col">توضیحات</th>
                <th class="text-center" scope="col">از تاریخ</th>
                <th class="text-center" scope="col">تا تاریخ</th>
                <th class="text-center" scope="col">وضعیت</th>
                <th class="text-center" scope="col">مشاهده</th>
                <th class="text-center" scope="col"> اصلاحات</th>
              </tr>
            </thead>
            <tbody>
              <?php
              // $count = 0;
              foreach ($discounts as $key=>$value) :
              ?>
                <tr>
                  <td class="text-center" title="ردیف"><?= floor(pagination_total_count(10, $key))+1 ?></td>
                  <td class="text-center"><?= $value['code'] ?></td>
                  <td class="text-center"><?= $value['title'] ?></td>
                  <td class="text-center"><?= $value['percent'] ?></td>
                  <td class="text-center"><?= $value['description'] ?></td>
                  <td class="text-center"><?= jdate('H:i Y/m/d ',strtotime($value['start_at'])) ?></td>
                  <td class="text-center"><?= jdate('H:i Y/m/d ',strtotime($value['finish_at'])) ?></td>
                  <td>
                    <div>
                      وضــــــــــعــیـت :
                      <?php if ($value['status'] == 1) : ?>
                        <i class="fa fa-check text-success "></i>
                      <?php else : ?>
                        <i class="fa fa-times text-danger "></i>
                      <?php endif; ?>
                    </div>
                    <div>
                      محصول ویژه :
                      <i class="fa fa-times text-danger"></i>
                    </div>
                  </td>
                  <td class="text-center">
                    <a href="" class="p-4">
                      <i class="fa fa-folder-open fa-2x text-muted" aria-hidden="true"></i>
                    </a>
                  </td>
                  <td class="text-center ">
                      <a href="<?= base_url() ?>admin/discount/<?= $value['id'] ?>/edit" class="p-0 pl-2 pr-2 shadow-sm btn btn-warning btn-sm" style=" border-radius: 18px;">ویــرایـش</a>
                      <form method="post" action="<?= base_url() ?>admin/discount/<?= $value['id'] ?>" class="d-inline">
                        <input type="hidden" name="_method" value="delete" />
                        <input type="submit" class="p-0 pl-2 pr-2 shadow-sm btn btn-danger btn-sm" style="border-radius: 18px;" onclick="return confirm('آیا برای حذف اطلاعات اطمینان دارید');" value="حــــــــذف">
                      </form>
                  </td>
                </tr>
              <?php
              endforeach;
              ?>
            </tbody>
          </table>

        </div>
      </div>
      <p class="pr-4 text-muted font-italic">برای به دست آوردن نام متا - تخفیف یا وزن با موس روی نقطه مورد نظر هاور کنید</p>
    </div>
    <nav aria-label="Page navigation example">
      <ul class="pagination justify-content-center">
        <li class="page-item <?php if (pagination_count('discounts', 10) + 1 == 1 || (isset($_GET['page']) && $_GET['page'] == 1) || !isset($_GET['page'])) echo "disabled" ?>">
          <a class="page-link" href="<?= base_url() ?>admin/discount?page=<?php if (isset($_GET['page']) && $_GET['page'] > 1) echo $_GET['page'] - 1; ?> " aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
        </li>
        <?php for ($i = 0; $i <=  pagination_count('discounts', 10); $i++) : ?>
          <li class="page-item <?php if (isset($_GET['page']) && $_GET['page'] == ($i + 1)) echo "active"; else if (!isset($_GET['page']) && ($i + 1) == 1) echo "active" ?>">
            <a class="page-link" href="<?= base_url() ?>admin/discount?page=<?= $i + 1 ?>"><?= $i + 1 ?></a>
          </li>
        <?php endfor; ?>
        <li class="page-item <?php if (pagination_count('discounts', 10) + 1 == 1 || (isset($_GET['page']) &&  pagination_count('discounts', 10) + 1  == $_GET['page'])) echo "disabled" ?>">
          <a class="page-link" href="<?= base_url() ?>admin/discount?page=<?php if (isset($_GET['page'])) echo $_GET['page'] + 1; else echo 2 ?>" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
        </li>
      </ul>
    </nav>
  </div>
</div>
<?php include(BASEPATH . "/App/Views/Backend/discount/script.php") ?>