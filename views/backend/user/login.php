<?php

use App\Utilities\FlashMessage;
?>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>پنل مدیریت | صفحه ثبت نام</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?= asset_url() ?>backend/dist/css/adminlte.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="<?= asset_url() ?>backend/plugins/iCheck/square/blue.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

  <!-- bootstrap rtl -->
  <link rel="stylesheet" href="<?= asset_url() ?>backend/dist/css/bootstrap-rtl.min.css">
  <!-- template rtl version -->
  <link rel="stylesheet" href="<?= asset_url() ?>backend/dist/css/custom-style.css">
</head>

<body class="hold-transition register-page bg-primary">
  <div class="register-box">
    <div class="register-logo">
      <img src="<?= asset_url() ?>backend/dist/img/ukfav-icon.png" alt="">

      <b class='text-dark'>ورود یه پنل</b>

      <?= \App\Utilities\FlashMessage::show_message() ?>
    </div>

    <div class="card shadow-lg ">
      <div class="card-body register-card-body">
        <p class="login-box-msg text-muted">برای ورود یا ثبت نام کافیست شماره تماس خود را وارد کنید.</p>

        <form action="<?= base_url() ?>admin/login" method="post">
          <div class="input-group mb-3">
            <input type="text" class="form-control" name="phone-number" placeholder="شماره تلفن همراه خود را وارد نمایید">
            <div class="input-group-append">
              <span class="fa fa-phone input-group-text"></span>
            </div>
          </div>

          <button class="btn btn-primary btn-block" type="submit">ارسال</button>
        </form>

        <!-- <div class="social-auth-links text-center">
        <p class='text-muted'>- یا -</p>
        <a href="#" class="btn btn-block btn-primary">
          <i class="fa fa-facebook mr-2"></i>
          ثبت نام با اکانت فیس بود
        </a>
        <a href="#" class="btn btn-block btn-danger">
          <i class="fa fa-google-plus mr-2"></i>
           ورود یا ثبت نام با گوگل
        </a>
      </div> -->

        <a href="<?= base_url() ?>admin/login" class="text-center">من قبلا ثبت نام کرده ام</a>
      </div>
      <!-- /.form-box -->
    </div><!-- /.card -->
  </div>
  <!-- /.register-box -->

  <!-- jQuery -->
  <script src="<?= asset_url() ?>backend/plugins/jquery/jquery.min.js"></script>
  <!-- Bootstrap 4 -->
  <script src="<?= asset_url() ?>backend/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- iCheck -->
  <script src="<?= asset_url() ?>backend/plugins/iCheck/icheck.min.js"></script>
  <script>
    $(function() {
      $('input').iCheck({
        checkboxClass: 'icheckbox_square-blue',
        radioClass: 'iradio_square-blue',
        increaseArea: '20%' // optional
      })
    })
  </script>
</body>

</html>