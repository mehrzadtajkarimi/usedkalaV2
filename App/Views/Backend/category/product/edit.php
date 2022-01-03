<div class="card">
    <div class="card-header">
        <h5>ویرایش دسته‌بندی «<?= $category['name']  ?>»</h5>

    </div>
    <div class="card-body">
        <form action="<?= base_url() ?>admin/category/<?= $category['id'] ?>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="_method" value="patch" />
            <div class="form-group row">
                <label for="title" class="col-sm-2 col-form-label">HTML Title</label>
                <div class="col-sm-10">
                    <input name="seo_title" type="text" class="form-control" id="title" value="<?= $category['seo_title'] ?? '' ?>" placeholder="جهت نمایش در title جستجو " autofocus>
                </div>
            </div>
            <div class="form-group row">
                <label for="description" class="col-sm-2 col-form-label">HTML Description</label>
                <div class="col-sm-10">
                    <input name="seo_description" type="text" class="form-control" id="description" value="<?= $category['seo_description'] ?? '' ?>" placeholder="جهت نمایش در description جستجو " autofocus>
                </div>
            </div>
            <div class="form-group row">
                <label for="inputEmail3" class="col-sm-2 col-form-label">نام</label>
                <div class="col-sm-10">
                    <input name="name" type="text" class="form-control" id="inputEmail3" value="<?= $category['name'] ?? '' ?>" placeholder="نام زیر دسته را وارد نمایید" autofocus>
                </div>
            </div>
            <div class="form-group row">
                <label for="inputPassword3" class="col-sm-2 col-form-label">Slug</label>
                <div class="col-sm-10">
                    <input name="slug" type="text" class="form-control" id="inputPassword3" value="<?= $category['slug'] ?? '' ?>" placeholder="نامه دسته بندی جهت نمایش در url">
                </div>
            </div>
            <div class=" form-group row">
				<label for="H1" class="col-2 col-form-label">H1</label>
				<div class="col-10">
					<input name="H1" type="text" class="form-control" id="H1" value="<?= $category['H1'] ?? '' ?>" placeholder="ترجیحا بین 20 تا 70 کاراکتر" required>
				</div>
			</div>
			<div class="form-group row">
				<label for="Canonical" class="col-2 col-form-label">Canonical</label>
				<div class="col-10">
					<input name="canonical" type="text" class="form-control" id="Canonical" value="<?= $category['canonical'] ?? '' ?>" placeholder="لینک را وارد نمایید">
				</div>
			</div>

			<div class=" form-group row">
				<label for="textarea" class="col-2 col-form-label"> درباره دسته بندی </label>
				<div class="col-10">
					<textarea name="description" type="text" class="form-control" id="textarea" placeholder="" rows="3" required><?= $category['description'] ?></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label for="robot" class="col-2 col-form-label">robots</label>
				<div class="col-10">
					<select name='robot' id="robot" class="form-control ">
						<?php foreach ($robots as $key => $value) : ?>
							<option value="<?= $key ?>" <?= $category['robots'] == $key ?  'selected' : ''  ?>><?= $value ?></option>
						<?php endforeach; ?>
					</select>
				</div>
			</div>
			<div class="pt-2 pb-2 form-check">
				<input name="status" type="checkbox" class="form-check-input" id="status" <?= $category['status'] ?  'checked' : ''  ?>>
				<label class="form-check-label" for="status">
					وضعیت
				</label>
			</div>
			<?php if (empty($photo['path'])) : ?>
				<div class=" form-group row">
					<label for="slug" class="col-2 col-form-label">عکس</label>
					<div class="col-10">
						<div class="custom-file">
							<input name="image_category" type="file" class="custom-file-input" id="inputGroupFile04">
							<label class="custom-file-label" for="inputGroupFile04">Choose file</label>
						</div>
					</div>
				</div>
			<?php else : ?>
				<div class="text-center">
					<!-- Button trigger modal -->
					<span type="button" class="btn w-50" data-toggle="modal" data-target="#form-modal-edit-photo" title="جهت ویرایش کلیک کتید">
						<img id="img-edit" src="<?= $photo['path'] ?>" class="rounded img-fluid " data-img-name="" alt="<?= $photo['alt'] ?>" />
					</span>
					<!-- Modal -->
					<div id="form-modal-edit-photo" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-body">
									<input name="image_category" id="input-edit" type="file">
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-success" data-dismiss="modal">تایید</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<?php endif; ?>
				<div class="form-group row">
					<div class="col-sm-10">
						<button type="submit" class="btn btn-primary">ذخیره</button>
						<a href="<?= base_url() ?>admin/category" class="btn btn-danger">انصراف</a>
					</div>
				</div>
			</form>
		</div>
	</div>
<?php
include(BASEPATH . "App/Views/Backend/category/product/script.php");
include_once BASEPATH  . 'App/Views/Backend/layouts/include/ckeditor.php';
?>