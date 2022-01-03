<script>
    $(document).ready(function() {

        $('#coupon_product').select2({
            'placeholder': 'نقش های مورد نظر را انتخاب کنید'
        });
        $('#coupon_category').select2({
            'placeholder': 'نقش های مورد نظر را انتخاب کنید'
        });

        $("#coupon-all_coupon").click(function() {
            if ($(this).is(":checked")) {
                $(".coupon-product_all_coupon").hide(200).attr('required', 'false');
            } else {

                $(".coupon-product_all_coupon").show(450).attr('required', 'true');
            }
        });
        $("#coupon-all_price").click(function() {
            if ($(this).is(":checked")) {
                $(".coupon-product_all_price").hide(200).attr('required', 'false');
            } else {

                $(".coupon-product_all_price").show(450).attr('required', 'true');
            }
        });



    });
</script>