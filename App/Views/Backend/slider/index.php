<div class="card ">
  <div class="p-0 shadow-sm card-body">
    <div class="card-header">
      <div class="row">
        <div class="col-4">
          <h3 class="p-3 card-title"> لیست اسلایدر</h3>
        </div>
        <div class="offset-4"> </div>
        <div class="col-4">
          <div class="input-group input-group-sm">
            <input type="text" name="table_search" class="float-right form-control" placeholder="جستجو">
            <div class="input-group-append">
              <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
            </div>
            <!-- Button trigger modal -->
            <a href="<?= base_url() ?>admin/slider/create" type="button" class="mr-2 shadow-sm btn btn-success " data-toggle="modal" data-target="#exampleModalCenter">
              ایجاد اسلایدر
            </a>
            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
              <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-body">
                    <form action="<?= base_url() ?>admin/slider" method="post" class="p-1" enctype="multipart/form-data">
                      <input type="hidden" name="code" value="<?= rand(100000, 999999) ?>">

                      <div class="row">
                        <div class="col">
                          <div class="form-group ">
                            <label for="slider-small"> موضوع</label>
                            <input name="slider-small" type="text" class="form-control" id="slider-small" rows="1" placeholder="">
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col">
                          <div class="form-group" id="dd">
                            <label for="slider-description" class="col-form-label"> متن </label>
                            <textarea name="slider-description" type="text" class="form-control" id="slider-description " placeholder="" rows="7"></textarea>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col">
                          <div class="form-group ">
                            <label for="slug" class="col-form-label">عکس</label>
                            <div class="card-block row">
                              <div class="flex-row d-flex w-100 " id="coba"></div>
                            </div>
                          </div>
                        </div>
                      </div>

                      <div class="row">
                        <div class="col-3">
                          <div class="pt-1 pb-4  form-check">
                            <input class="form-check-input" type="radio" name="linktype" id="slider-status-link" value="link" checked>
                            <label class="form-check-label" for="slider-status-link">
                              لینک
                            </label>
                          </div>
                        </div>
                        <div class=" col-9">
                          <div class="form-group ">
                            <input name="slider-link" type="text" class="form-control" id="input_slider-link" required>
                          </div>
                        </div>
                      </div>

                      <div class="row">
                        <div class="col-3">
                          <div class="pt-1 pb-4  form-check">
                            <input class="form-check-input" type="radio" name="linktype" id="slider-status-category" value="category">
                            <label class="form-check-label" for="slider-status-category">
                              دسته بندی انتخابی
                            </label>
                          </div>
                        </div>
                        <div class=" col-9">
                          <div class="form-group ">
                            <select name='category_id' id="slider_category" class=" form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                              <?php foreach ($categories as $value) : ?>
                                <option value="<?= $value['id'] ?>"><?= $value['name'] ?></option>
                              <?php endforeach; ?>
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-3">
                          <div class="pt-1 pb-4  form-check">
                            <input class="form-check-input" type="radio" name="linktype" id="slider-status-product" value="product">
                            <label class="form-check-label" for="slider-status-product">
                              محصول انتخابی
                            </label>
                          </div>
                        </div>
                        <div class=" col-9">
                          <select name="product_id" id="slider_product" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                            <?php foreach ($products as $value) : ?>
                              <option value="<?= $value['id'] ?>"><?= $value['title'] ?></option>
                            <?php endforeach; ?>
                          </select>
                        </div>
                      </div>

                      <div class="pt-1 pb-4 form-check disabled ">
                        <input name="slider-status" type="checkbox" class="form-check-input " id="slider-status" checked>
                        <label class="form-check-label" for="slider-status">
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
  </div>
  <div class="p-0 card-body table-responsive">
    <div class="card ">
      <div class="card-body">

        <table class="table table--vertical_middle ">
          <thead>
            <tr>
              <th class="text-center" scope="col">#</th>
              <th class="text-center" scope="col">موضوع</th>
              <th class="text-center" scope="col">محصول</th>
              <th class="text-center" scope="col">دسته بندی</th>
              <th class="text-center" scope="col">توضیحات</th>
              <th class="text-center" scope="col">وضعیت</th>
              <th class="text-center" scope="col">مشاهده</th>
              <th class="text-center" scope="col"> اصلاحات</th>
            </tr>
          </thead>
          <tbody>
            <?php
            // $count = 0;
            foreach ($sliders as $key => $value) :
            ?>
              <tr>
                <td class="text-center" title="ردیف"><?= floor(pagination_total_count(10, $key)) + 1 ?></td>
                <td class="text-center"><?= $value['small_text'] ?></td>
                <td class="text-center"><?= $value['product_id'] ?></td>
                <td class="text-center"><?= $value['category_id'] ?></td>
                <td class="text-center"><?= $value['description'] ?></td>
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
                  <a href="<?= base_url() ?>admin/slider/<?= $value['id'] ?>/edit" class=" shadow-sm btn btn-warning btn-sm p-0 pr-2 pl-2" style=" border-radius: 18px;">ویــرایـش</a>
                  <form method="post" action="<?= base_url() ?>admin/slider/<?= $value['id'] ?>" class="d-inline">
                    <input type="hidden" name="_method" value="delete" />
                    <input type="submit" class=" shadow-sm btn btn-danger btn-sm p-0 pr-2 pl-2" style="border-radius: 18px;" onclick="return confirm('آیا برای حذف اطلاعات اطمینان دارید');" value="حــــــــذف">
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
    <p class="text-muted font-italic pr-4">لیست اسلایدر صفحه اصلی</p>
  </div>
  <nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">
      <li class="page-item <?php if (pagination_count('sliders', 10) + 1 == 1 || (isset($_GET['page']) && $_GET['page'] == 1) || !isset($_GET['page'])) echo "disabled" ?>">
        <a class="page-link" href="<?= base_url() ?>admin/slider?page=<?php if (isset($_GET['page']) && $_GET['page'] > 1) echo $_GET['page'] - 1; ?> " aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
          <span class="sr-only">Previous</span>
        </a>
      </li>
      <?php for ($i = 0; $i <=  pagination_count('sliders', 10); $i++) : ?>
        <li class="page-item <?php if (isset($_GET['page']) && $_GET['page'] == ($i + 1)) echo "active"; else if (!isset($_GET['page']) && ($i + 1) == 1) echo "active" ?>">
          <a class="page-link" href="<?= base_url() ?>admin/slider?page=<?= $i + 1 ?>"><?= $i + 1 ?></a>
        </li>
      <?php endfor; ?>
      <li class="page-item <?php if (pagination_count('sliders', 10) + 1 == 1 || (isset($_GET['page']) &&  pagination_count('sliders', 10) + 1  == $_GET['page'])) echo "disabled" ?>">
        <a class="page-link" href="<?= base_url() ?>admin/slider?page=<?php if (isset($_GET['page'])) echo $_GET['page'] + 1; else echo 2 ?>" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
          <span class="sr-only">Next</span>
        </a>
      </li>
    </ul>
  </nav>
</div>
</div>
<?php include(BASEPATH . "/App/Views/Backend/slider/script.php") ?>