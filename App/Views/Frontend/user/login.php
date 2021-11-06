<div class="container">
  <div class="row">
    <div class="offset-2"></div>
    <div class="col-8 ">
      <a href="<?= base_url() ?>" class="btn btn-primary mt-4 mb-4">بازگشت</a>
      <?= App\Utilities\FlashMessage::show_message(); ?>
      <div id="login" class="card">
        <div class="card-header p-3">
          <div class="row  mt-3 mb-3">
            <div class="col">

              <span class=""> ورود/ ثبت نام:</span>

            </div>
          </div>
        </div>
        <div class="p-3">
          <form id="form-login" action="<?= base_url() ?>login" method="POST" class="mt-4" autocomplete="off">
            <div class="form-group  ">
              <label class=" align-self-center mb-4" for="login">برای ورود یا ثبت نام کافیست شماره تماس یا ایمیل خود را وارد کنید: </label>
              <input name="login"  class="form-control"  placeholder="موبایل یا ایمیل " id="login_input" autofocus>

              <small id="" class="form-text text-muted ">فرمت شماره موبایل : 09123456789</small>
              <small id="" class="form-text text-muted mb-4">فرمت شماره ایمیل : (email@gmail.com) یا (email@yahoo.com)</small>
            </div>
          </form>
        </div>
      </div>
      <div id="token" class="card d-none">
          <div class="card-header p-3 ">
            <div class="row  mt-3 mb-3">
              <div class="col text-center">
                <b class="text-danger"> لطفا شماره تاییدیه ارسالی را وارد نمایید</b>
              </div>
            </div>
          </div>
          <div class="p-3 ">
            <form id="form-token" action="<?= base_url() ?>token" method="POST" class="m-5" autocomplete="off">
              <div class="form-group  ">
                <!-- <label class=" align-self-center mb-4" for="token">برای ورود یا ثبت نام شماره چهار رقمی ارسالی به موبایل یا ایمیل را وارد کنید: </label> -->
                <input name="token" class="form-control" maxlength="4" placeholder="شماره چهار رقمی ارسالی" id="token_input" >
              </div>
            </form>
          </div>
      </div>
      <button type="button" class="btn btn-primary mt-4 mb-4">پشتیبانی</button>
    </div>
  </div>
</div>
<?= include BASEPATH . "App/Views/Frontend/user/script.php" ?>