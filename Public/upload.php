<?php

die($_FILES['upload']);
$file   = $_FILES;
$fileUploadedCkeditor    = $file['upload'];
$file_tmp_name           = $file['upload']['tmp_name'];
$check_file_param_exists = !empty($file_tmp_name[0]);
if ($check_file_param_exists) {
    $file = new  App\Services\Upload\UploadedFile($fileUploadedCkeditor);
    $file->save();
    dd( $file->save());
    $function_number = $_GET['CKEditorFuncNum'];
    $url = $file->get_paths_for_storage();

    $message = '';
    echo "<script>window.parent.CKEDITOR.tools.callFunction('" . $function_number . "','" . $url . "','" . $message . "');</script>";
}
