<div class="card ">
  <div class="p-0 shadow-sm card-body">
    <div class="card-header">
      <div class="row">
        <div class="col-4">
          <h3 class="p-3 card-title">لیست دسته بندی های <?= $type_persian ?></h3>
        </div>
        <div class="offset-4"> </div>
        <div class="col-4">
          <div class="input-group input-group-sm">
            <input type="text" name="table_search" class="float-right form-control" placeholder="جستجو">
            <div class="input-group-append">
              <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
            </div>


            <button type="button" class="btn btn-success shadow-sm mr-2  " data-toggle="modal" data-target="#exampleModalCenter">
              ایجاد دسته اصلی
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
              <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-body">
                    <form action="<?= base_url() ?>admin/category/0/product" method="post" enctype="multipart/form-data">
                      <div class="form-group row">
                        <label for="title" class="col-sm-2 col-form-label">Title</label>
                        <div class="col-sm-10">
                          <input name="seo_title" type="text" class="form-control" id="title" placeholder="جهت نمایش در title جستجو " >
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="seo_description" class="col-sm-2 col-form-label">Description</label>
                        <div class="col-sm-10">
                          <input name="seo_description" type="text" class="form-control" id="seo_description" placeholder="جهت نمایش در description جستجو " autofocus>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">نام</label>
                        <div class="col-sm-10">
                          <input name="name" type="text" class="form-control" id="inputEmail3" placeholder="نام زیر دسته را وارد نمایید" autofocus>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="slug" class="col-2 col-form-label">slug</label>
                        <div class="col-10">
                          <input name="slug" type="text" class="form-control" id="slug" placeholder="نامه دسته بندی جهت نمایش در url" required>
                        </div>
                      </div>

                      <div class="form-group row">
                        <label for="H1" class="col-2 col-form-label">H1</label>
                        <div class="col-10">
                          <input name="H1" type="text" class="form-control" id="H1" placeholder="ترجیحا بین 20 تا 70 کاراکتر" required>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="canonical" class="col-2 col-form-label">Canonical</label>
                        <div class="col-10">
                          <input name="canonical" type="text" class="form-control" id="Canonical" placeholder="لینک را وارد نمایید">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="description" class="col-2 col-form-label"> درباره دسته بندی </label>
                        <div class="col-10">
                          <textarea name="description" type="text" class="form-control" id="description" maxlength="120" placeholder="حد اکثر 120 کاراکتر" rows="3" required></textarea>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="slug" class="col-2 col-form-label">عکس</label>
                        <div class="col-10">
                          <div class="custom-file">
                            <input name="image_category" type="file" class="custom-file-input" id="image">
                            <label class="custom-file-label" for="image">Choose file</label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="robots" class="col-2 col-form-label">robots</label>
                        <div class="col-10">
                          <select name='robot' id="robots" class="form-control ">
                            <?php foreach ($robots as $key => $value) : ?>
                              <option value="<?= $key ?>"><?= $value ?></option>
                            <?php endforeach; ?>
                          </select>
                        </div>
                      </div>
                      <div class="pt-2 pb-2 form-check">
                        <input value="1" name="status" type="checkbox" class="form-check-input" id="status" checked>
                        <label class="form-check-label" for="status">
                          وضعیت
                        </label>
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
          <ul class="list-group">
            <?php
            foreach ($categories as $value) :
            ?>
              <li class="list-group-item  <?= $value['parent'] == 0 ? 'bg-light font-weight-bold mt-3' : '' ?>">
                <div class="row">
                  <div class="col">
                    <span class="ml-4"><?= $value['name'] ?></span>
                  </div>
                  <div class="col">
                    <a href="<?= base_url() ?>admin/category/<?= $value['id'] ?>/edit/product" class="btn btn-warning btn-sm shadow-sm " style="padding: 0px 16px; border-radius: 18px;">ویرایش</a>
                    <a href="<?= base_url() ?>admin/category/<?= $value['id'] ?>/create/product" class="btn btn-success btn-sm shadow-sm" style="padding: 0px 20px; border-radius: 18px;">ایجاد زیردسته</a>
                    <form method="post" action="<?= base_url() ?>admin/category/<?= $value['id'] ?>/product" class="d-inline">
                      <input type="hidden" name="_method" value="delete" />
                      <input type="submit" class="btn btn-danger btn-sm shadow-sm " style="padding: 0px 20px; border-radius: 18px;" onclick="return confirm('آیا برای حذف اطلاعات اطمینان دارید');" value="حذف">
                    </form>
                  </div>
                </div>
              </li>
            <?php
            endforeach;
            ?>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
<?php include(BASEPATH . "/App/Views/Backend/category/product/script.php") ?>