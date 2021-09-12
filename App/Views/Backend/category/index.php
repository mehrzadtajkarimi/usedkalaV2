<div class="card ">
  <div class="p-0 shadow-sm card-body">
    <div class="card-header">
      <div class="row">
        <div class="col-4">
          <h3 class="p-3 card-title"> لیست دسته بندی ها</h3>
        </div>
        <div class="offset-4"> </div>
        <div class="col-4">
          <div class="input-group input-group-sm">
            <input type="text" name="table_search" class="float-right form-control" placeholder="جستجو">
            <div class="input-group-append">
              <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
            </div>

            <!-- Button trigger modal -->
            <a href="<?= base_url() ?>admin/category/0/create" type="button" class="btn btn-success shadow-sm mr-2  " data-toggle="modal" data-target="#exampleModalCenter">
              ایجاد دسته اصلی
            </a>

            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
              <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-body">
                    <form action="<?= base_url() ?>admin/category/0" method="post" enctype="multipart/form-data">
                      <div class="form-group row">
                        <label for="category" class="col-2 col-form-label">نام</label>
                        <div class="col-10">
                          <input name="name" type="text" class="form-control" id="category" maxlength="68" placeholder=" دسته اصلی را وارد نمایید" required>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="slug" class="col-2 col-form-label">slug</label>
                        <div class="col-10">
                          <input name="slug" type="text" class="form-control" id="slug" placeholder="نامه دسته بندی جهت نمایش در url" required>
                        </div>
                      </div>
                        <div class="form-group row">
                          <label for="robots" class="col-2 col-form-label">robots</label>
                          <div class="col-10">
                            <select name='robots[]' id="robots" class="form-control select2 select2-hidden-accessible" style="width: 100%;text-align: right" multiple="multiple">
                              <?php foreach ($robots as $key => $value) : ?>
                                <option value="<?= $key ?>"><?= $value ?></option>
                              <?php endforeach; ?>
                            </select>
                          </div>
                      </div>


                      <div class="form-group row">
                        <label for="H1" class="col-2 col-form-label">H1</label>
                        <div class="col-10">
                          <input name="H1" type="text" class="form-control" id="H1" placeholder="ترجیحا بین 20 تا 70 کاراکتر" required>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="Canonical" class="col-2 col-form-label">Canonical</label>
                        <div class="col-10">
                          <input name="Canonical" type="text" class="form-control" id="Canonical" placeholder="لینک را وارد نمایی" required>
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
                    <a href="<?= base_url() ?>admin/category/<?= $value['id'] ?>/edit" class="btn btn-warning btn-sm shadow-sm " style="padding: 0px 16px; border-radius: 18px;">ویرایش</a>
                    <a href="<?= base_url() ?>admin/category/<?= $value['id'] ?>/create" class="btn btn-success btn-sm shadow-sm" style="padding: 0px 20px; border-radius: 18px;">ایجاد </a>
                    <form method="post" action="<?= base_url() ?>admin/category/<?= $value['id'] ?>" class="d-inline">
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
<?php include(BASEPATH . "/App/Views/Backend/category/script.php") ?>