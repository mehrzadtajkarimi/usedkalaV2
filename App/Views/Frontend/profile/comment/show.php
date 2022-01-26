<!-- Main content -->

<section class="content">
  <div class="col-full desktop-only">
    <input type="hidden" name="_method" value="patch" />
    <div class="mt-4 row">
      <div class="col-2">
        <div class="card">
          <div class="p-3 card-body">
            <!-- <img src="" class="m-auto rounded-circle" alt="Cinque Terre"> -->


            <!-- Button trigger modal -->

            <div class="row">
              <div class="col-8">
                <span type="button" class="btn" data-toggle="modal" data-target="#form-modal-edit-photo" title="جهت ویرایش کلیک کتید">
                  <img id="img-edit" src="<?= $user['path'] ??  asset_url() . 'Frontend/images/users/user4-128x128.jpg' ?> " class="rounded img-fluid profile-img" data-img-name="" alt="<?= $data['alt'] ?? '' ?>" />
                </span>
              </div>
              <div class="col-4 text-center mt-4">
                <small class="text-muted "><?= $user['first_name'] ?></small>
                <hr class=" m-0">
                <small class="text-muted"><?= $user['last_name'] ?></small>
              </div>
            </div>
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




            <!-- sidebar -->

            <?php include(BASEPATH . "App/Views/Frontend/profile/layouts/sidebar.php") ?>

            <!-- sidebar -->
          </div>
        </div>
      </div>
      <div class="col-9">
        <?= App\Utilities\FlashMessage::show_message(); ?>

            <?php foreach ($comments as $value) : ?>
              <div class="card pl-4 pr-4 pt-1 pb-3 mb-4">
                <div class="pb-3">
                  <small class="text-dark">تاریخ:</small>
                  <small class="text-muted">
                    <?= jdate('Y M d H:i', strtotime($value['created_at'])) ?>
                  </small>

                </div>
                <div class="card-body">
                  <h5 class="card-title"><?= $value['title'] ?></h5>
                  <p class="card-text"><?= $value['message'] ?></p>
                </div>
              </div>
            <?php endforeach; ?>



      </div>
    </div>
  </div>
</section>