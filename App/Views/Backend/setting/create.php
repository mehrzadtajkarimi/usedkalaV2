<div class="card">
	<div class="card-header">
		<h5>ایجاد ویژگی</h5>

	</div>
	<div class="card-body">
		<form action="<?= base_url() ?>admin/setting" method="post" enctype="multipart/form-data">
			<div class="form-group ">
				<label for="key" class=" col-form-label"> کلید (فقط حروف انگلیسی) </label>
				<input name="key" type="text" class="form-control" id="key" placeholder="" required>
			</div>
			<div class="form-group ">
				<label for="value" class=" col-form-label"> مقدار </label>
				<input name="value" type="text" class="form-control" id="value" placeholder="" required>
			</div>

			<div class="form-group row">
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">ذخیره</button>
                    <a href="<?= base_url() ?>admin/setting" class="btn btn-danger">انصراف</a>
                </div>
            </div>
		</form>
	</div>
</div>
<?php
include(BASEPATH . "/App/Views/Backend/setting/script.php");
?>