<div class="container">
  <div class="row">
    <div class="offset-2"></div>
    <div class="col-8 mt-5">
      <a href="<?= base_url() ?>login" class="btn btn-primary mt-4 mb-4">بازگشت</a>
      <?= App\Utilities\FlashMessage::show_message(); ?>
      <div class="card mt-5 mb-5">
        <div class="card-header p-3 ">
          <div class="row  mt-3 mb-3">
            <div class="col text-center">
              <b class="text-danger">  لطفا شماره تاییدیه ارسالی را وارد نمایید</b>
            </div>
          </div>
        </div>
        <div class="p-3 ">
			<form id="form-login" action="<?= base_url() ?>token" method="post" class="m-5" autocomplete="off" onsubmit="$('#tokensubmitbtn').val('در حال ورود...'); $('#tokensubmitbtn').focus();">
				<div class="form-group  ">
					<!-- <label class=" align-self-center mb-4" for="token">برای ورود یا ثبت نام شماره چهار رقمی ارسالی به موبایل یا ایمیل را وارد کنید: </label> -->
					<input name="token" class="form-control" maxlength="4" placeholder="شماره چهار رقمی ارسالی" id="token" autofocus>
					<div style="text-align: center; margin-top: 20px;">
						<input type="submit" id="tokensubmitbtn" value="ورود" class="wpcf7-form-control wpcf7-submit">
					</div>
				</div>
			</form>
        </div>
      </div>
      <!-- <button type="button" class="btn btn-primary mt-4 mb-4">پشتیبانی</button> -->
    </div>
  </div>
</div>
<?= include BASEPATH . "App/Views/Frontend/user/script.php" ?>