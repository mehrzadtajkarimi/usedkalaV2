<script>
    $(document).ready(function() {
        $('#product_category').select2({
            'placeholder': 'دسته بندی های مورد نظر را انتخاب کنید'
        });
		console.log('salam');
        $('#product_tag').select2({
            'placeholder': ' تگ های مورد نظر را انتخاب کنید'
        });
        $('#related-products-cat').select2({
            'placeholder': ' دسته بندی های مورد نظر را انتخاب کنید'
        });
        $('#related-products-name').select2({
            'placeholder': ' محصول یا محصولات مورد نظر را انتخاب کنید'
        });
        $('#related-products-status').change(function(){
            if($(this).val() == 1){
                $('#related-products-cat-placeholder').show();
                $('#related-products-name-placeholder').hide();
            } else if($(this).val() == 2){
                $('#related-products-name-placeholder').show();
                $('#related-products-cat-placeholder').hide();
            } else if($(this).val() == 0){
                $('#related-products-name-placeholder').hide();
                $('#related-products-cat-placeholder').hide();
            }
        });
		CKEDITOR.replace('product-description', {
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
        // $('#input-edit').change(function() {
        //     $("input[type='file']").prop("files", e.originalEvent.dataTransfer.files);
        // });
        $("#product-image").spartanMultiImagePicker({
            fieldName: 'fileUpload[]'
        });
    });
</script>