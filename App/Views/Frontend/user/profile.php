<!-- Main content -->
<section class="content">
  <div class="col-full desktop-only">
    <form action="<?= base_url() ?>profile/<?= $data['id'] ?>" method="post" enctype="multipart/form-data">
      <div class="mt-4 row">
        <div class="col-2">
          <div class="card">
            <div class="p-3 card-body">
              <!-- <img src="" class="m-auto rounded-circle" alt="Cinque Terre"> -->


              <!-- Button trigger modal -->
              <span type="button" class="btn w-50" data-toggle="modal" data-target="#form-modal-edit-photo" title="جهت ویرایش کلیک کتید">
                <img id="img-edit" src="<?= $data['path'] ??  asset_url() . 'Frontend/images/users/user4-128x128.jpg' ?> " class="rounded img-fluid " data-img-name="" alt="<?= $data['alt'] ?>" />
              </span>
              <!-- Modal -->
              <div id="form-modal-edit-photo" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-body">
                      <input name="profile_image" id="input-edit" type="file">
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-success" data-dismiss="modal">تایید</button>
                    </div>
                  </div>
                </div>
              </div>
              <?php include(BASEPATH . "App/Views/Frontend/user/script.php") ?>



              <div class="mt-3">
                <div class="list-group list-group-flush">
                  <a href="#" class="list-group-item list-group-item-action font-weight-bold">سفارش‌های من</a>
                  <a href="#" class="list-group-item list-group-item-action font-weight-bold">نظرات</a>
                  <a href="#" class="list-group-item list-group-item-action font-weight-bold">کارت های هدیه</a>
                  <a href="#" class="list-group-item list-group-item-action font-weight-bold">بازدید های اخیر</a>
                </div>
                <a href="<?= base_url() ?>logout" class="mt-5 btn btn-primary btn-lg active btn-block" role="button" aria-pressed="true">خروج</a>
              </div>
            </div>
          </div>
        </div>
        <div class="col-9">
          <?= App\Utilities\FlashMessage::show_message(); ?>
          <ul class="mb-3 nav nav-pills" id="pills-tab" role="tablist">
            <li class="nav-item">
              <a class="nav-link " id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">خانه</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">پروفایل</a>
            </li>
            <?php if ($_SESSION['cart'] !== []) : ?>
              <li class="nav-item">
                <a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false">سوابق خرید</a>
              </li>
            <?php endif; ?>
          </ul>
          <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade " id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">

              Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati facilis voluptas recusandae impedit accusamus eligendi, nam omnis soluta atque libero quia tenetur velit placeat neque dignissimos totam minima dolorem in.
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati facilis voluptas recusandae impedit accusamus eligendi, nam omnis soluta atque libero quia tenetur velit placeat neque dignissimos totam minima dolorem in.

            </div>
            <div class="tab-pane fade show active" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">

              <input type="hidden" name="_method" value="patch" />
              <div class="row">
                <div class="col">
                  <div class="form-group">
                    <label for="profile-name">نام</label>
                    <input name="profile-name" type="text" class="form-control" id="profile-name" value="<?= $data['first_name'] ?>" placeholder="نام خود را وارد نمایید">
                  </div>
                </div>
                <div class="col">
                  <div class="form-group">
                    <label for="profile-family">نام خانوادگی</label>
                    <input name="profile-family" type="text" class="form-control" id="profile-family" value="<?= $data['last_name'] ?>" placeholder="نام  خانوادگی را وارد نمایید">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <div class="profile-phone">
                    <label for="exampleInputPassword1">شماره تلفن همراه:</label>
                    <input name="profile-phone" type="text" class="form-control" id="profile-phone" value="<?= $data['phone'] ?>" disabled>
                  </div>
                </div>
                <div class="col">
                  <div class="form-group">
                    <label for="profile-email">ایمیل :</label>
                    <input name="profile-email" type="email" class="form-control" id="profile-email" value="<?= $data['email'] ?>" placeholder="ایمیل خود را وارد نمایید">
                  </div>
                </div>
              </div>
              <button name="submit" type="submit" class="btn btn-primary">ذخیره</button>
            </div>
    </form>
    <?php if ($_SESSION['cart'] !== []) : ?>
      <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
        <?php
        include BASEPATH . "/App/Views/Frontend/cart/index.php";
        ?>
      </div>
    <?php endif; ?>
  </div>



  </div>
  </div>
  </div>
</section>