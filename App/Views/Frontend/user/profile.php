<!-- Main content -->
<section class="content">
  <div class="col-full desktop-only">
    <div class="row mt-4">
      <div class="col-2">
        <div class="card">
          <div class="card-body p-3">
            <img src="<?= asset_url() ?>Frontend/images/users/user4-128x128.jpg" class="rounded-circle m-auto" alt="Cinque Terre">
            <div class="mt-3">
              <div class="list-group list-group-flush">
                  <a href="#" class="list-group-item  list-group-item-action font-weight-bold" >سفارش‌های من</a>
                  <a href="#" class="list-group-item  list-group-item-action font-weight-bold" >نظرات</a>
                  <a href="#" class="list-group-item  list-group-item-action font-weight-bold" >کارت های هدیه</a>
                  <a href="#" class="list-group-item  list-group-item-action font-weight-bold" >بازدید های اخیر</a>
              </div>
              <a href="<?= base_url() ?>logout" class="btn btn-primary btn-lg active btn-block mt-5" role="button" aria-pressed="true">خروج</a>
            </div>
          </div>
        </div>
      </div>
      <div class="col-9">
      <?= App\Utilities\FlashMessage::show_message(); ?>
        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
          <li class="nav-item">
            <a class="nav-link " id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">خانه</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">پروفایل</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false">سوابق خرید</a>
          </li>
        </ul>
        <div class="tab-content" id="pills-tabContent">
          <div class="tab-pane fade " id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">

            Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati facilis voluptas recusandae impedit accusamus eligendi, nam omnis soluta atque libero quia tenetur velit placeat neque dignissimos totam minima dolorem in.
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati facilis voluptas recusandae impedit accusamus eligendi, nam omnis soluta atque libero quia tenetur velit placeat neque dignissimos totam minima dolorem in.

          </div>
          <div class="tab-pane fade show active" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">

            <form>
              <div class="row">
                <div class="col">
                  <div class="form-group">
                    <label for="profile_name">نام</label>
                    <input name="profile_name" type="text" class="form-control" id="profile_name" aria-describedby="emailHelp" placeholder="نام خود را وارد نمایید">
                  </div>
                </div>
                <div class="col">
                  <div class="form-group">
                    <label for="profile_family">نام خانوادگی</label>
                    <input name="profile_family" type="text" class="form-control" id="profile_family" aria-describedby="emailHelp" placeholder="نام  خانوادگی را وارد نمایید">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <div class="profile_phone">
                    <label for="exampleInputPassword1">شماره تلفن همراه:</label>
                    <input name="profile_phone" type="text" class="form-control" id="profile_phone" placeholder="شماره تلفن همراه خود را وارد نمایید">
                  </div>
                </div>
                <div class="col">
                  <div class="form-group">
                    <label for="profile_email">ایمیل :</label>
                    <input name="profile_email" type="text" class="form-control" id="profile_email" placeholder="ایمیل خود را وارد نمایید">
                  </div>
                </div>
              </div>

              <button name="submit" type="submit" class="btn btn-primary">ذخیره</button>
            </form>


          </div>
          <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">


            Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde, similique! Doloribus quis assumenda deserunt ut quaerat asperiores quasi unde molestias laudantium reiciendis, eos beatae ipsum voluptatum vel labore autem pariatur?
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde, similique! Doloribus quis assumenda deserunt ut quaerat asperiores quasi unde molestias laudantium reiciendis, eos beatae ipsum voluptatum vel labore autem pariatur?
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde, similique! Doloribus quis assumenda deserunt ut quaerat asperiores quasi unde molestias laudantium reiciendis, eos beatae ipsum voluptatum vel labore autem pariatur?
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde, similique! Doloribus quis assumenda deserunt ut quaerat asperiores quasi unde molestias laudantium reiciendis, eos beatae ipsum voluptatum vel labore autem pariatur?
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde, similique! Doloribus quis assumenda deserunt ut quaerat asperiores quasi unde molestias laudantium reiciendis, eos beatae ipsum voluptatum vel labore autem pariatur?
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde, similique! Doloribus quis assumenda deserunt ut quaerat asperiores quasi unde molestias laudantium reiciendis, eos beatae ipsum voluptatum vel labore autem pariatur?
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde, similique! Doloribus quis assumenda deserunt ut quaerat asperiores quasi unde molestias laudantium reiciendis, eos beatae ipsum voluptatum vel labore autem pariatur?
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde, similique! Doloribus quis assumenda deserunt ut quaerat asperiores quasi unde molestias laudantium reiciendis, eos beatae ipsum voluptatum vel labore autem pariatur?
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde, similique! Doloribus quis assumenda deserunt ut quaerat asperiores quasi unde molestias laudantium reiciendis, eos beatae ipsum voluptatum vel labore autem pariatur?
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde, similique! Doloribus quis assumenda deserunt ut quaerat asperiores quasi unde molestias laudantium reiciendis, eos beatae ipsum voluptatum vel labore autem pariatur?
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde, similique! Doloribus quis assumenda deserunt ut quaerat asperiores quasi unde molestias laudantium reiciendis, eos beatae ipsum voluptatum vel labore autem pariatur?
          </div>
        </div>



      </div>
    </div>
  </div>
</section>