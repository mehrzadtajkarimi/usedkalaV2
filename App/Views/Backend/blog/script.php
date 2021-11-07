<script>
    $(document).ready(function() {

        CKEDITOR.replace('textarea', {
            extraPlugins: 'filebrowser',
            height: 300,
            // filebrowserUploadUrl: "/admin/setting/upload",
            filebrowserUploadUrl: "/upload.php",
            filebrowserUploadMethod: "form"
        });
        $('#input-edit').change(function() {
            var url = this.value;
            var pic_name = this.files[0];
            var ext = url.substring(url.lastIndexOf('.') + 1).toLowerCase();
            if (this.files && this.files[0] && (ext == "gif" || ext == "png" || ext == "jpeg" || ext == "jpg")) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    $('#img-edit').attr('src', e.target.result);
                    $('#image-hidden').attr('value', pic_name);
                }
                reader.readAsDataURL(this.files[0]);
            }
        });

        $('#blog-category').select2({
            'placeholder': 'دسته بندی های مورد نظر را انتخاب کنید'
        });
        $('#blog-tag').select2({
            'placeholder': 'دسته بندی های مورد نظر را انتخاب کنید'
        });


    });
</script>