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



        $('#robots').select2({
            'placeholder': 'robots های مورد نظر را انتخاب کنید'
        });
        // $('#input-edit').change(function() {
        //     $("input[type='file']").prop("files", e.originalEvent.dataTransfer.files);
        // });





    });
</script>