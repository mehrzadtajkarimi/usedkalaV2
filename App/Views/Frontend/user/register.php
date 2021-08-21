<div class="container">
  <div class="row">
    <div class="offset-2"></div>
    <div class="col-8 ">
      <a href="#" class="btn btn-primary mt-4 mb-4">بازگشت</a>
      <div class="card mb-5">
        <div class="p-3">
          <form class="mt-4" autocomplete="off">
            <p class="">ایجاد حساب کاربری:</p>
            <label class=" align-self-center" for="auth">موبایل را وارد کنید:</label>
            <div class="d-flex mt-2 mb-2">
              <input class="form-control" placeholder="ایمیل یا موبایل" aria-describedby="Help"  id="auth">
              <button type="submit" class="btn btn-primary ml-2">ورود</button>
            </div>
            <small id="Help" class="form-text text-muted mb-4">بعد از وارد کردن شماره تلفن کد چهار رقمی برایتان ارسال می‌شود.</small>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<?= include BASEPATH . "App/Views/Frontend/user/script.php" ?>