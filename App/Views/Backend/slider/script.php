<script>
    $(document).ready(function() {

        $('#slider_product').select2({
            'placeholder': 'نقش های مورد نظر را انتخاب کنید'
        });
        $('#slider_category').select2({
            'placeholder': 'نقش های مورد نظر را انتخاب کنید'
        });
        $("#coba").spartanMultiImagePicker({
            fieldName: 'slider_image',
            groupClassName: 'col-12',
            rowHeight: '200px',
            maxCount: '1',
        });


    });
</script>