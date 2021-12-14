<div class="container">
  <div class="row">
    <div class="offset-2"></div>
    <div class="col-8 ">
      <a href="<?= base_url() ?>" class="btn btn-primary mt-4 mb-4">بازگشت</a>
      <?= App\Utilities\FlashMessage::show_message(); ?>
      <div class="card">
        <div class="card-header p-3">
          <div class="row  mt-3 mb-3">
            <div class="col">

              <span class=""> ورود/ ثبت نام:</span>

            </div>
          </div>
        </div>
        <div class="p-3">
          <form id="form-login" action="<?= base_url() ?>login" method="post" class="mt-4" autocomplete="off">
            <div class="form-group  ">
              <label class=" align-self-center mb-4" for="login">برای ورود یا ثبت نام کافیست شماره موبایل خود را وارد کرده و اینتر بزنید.</label>
              <!-- <div class="col d-flex"> -->
              <input name="login" class="form-control" placeholder="شماره موبایل" id="login" autofocus>
              <!-- <button class="btn btn-primary ml-2">ورود</button> -->
              <!-- </div> -->
              <small id="Help" class="form-text text-muted ">فرمت شماره موبایل: 09123456789</small>
              <!-- <small id="Help" class="form-text text-muted mb-4">فرمت شماره ایمیل : (email@gmail.com) یا (email@yahoo.com)</small> -->

            </div>
          </form>
        </div>
      </div>
      <button type="button" class="btn btn-primary mt-4 mb-4">پشتیبانی</button>
    </div>
  </div>
</div>
<?= include BASEPATH . "App/Views/Frontend/user/script.php" ?>