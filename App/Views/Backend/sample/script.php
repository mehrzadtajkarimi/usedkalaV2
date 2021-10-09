<script>
    $(document).ready(function() {

        $('#sample_product').select2({
            'placeholder': 'محصول های مورد نظر را انتخاب کنید'
        });
        $('#sample_category').select2({
            'placeholder': 'دسته بندی های مورد نظر را انتخاب کنید'
        });

        var timer = null;
        $('#Input3').keyup(function(e) {
            clearTimeout(timer); 
            setTimeout(
                function() {
                    $( "#Input4" ).prop( "disabled", false );
                }, 750);
        });
        $('#Input4').keyup(function(e) {
            clearTimeout(timer); 
            setTimeout(
                function() {
                    $( "#sample_product" ).prop( "disabled", false );
                }, 750);
        });


    });
</script>