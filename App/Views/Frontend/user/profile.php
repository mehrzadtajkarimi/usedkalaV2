<!-- Main content -->
<section class="content">
  <div class="col-full desktop-only">
    <form action="<?= base_url() ?>profile/<?= $data['id'] ?>" method="post" enctype="multipart/form-data">
      <input type="hidden" name="_method" value="patch" />
      <div class="mt-4 row">
        <div class="col-2">
          <div class="card">
            <div class="p-3 card-body">
              <!-- <img src="" class="m-auto rounded-circle" alt="Cinque Terre"> -->


              <!-- Button trigger modal -->
              <span type="button" class="btn w-50" data-toggle="modal" data-target="#form-modal-edit-photo" title="جهت ویرایش کلیک کتید">
                <img id="img-edit" src="<?= $data['path'] ??  asset_url() . 'Frontend/images/users/user4-128x128.jpg' ?> " class="rounded img-fluid " data-img-name="" alt="<?= $data['alt'] ?? '' ?>" />
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
            <li class="nav-item">
              <a class="nav-link " id="pills-profile-tab" data-toggle="pill" href="#pills-address" role="tab" aria-controls="pills-profile" aria-selected="false">آدرس</a>
            </li>
            <?php if ($_SESSION['cart'] !== []) : ?>
              <li class="nav-item">
                <a class="nav-link" id="pills-cart-tab" data-toggle="pill" href="#pills-cart" role="tab" aria-controls="pills-cart" aria-selected="false">سوابق خرید</a>
              </li>
            <?php endif; ?>
          </ul>
          <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade " id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">

              Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati facilis voluptas recusandae impedit accusamus eligendi, nam omnis soluta atque libero quia tenetur velit placeat neque dignissimos totam minima dolorem in.
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati facilis voluptas recusandae impedit accusamus eligendi, nam omnis soluta atque libero quia tenetur velit placeat neque dignissimos totam minima dolorem in.

            </div>
            <div class="tab-pane fade show active" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
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
                  <div class="form-group">
                    <label for="profile-phone">
                      شماره تلفن همراه:
                      <small class="text-muted">(امکان ویرایش تلفن همراه میسر نمی باشد)</small>
                    </label>

                    <input name="profile-phone" type="text" class="form-control" id="profile-phone" value="<?= $data['phone'] ?>" readonly>
                  </div>
                </div>
                <div class="col">
                  <div class="form-group">
                    <label for="profile-email">ایمیل :</label>
                    <input name="profile-email" type="email" class="form-control" id="profile-email" value="<?= $data['email'] ?>" placeholder="ایمیل خود را وارد نمایید">
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane fade " id="pills-address" role="tabpanel" aria-labelledby="pills-address-tab">

              <div class="row">
                <div class="col">
                  <div class="form-group">
                    <label for="profile-address">آدرس :</label>
                    <input name="profile-address" type="text" class="form-control" id="profile-address" value="<?= $data['address'] ?>" placeholder="آدرس خود را وارد نمایید">
                  </div>
                </div>
              </div>
            </div>
            <?php if ($_SESSION['cart'] !== []) : ?>
              <div class="tab-pane fade " id="pills-cart" role="tabpanel" aria-labelledby="pills-cart-tab">

                <div class="row">
                  <div class="col">
                    <div class="form-group">

                      <table class="shop_table shop_table_responsive cart ">
                        <thead>
                          <tr>
                            <th class="text-center product-remove">&nbsp;</th>
                            <th class="text-center product-thumbnail">&nbsp;</th>
                            <th class="text-center product-name">محصول</th>
                            <th class="text-center product-price">قیمت</th>
                            <th class="text-center product-quantity">تعداد</th>
                            <th class="text-center product-subtotal">قیمت کل</th>
                          </tr>
                        </thead>
                        <tbody>
                          <?php foreach ($cart_items as $value) : ?>
                            <tr class="text-center">
                              <td class="product-remove text-center ">
                                <a class="text-center remove" href="#">×</a>
                              </td>
                              <td class="product-thumbnail text-center ">
                                <a href="single-product-fullwidth.html text-center ">
                                  <img width="180" height="180" alt="" class="wp-post-image" src="">
                                </a>
                              </td>
                              <td data-title="Product" class="product-name ">
                                <div class="media cart-item-product-detail ">
                                  <a href="single-product-fullwidth.html ">
                                    <img width="180" height="180" alt="" class="wp-post-image" src="<?= $value['photo_path'] ?>">
                                  </a>
                                  <div class="media-body align-self-center ">
                                    <a href="single-product-fullwidth.html "><?= $value['title'] ?></a>
                                  </div>
                                </div>
                              </td>
                              <td data-title="Price" class="product-price text-center ">
                                <span class="woocommerce-Price-amount amount">
                                  <span class="woocommerce-Price-amount amount "><?= $value['price'] ?></span>
                                </span>
                              </td>
                              <td class="product-quantity text-center " data-title="Quantity">
                                <div class="quantity row d-flex justify-content-center">
                                  <span class="woocommerce-Price-amount amount  m-2" style="align-self: center">
                                    <span id="ss" class="woocommerce-Price-amount amount"><?= $value['count'] ?></span>


                                </div>
                              </td>
                              <td data-title="Total" class="product-subtotal text-center ">
                                <span class="woocommerce-Price-amount amount">
                                  <span class="woocommerce-Price-amount amount subtotal"><?= $value['count'] * $value['price'] ?></span>
                                </span>
                              </td>
                            </tr>
                          <?php endforeach; ?>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            <?php endif; ?>
            <button name="submit" type="submit" class="btn btn-primary">ذخیره</button>
          </div>
        </div>
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




</section>