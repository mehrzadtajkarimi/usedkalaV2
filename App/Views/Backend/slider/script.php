<script>
    $(document).ready(function() {

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

        $('#slider_product').click(function(){
            $('#slider_category').prop('disabled', true)
            $('#slider_product').select2({
                'placeholder': ' محصول مورد نظر را انتخاب کنید',
                'maximumSelectionLength': 1,
            });
        });

        $('#slider_category').select2({
            'placeholder': ' دسته بندی مورد نظر را انتخاب کنید',
            'maximumSelectionLength': 1
        });
        $("#coba").spartanMultiImagePicker({
            fieldName: 'slider_image',
            groupClassName: 'col-12',
            rowHeight: '200px',
            maxCount: '1',
        });


    });
</script>