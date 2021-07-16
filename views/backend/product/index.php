<div class="card ">
  <div class="p-0 shadow-sm card-body">
    <div class="card-header">
      <div class="row">
        <div class="col-4">
          <h3 class="p-3 card-title"> لیست محصولات</h3>
        </div>
        <div class="offset-4"> </div>
        <div class="col-4">
          <div class="input-group input-group-sm">
            <input type="text" name="table_search" class="float-right form-control" placeholder="جستجو">
            <div class="input-group-append">
              <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
            </div>

            <!-- Button trigger modal -->
            <a href="<?= base_url() ?>admin/product/create" type="button" class="btn btn-success shadow-sm mr-2  " data-toggle="modal" data-target="#exampleModalCenter">
              ایجاد حصول
            </a>


            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
              <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-body">
                    <form action="<?= base_url() ?>admin/product" method="post" enctype="multipart/form-data">
                      <div class="form-group row">
                        <label for="product-name" class="col-2 col-form-label"> نام </label>
                        <div class="col-10">
                          <input name="product-name" type="text" class="form-control" id="product-name" placeholder="" required>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-2 col-form-label" for="product-category">دسته </label>
                        <div class="col-10">
                          <select name='product-category' class="form-control" id="product-category">
                            <?php foreach ($categories as $value) : ?>
                              <option value="<?= $value['id'] ?>"><?= $value['name'] ?></option>
                            <?php endforeach; ?>
                          </select>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-2 col-form-label" for="product-category">برند </label>
                        <div class="col-10">
                          <select name='product-category' class="form-control" id="product-category">
                            <?php foreach ($brans as $value) : ?>
                              <option value="<?= $value['id'] ?>"><?= $value['name'] ?></option>
                            <?php endforeach; ?>
                          </select>
                        </div>
                      </div>

                      <div class="form-group row">
                        <label for="slug" class="col-2 col-form-label">عکس</label>
                        <div class="col-10">
                          <div class="custom-file">
                            <input name="product-image" type="file" class="custom-file-input" id="product-image" required>
                            <label class="custom-file-label" for="product-image">Choose file</label>
                          </div>
                        </div>
                      </div>


                      <!-- <div class="form-group row" >
                        <label class="col-2 col-form-label" for="product-category">تامین کننده </label>
                        <div class="col-10">
                          <select name='product-category' class="form-control" id="product-category" disabled>
                           //* <?php foreach ($suppliers as $value) : ?>
                           //*   <option value="<?= $value['id'] ?>"><?= $value['name'] ?></option>
                           //* <?php endforeach; ?>
                          </select>
                        </div>
                      </div> -->

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
            foreach ($products as $value) :
            ?>
              <li class="list-group-item ">
                <div class="row">
                  <div class="col">
                    <span class="ml-4"><?= $value['name'] ?></span>
                  </div>
                  <div class="col">
                    <a href="<?= base_url() ?>admin/category/<?= $value['id'] ?>/edit" class="btn btn-warning btn-sm shadow-sm " style="padding: 0px 16px; border-radius: 18px;">ویرایش</a>
                    <a href="<?= base_url() ?>admin/category/<?= $value['id'] ?>/create" class="btn btn-success btn-sm shadow-sm" style="padding: 0px 20px; border-radius: 18px;">ایجاد </a>
                    <form method="post" action="<?= base_url() ?>admin/category/<?= $value['id'] ?>" class="d-inline">
                      <input type="hidden" name="_method" value="delete" />
                      <input type="submit" class="btn btn-danger btn-sm shadow-sm " style="padding: 0px 20px; border-radius: 18px;" value="حذف">
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