<div class="card ">
    <div class="card-body p-0 shadow">
        <div class="card-header">
            <div class="row">
                <div class="col-4">
                    <h3 class="card-title p-3"> لیست دسته بندی ها</h3>
                </div>
                <div class="offset-4"> </div>
                <div class="col-4">

                    <div class="card-tools p-3">
                        <div class="input-group input-group-sm">
                            <input type="text" name="table_search" class="form-control float-right" placeholder="جستجو">

                            <div class="input-group-append">
                                <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                            </div>
                            <button class="btn btn-success mr-3" type="submit">ایجاد دسته بندی</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-body table-responsive p-0">
            <?php include_once BASEPATH ."views/backend/category/group.php"?>
        </div>
    </div>
</div>