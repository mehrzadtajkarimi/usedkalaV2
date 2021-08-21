<div class="container">
  <div class="row">
    <div class="offset-2"></div>
    <div class="col-8 ">
      <a href="#" class="btn btn-primary mt-4 mb-4">بازگشت</a>
      <div class="card">
        <div class="card-header p-3">
          <div class="row  mt-3 mb-3">
            <div class="col">
              <span class="">اگر در یوزدکالا حساب کاربری ندارید، ثبت نام کنید:</span>
              <a class="btn btn-primary float-left m-0" href="<?= base_url() ?>register">ایجاد حساب کاربری</a>
            </div>
          </div>
        </div>
        <div class="p-3">
          <form class="mt-4" autocomplete="off">
            <div class="form-group row ">
              <label class="col align-self-center" for="auth">اگر در یوزدکالا حساب کاربری دارید، وارد شوید:</label>
              <div class="col d-flex">
                <input class="form-control" placeholder="ایمیل یا موبایل" id="auth">
                <button type="submit" class="btn btn-primary ml-2">ورود</button>
              </div>
            </div>
          </form>
        </div>
      </div>
      <button type="button" class="btn btn-primary mt-4 mb-4">پشتیبانی</button>
    </div>
  </div>
</div>
<?= include BASEPATH . "App/Views/Frontend/user/script.php" ?>
