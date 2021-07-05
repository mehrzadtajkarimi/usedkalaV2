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

                        <?php
                        $data = ['ss' => 'dddddddddddd'];
                        include_data(BASEPATH. 'views/backend/layouts/modal.php', $data);
                        ?>

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

                                <span class="ml-4"><?= $value['name'] ?></span>
                                <a href="<?= base_url() ?>admin/category/<?= $value['id'] ?>/edit" class="badge badge-pill badge-warning shadow-sm" style="padding: 5px 16px 5px 16px;">ویرایش</a>
                                <a href="<?= base_url() ?>admin/category/<?= $value['id'] ?>/delete" class="badge badge-pill badge-danger shadow-sm" style="padding: 5px 20px 5px 20px;">حذف</a>
                                <a href="<?= base_url() ?>admin/category/<?= $value['id'] ?>/create" class="badge badge-pill badge-success shadow-sm" style="padding: 5px 20px 5px 20px;">ایجاد </a>

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