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
                                <a class=" btn btn-danger btn-block mr-1" href="<?= base_url() ?>user.index">
                                        <i class="fa fa-times"></i>
                                        </a>
                                    </div>
                                    <div class="form-group col-md-2 vertical-align">
                                        <button type="submit" name='search' value='1' class="btn btn-success btn-block mr-2 vertical-align d-flex justify-content-between align-items-center">
                                            <span> جستجو موارد</span> <i class="fa fa-search vertical-align"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover">
                        <thead>
                            <div class="text-left m-2">
                                <span>15 تا 1</span>
                                <span></span>
                                / <span>1300 مورد</span>
                            </div>
                        </thead>
                        <tbody>
                            <tr>
                                <th class="text-center">ردیف</th>
                                <th class="text-center">شناسه</th>
                                <th>مشخصات</th>
                                <th>اطلاعات ورود</th>
                                <th class="text-center">عملیات</th>
                            </tr>



                            <tr class="vertical-align">
                                <td class="text-center" width="10px">11</td>
                                <td class="text-center">
                                    <span>1500<sub class="text-muted">/1</sub></span>
                                </td>
                                <td>
                                    <div>
                                        <span>اسم</span>
                                        <span>فامیلی</span>
                                    </div>
                                    <div>
                                        <small>email</small>
                                    </div>
                                    <div>
                                        <small>شماره موبایل</small>
                                    </div>
                                    <div>
                                        <small>کد ملی</small>
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <small>ورود دو عاملی : </small>
                                        <i class="fa fa-times text-danger"></i>
                                        <!-- <i class="fa fa-check text-success"></i> -->
                                        <small>
                                        </small>
                                    </div>
                                    <div>
                                        <small>آخرین ورود : </small>
                                        <small>
                                            <bdi class="arabic-num">timestamp</bdi>
                                        </small>
                                    </div>
                                    <div>
                                        <small>وضعیت کاربر : </small>
                                        <i class="fa fa-check text-success"></i>
                                        <!-- <i class="fa fa-times text-danger"></i> -->
                                    </div>
                                    <div>
                                        <!-- <small>مبتدی:</small>
                                            <i class="fa fa-star text-lighter"></i>
                                            <small>نقره ای : </small>
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star text-secondary"></i>
                                            <small>وفادار : </small>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i> -->
                                        <small>VIP : </small>
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star text-warning"></i>
                                    </div>
                                </td>
                                <td class="text-center">
                                    <div class="row mb-1 p-1">
                                        <a href="{{ route('user.show',$value->id) }}" class="btn btn-light btn-sm rounded vertical-align col-6">مشاهده جزئیات</a>
                                        <a href="{{ route('user.permission',$value->id) }}" class="btn btn-light btn-sm rounded vertical-align col-6"> دسترسی ها</a>
                                    </div>
                                </td>
                            </tr>




                            <tr class="alert alert-secondary" role="alert">
                                <td colspan="10">
                                    آیتمی برای نمایش وجود ندارد
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <div class="card-footer">
                    <span class="float-left">
                        1.2.3.
                    </span>
                </div>
            </div>