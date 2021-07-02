<div class="card ">
    <div class="p-0 shadow card-body">
        <div class="card-header">
            <div class="row">
                <div class="col-4">
                    <h3 class="p-3 card-title"> لیست دسته بندی ها</h3>
                </div>
                <div class="offset-4"> </div>
                <div class="col-4">
                    <div class="p-3 card-tools">
                        <div class="input-group input-group-sm">
                            <input type="text" name="table_search" class="float-right form-control" placeholder="جستجو">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                            </div>
                            <button class="mr-3 btn btn-success" type="submit">ایجاد دسته بندی</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="p-0 card-body table-responsive">
            <ul class="list-group">
                <?php
                foreach ($children as $item) {
                    echo    menu_generator($item);
                }
                ?>

            </ul>
        </div>
    </div>
</div>