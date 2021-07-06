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
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <form action="<?= base_url() ?>admin/category/{0}/create" method="post">
                                            <div class="form-group row">
                                                <label for="category" class="col-2 col-form-label">نام</label>
                                                <div class="col-10">
                                                    <input name="name" type="text" class="form-control" id="category" placeholder=" دسته اصلی را وارد نمایید">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="slug" class="col-2 col-form-label">slug</label>
                                                <div class="col-10">
                                                    <input name="slug" type="text" class="form-control" id="slug" placeholder="نامه دسته بندی جهت نمایش در url">
                                                </div>
                                            </div>
                                            <input name="parent_id" type="hidden" value="0">
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
                                        <a href="<?= base_url() ?>admin/category/<?= $value['id'] ?>/edit" class="badge badge-pill badge-warning shadow-sm" style="padding: 5px 16px 5px 16px;">ویرایش</a>
                                        <a href="<?= base_url() ?>admin/category/<?= $value['id'] ?>/delete" class="badge badge-pill badge-danger shadow-sm" style="padding: 5px 20px 5px 20px;">حذف</a>
                                        <a href="<?= base_url() ?>admin/category/<?= $value['id'] ?>/create" class="badge badge-pill badge-success shadow-sm" style="padding: 5px 20px 5px 20px;">ایجاد </a>
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