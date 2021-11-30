            <div class="card ">
                <div class="card-header">
                    <div class="card-body ">
                        <div class="card-tools">
                            <form action="<?= base_url() ?>user.index" method='get' autocomplete="off">
                                <input type="hidden" name="waiting" value="{{ request()->query('waiting') }}">
                                <div class="form-row col-md-12">
                                    <div class="form-group col-md-3">
                                        <input autocomplete="off" type="text" class="form-control" name="name" value="" placeholder="نام و نام خانوادگی">
                                    </div>
                                    <div class="form-group col-md-3">
                                        <input autocomplete="off" type="text" class="form-control" name="national_code" value="" placeholder="کد ملی">
                                    </div>
                                    <div class="form-group col-md-3">
                                        <input autocomplete="off" type="text" class="form-control" name="phone" value="" placeholder="شماره همراه">
                                    </div>
                                    <div class="form-group col-md-3">
                                        <input autocomplete="off" type="text" class="form-control" name="email" value="" placeholder="ایمیل">
                                    </div>
                                </div>
                                <div class="form-row col-md-12">
                                    <div class="form-group col-md-3">
                                        <input autocomplete="off" type="text" class="form-control" name="code" value="" placeholder="شناسه کاربر">
                                    </div>
                                    <div class="form-group col-md-3">
                                        <input autocomplete="off" type="text" class="form-control" name="user_id" value="" placeholder="tblid کاربر">
                                    </div>

                                </div>
                                <div class="form-row col-md-12">
                                    <div class="offset-md-9"></div>
                                    <div class="form-group col-md-1 "">
                                <a class="mr-1 btn btn-danger btn-block" href="<?= base_url() ?>user.index">
                                        <i class="fa fa-times"></i>
                                        </a>
                                    </div>
                                    <div class="form-group col-md-2 vertical-align">
                                        <button type="submit" name='search' value='1' class="mr-2 btn btn-success btn-block vertical-align d-flex justify-content-between align-items-center">
                                            <span> جستجو موارد</span> <i class="fa fa-search vertical-align"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="p-0 card-body table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <div class="m-2 text-left">
                                <span>15 تا 1</span>
                                <span></span>
                                / <span>1300 مورد</span>
                            </div>
                        </thead>
                        <tbody>


                            <tr>
                                <th class="text-center">ردیف</th>
                                <th>مشخصات</th>
                                <th>اطلاعات ورود</th>
                                <th>نشانی</th>
                                <th>عملیات</th>
                            </tr>
                            <?php if ($users) : ?>
                                <?php foreach ($users as $value) : ?>
                                    <tr class="vertical-align">
                                        <td class="text-center" width="10px"><?= $value['id']  ?></td>
                                        <td>
                                            <div>
                                                <small><?= $value['phone'] ?></small>
                                            </div>
                                            <div>
                                                <span><?= $value['first_name'] ?? ' نام '  ?></span>
                                                <span><?= $value['last_name'] ?? ' نام خانوادگی '  ?></span>
                                            </div>
                                            <div>
                                                <small><?= $value['email'] ?? '  ایمیل :  - - -'  ?></small>
                                            </div>
                                            <div>
                                                <small><?= $value['national_code'] ?? ' کد ملی :  - - -'  ?></small>
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                                <small>آخـــــرین ورود : </small>
                                                <small>
                                                    <bdi class="arabic-num">- - -</bdi>
                                                </small>
                                            </div>
                                            <div>
                                                <small>وضعیت کاربر : </small>
                                                <?php if ($value['status'] == 1) : ?>
                                                    <i class="fa fa-check text-success"></i>
                                                <?php else : ?>
                                                    <i class="fa fa-times text-danger"></i>
                                                <?php endif; ?>
                                            </div>
                                            <div>
                                                <?php if ($value['user_level'] == 1) : ?>

                                                    <small>ثبت نام اولیه :</small>
                                                    <i class="fa fa-star-o text-lighter"></i>
                                                <?php elseif ($value['user_level'] == 2) : ?>

                                                    <small>نـــــــــــــــقــره ای : </small>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                <?php elseif ($value['user_level'] == 3) : ?>

                                                    <small>طـــــــــــــــــــلایــی : </small>
                                                    <i class="fa fa-star text-warning"></i>
                                                    <i class="fa fa-star text-warning"></i>
                                                    <i class="fa fa-star text-warning"></i>
                                                <?php endif; ?>
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                                <small>آدرس : </small>
                                                <small>
                                                    <bdi class="arabic-num"><?= $value['address'] ?? '   - - -'  ?></bdi>
                                                </small>
                                            </div>
                                            <div>
                                                <small>استان : </small>
                                                <small>
                                                    <bdi class="arabic-num"><?= $value['province_name'] ?? '   - - -'  ?></bdi>
                                                </small>
                                            </div>
                                            <div>
                                                <small>شهر : </small>
                                                <small>
                                                    <bdi class="arabic-num"><?= $value['city_name'] ?? '   - - -'  ?></bdi>
                                                </small>
                                            </div>
                                            <div>
                                                <small>کد پستی : </small>
                                                <small>
                                                    <bdi class="arabic-num"><?= $value['postal_code'] ?? '   - - -'  ?></bdi>
                                                </small>
                                            </div>
                                        </td>
                                        <td class="text-center ">
                                            <!-- Button trigger modal -->
                                            <button href="" class="p-0 pl-2 pr-2 shadow-sm btn btn-warning btn-sm" style=" border-radius: 18px;" data-toggle="modal" data-target="#exampleModalCenter">
                                                ویــرایـش
                                            </button>
                                            <!-- Modal -->
                                            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-body">
                                                            <form action="<?= base_url() ?>admin/user/<?= $value['id'] ?>/edit" method="post" class="p-1">
                                                                <input type="hidden" name="code" value="<?= rand(100000, 999999) ?>">
                                                                <div class="row">
                                                                    <div class="col">
                                                                        <div class="form-group">
                                                                            <label for="Input1" class="">نام </label>
                                                                            <input type="text" class="form-control start_at" id="Input1" required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col">
                                                                        <div class="form-group">
                                                                            <label for="Input2" class=""> نام خانوادگی</label>
                                                                            <input type="text" class="form-control finish_at" id="Input2" required>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col">
                                                                        <div class="form-group ">
                                                                            <label for="cart-title">آدرس </label>
                                                                            <input name="cart-title" type="text" class="form-control" id="cart-title" placeholder="" required>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col">
                                                                        <div class="form-group ">
                                                                            <label for="cart-title">استان </label>
                                                                            <input name="cart-title" type="text" class="form-control" id="cart-title" placeholder="" required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col">
                                                                        <div class="form-group ">
                                                                            <label for="cart-title">شهر </label>
                                                                            <input name="cart-title" type="text" class="form-control" id="cart-title" placeholder="" required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col">
                                                                        <div class="form-group ">
                                                                            <label for="cart-title">کد پستی </label>
                                                                            <input name="cart-title" type="text" class="form-control" id="cart-title" placeholder="" required>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col">
                                                                        <div class="form-group ">
                                                                            <label for="cart-title">ایمیل  </label>
                                                                            <input name="cart-title" type="text" class="form-control" id="cart-title" placeholder="" required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col">
                                                                        <div class="form-group ">
                                                                            <label for="cart-title">شماره موبایل </label>
                                                                            <input name="cart-title" type="text" class="form-control" id="cart-title" placeholder="" required>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="pt-1 pb-4 form-check disabled ">
                                                                    <input name="cart-status" type="checkbox" class="form-check-input " id="cart-status" checked>
                                                                    <label class="form-check-label" for="cart-status">
                                                                        وضعیت
                                                                    </label>
                                                                </div>
                                                                <button type="submit" class="float-left btn btn-primary btn-block">ذخیره </button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <form method="post" action="<?= base_url() ?>admin/user/<?= $value['id'] ?>" class="d-inline">
                                                <input type="hidden" name="_method" value="delete" />
                                                <input type="submit" class="p-0 pl-2 pr-2 shadow-sm btn btn-danger btn-sm" style="border-radius: 18px;" onclick="return confirm('آیا برای حذف اطلاعات اطمینان دارید');" value="حــــــــذف">
                                            </form>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            <?php else : ?>
                                <tr class="alert alert-secondary" role="alert">
                                    <td colspan="10">
                                        آیتمی برای نمایش وجود ندارد
                                    </td>
                                </tr>
                            <?php endif; ?>
                        </tbody>
                    </table>
                </div>
                <div class="card-footer">
                    <span class="float-left">
                        1.2.3.
                    </span>
                </div>
            </div>