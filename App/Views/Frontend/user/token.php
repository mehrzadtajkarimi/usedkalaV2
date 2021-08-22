<div class="container">
  <div class="row">
    <div class="offset-2"></div>
    <div class="col-8 ">
      <a href="<?= base_url() ?>" class="btn btn-primary mt-4 mb-4">بازگشت</a>
      <div class="card">
        <div class="card-header p-3">
          <div class="row  mt-3 mb-3">
            <div class="col">
              <span class="">  لطفا شماره تاییدیه ارسالی را وارد نمایید:</span>
            </div>
          </div>
        </div>
        <div class="p-3">
          <form id="form-login" action="<?= base_url() ?>login" method="post" class="mt-4" autocomplete="off">
            <div class="form-group  ">
              <label class=" align-self-center mb-4" for="token">برای ورود یا ثبت نام شماره چهار رقمی ارسالی به موبایل یا ایمیل را وارد کنید: </label>
              <input name="token" class="form-control" placeholder="شماره چهار رقمی ارسالی" id="token">
            </div>
          </form>
        </div>
      </div>
      <button type="button" class="btn btn-primary mt-4 mb-4">پشتیبانی</button>
    </div>
  </div>
</div>
<?= include BASEPATH . "App/Views/Frontend/user/script.php" ?>