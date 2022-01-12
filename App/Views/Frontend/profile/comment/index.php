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
        <div class="card p-5">
          <div class="card-body">

            <table class="table table-hover">
              <tbody>
                <?php foreach ($comments as $value) : ?>
                  <tr>
                    <td>
                      <a href="<?= base_url() ?>profile/comment/<?= $value['entity_id'] ?>" class="card-text d-block">
                      <?= $value['title'] ?>

                    </a>
                    </td>
                  </tr>
                <?php endforeach; ?>

              </tbody>
            </table>

          </div>
        </div>

      </div>
    </div>
  </div>
</section>