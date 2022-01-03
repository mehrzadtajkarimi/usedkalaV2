<div class="card">
    <div class="card-header">
        <h5>ایجاد زیردسته‌ی «<?= $category['name'] ?>» برای «<?= $type_amounts['type_persian'] ?>»</h5>

    </div>
    <div class="card-body">

        <form action="<?= base_url() ?>admin/category/<?= $category['id'] ?> ?>" method="post" enctype="multipart/form-data">
            <div class="form-group row">
                <label for="title" class="col-sm-2 col-form-label">HTML Title</label>
                <div class="col-sm-10">
                    <input name="seo_title" type="text" class="form-control" id="title" placeholder="جهت نمایش در title جستجو " autofocus>
                </div>
            </div>
            <div class="form-group row">
                <label for="seo_description" class="col-sm-2 col-form-label">HTML Description</label>
                <div class="col-sm-10">
                    <input name="seo_description" type="text" class="form-control" id="seo_description" placeholder="جهت نمایش در description جستجو " autofocus>
                </div>
            </div>
            <div class="form-group row">
                <label for="inputEmail3" class="col-sm-2 col-form-label">نام</label>
                <div class="col-sm-10">
                    <input name="name" type="text" class="form-control" id="inputEmail3" placeholder="نام زیر دسته را وارد نمایید" autofocus>
                </div>
            </div>
            <div class="form-group row">
                <label for="inputPassword3" class="col-sm-2 col-form-label">Slug</label>
                <div class="col-sm-10">
                    <input name="slug" type="text" class="form-control" id="inputPassword3" placeholder="نامه دسته بندی جهت نمایش در url">
                </div>
            </div>
            <div class=" form-group row">
				<label for="H1" class="col-2 col-form-label">H1</label>
				<div class="col-10">
					<input name="H1" type="text" class="form-control" id="H1" placeholder="ترجیحا بین 20 تا 70 کاراکتر" required>
				</div>
			</div>
			<div class="form-group row">
				<label for="Canonical" class="col-2 col-form-label">Canonical</label>
				<div class="col-10">
					<input name="Canonical" type="text" class="form-control" id="Canonical" placeholder="لینک را وارد نمایید">
				</div>
			</div>
			<div class=" form-group row">
				<label for="slug" class="col-2 col-form-label">عکس</label>
				<div class="col-10">
					<div class="custom-file">
						<input name="image_category" type="file" class="custom-file-input" id="inputGroupFile04">
						<label class="custom-file-label" for="inputGroupFile04">Choose file</label>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label for="description" class="col-2 col-form-label"> درباره دسته بندی </label>
				<div class="col-10">
				<textarea name="description" class="form-control"  id="textarea"rows="3" required></textarea>

					<!-- <textarea name="description" type="text" class="form-control" id="textarea" placeholder="" rows="3" required></textarea> -->
				</div>
			</div>
			<div class="form-group row">
				<label for="robots" class="col-2 col-form-label">Robots</label>
				<div class="col-10">
					<select name='robot' id="robots" class="form-control ">
						<?php foreach ($robots as $key => $value) : ?>
							<option value="<?= $key ?>"><?= $value ?></option>
						<?php endforeach; ?>
					</select>
				</div>
			</div>
			<div class="pt-2 pb-2 form-check">
				<input value="1" name="status" type="checkbox" class="form-check-input" id="status" checked>
				<label class="form-check-label" for="status">
					وضعیت
				</label>
			</div>
			<div class="form-group row">
				<div class="col-sm-10">
					<button type="submit" class="btn btn-primary">ذخیره</button>
				</div>
			</div>
        </form>
    </div>
</div>
<?php
include(BASEPATH . "App/Views/Backend/category/product/script.php");
include_once BASEPATH  . 'App/Views/Backend/layouts/include/ckeditor.php';
?>