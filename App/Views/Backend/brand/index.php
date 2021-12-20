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
            <a href="<?= base_url() ?>admin/brand/create" type="button" class="btn btn-success shadow-sm mr-2  " data-toggle="modal" data-target="#exampleModalCenter">
              ایجاد برند
            </a>


            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
              <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-body">
                    <form action="<?= base_url() ?>admin/brand" method="post" enctype="multipart/form-data">

                      <div class="form-group row">
                        <label for="brand-name" class="col-2 col-form-label"> نام </label>
                        <div class="col-10">
                          <input name="brand-name" type="text" class="form-control" id="brand-name" placeholder="" required>
                        </div>
                      </div>

                      <?php /*
                      <div class="form-group row">
                        <label class="col-2 col-form-label" for="brand-brand">اولویت </label>
                        <div class="col-10">
                          <select name='brand-sort' class="form-control" id="brand-brand">
                            <?php for ($i = 0; $i < 20; $i++) : ?>
                              <option value="<?= $i ?>"><?= $i ?></option>
                            <?php endfor; ?>
                          </select>
                        </div>
                      </div> */ ?>

                      <div class="form-group row">
                        <label for="slug" class="col-2 col-form-label">عکس</label>
                        <div class="col-10">
                          <div class="custom-file">
                            <input name="brand_image" type="file" class="custom-file-input" id="brand-image">
                            <label class="custom-file-label" for="brand-image">Choose file</label>
                          </div>
                        </div>
                      </div>
                      <button type="submit" class="btn btn-primary float-left btn-block">ذخیره </button>
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
                <th class="text-center" scope="col">اصلاحات</th>
              </tr>
            </thead>
            <tbody>
              <?php
              // $count = 0;
              foreach ($brands as $key => $value) :
              ?>
                <tr>
                  <td class="text-center"><?= floor(pagination_total_count(10, $key)) + 1 ?></td>
                  <td class="text-center"><?= $value['name'] ?></td>
                  <td class="text-center">
                    <a href="<?= base_url() ?>admin/brand/<?= $value['id'] ?>/edit" class="btn btn-warning btn-sm shadow-sm " style="padding: 0px 16px; border-radius: 18px;">ویرایش</a>
                    <form method="post" action="<?= base_url() ?>admin/brand/<?= $value['id'] ?>" class="d-inline">
                      <input type="hidden" name="_method" value="delete" />
                      <input type="submit" class="btn btn-danger btn-sm shadow-sm " style="padding: 0px 20px; border-radius: 18px;" onclick="return confirm('آیا برای حذف اطلاعات اطمینان دارید');" value="حذف">
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
    </div>
    <nav aria-label="Page navigation example">
      <ul class="pagination justify-content-center">
        <li class="page-item <?php if (pagination_count('brands', 10) + 1 == 1 || (isset($_GET['page']) && $_GET['page'] == 1) || !isset($_GET['page'])) echo "disabled" ?>">
          <a class="page-link" href="<?= base_url() ?>admin/brand?page=<?php if (isset($_GET['page']) && $_GET['page'] > 1) echo $_GET['page'] - 1; ?> " aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
        </li>
        <?php for ($i = 0; $i <=  pagination_count('brands', 10); $i++) : ?>
          <li class="page-item <?php if (isset($_GET['page']) && $_GET['page'] == ($i + 1)) echo "active"; else if (!isset($_GET['page']) && ($i + 1) == 1) echo "active" ?>">
            <a class="page-link" href="<?= base_url() ?>admin/brand?page=<?= $i + 1 ?>"><?= $i + 1 ?></a>
          </li>
        <?php endfor; ?>
        <li class="page-item <?php if (pagination_count('brands', 10) + 1 == 1 || (isset($_GET['page']) &&  pagination_count('brands', 10) + 1  == $_GET['page'])) echo "disabled" ?>">
          <a class="page-link" href="<?= base_url() ?>admin/brand?page=<?php if (isset($_GET['page'])) echo $_GET['page'] + 1; else echo 2 ?>" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
        </li>
      </ul>
    </nav>
  </div>
</div>