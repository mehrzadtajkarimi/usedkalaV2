<div class="card">
    <div class="card-header">
        <h5> (( <?= $comment['first_name'] . $comment['last_name'] .  $comment['phone']  ?> ))</h5>
        <p> قسمت : <small><?= $comment['entity_type']   ?></small> </p>

    </div>
    <div class="card-body">
        <form action="<?= base_url() ?>admin/comment" method="post" enctype="multipart/form-data">
            <input type="hidden" name="comment_id" value="<?= $comment['id'] ?? '' ?>">
            <input type="hidden" name="entity_id" value="<?= $comment['entity_id'] ?? '' ?>">
            <input type="hidden" name="entity_type" value="<?= $comment['entity_type'] ?? '' ?>">
            <div class="form-group row">
                <label for="title" class="col-sm-2 col-form-label">موضـــــــــــوع:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="title" value="<?= $comment['title'] ?? '' ?>" placeholder="نام زیر دسته را وارد نمایید" readonly>
                </div>
            </div>
            <div class="form-group row">
                <label for="title" class="col-sm-2 col-form-label"> دیـــدگـــــــــاه:</label>
                <div class="col-sm-10">
                    <div class="card bg-light">
                        <div class="card-body ">
                            <?= $comment['message'] ?? '' ?>
                        </div>
                    </div>
                </div>
            </div>
            <?php if (!is_null($reply)) : ?>
                <hr>
                <h5 class="mt-3 mb-5">پاسخ های داده شده :</h5>

                <?php foreach ($reply as $value) : ?>
                    <div class="row">
                        <div class="col-2">
                            <p><?= $comment['first_name'] . $comment['last_name'] .  $comment['phone']  ?></p>
                        </div>
                        <div class="col-10">

                            <p><?= $value['message'] ?></p>
                        </div>
                    </div>

                <?php endforeach; ?>



            <?php endif; ?>
            <hr>
            <div class="form-group row">
                <label for="title" class="col-sm-2 col-form-label"> پــــاســـــــــخ:</label>
                <div class="col-sm-10">
                    <textarea name="message" class="form-control" placeholder="به این دیدگاه پاسخ دهید" rows="5" autofocus></textarea>
                </div>
            </div>




            <div class="form-group row">
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">ذخیره</button>
                    <a href="<?= base_url() ?>admin/comment" class="btn btn-danger">انصراف</a>
                </div>
            </div>
        </form>
    </div>
</div>
<?php
include(BASEPATH . "/App/Views/Backend/comment/script.php");
include_once BASEPATH  . 'App/Views/Backend/layouts/include/ckeditor.php';
?>