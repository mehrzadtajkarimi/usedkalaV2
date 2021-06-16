<!DOCTYPE html>
<html>

<head>
    @include('admin.layout.include.head')
</head>
<style>
    .main-footer {
        border-top: 0px;
    }
</style>

<body>
    <div class="container">
        <div class="row justify-content-md-center">
            <div class="col-lg-7">
                <div class="card card-info mt-5 shadow ">
                    <div class="card-header bg-transparent  d-flex justify-content-center">
                        <img src="{{ asset('/admin/dist/img/logo-web.png')}}" class="w-25 float-left pb-2 " alt="">
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    <form class="form-horizontal" action="{{ route('login') }}" method="post">
                        @csrf
                        <div class="card-body" style="direction: ltr;">
                            <div class="form-group">
                                <label for="input1" class="col-sm-2 control-label">ایمیل</label>
                                <div class="col-sm-12 ">
                                    <input autocomplete="off" type="email" name="email" class="form-control" id="input1" placeholder="email" value="{{old('email')}}" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="input2" class="col-sm-2 control-label">رمز ورود</label>
                                <div class="col-sm-12">
                                    <input autocomplete="off" type="password" name="password" class="form-control" id="input2" placeholder="password" required>
                                </div>
                            </div>

                        </div>

                        <!-- /.card-body -->
                        <div class="card-footer">
                            <div class="col-md-6 offset-3">
                                <button type="submit" class="btn btn-info btn-block"> ورود پنل ادمین</button>
                            </div>
                        </div>
                        <!-- /.card-footer -->
                    </form>
                </div>

            </div>

        </div>



    </div>

    <!-- /.content-wrapper -->
    <footer class="main-footer">
        @include('admin.layout.include.footer')
    </footer>



</body>

</html>