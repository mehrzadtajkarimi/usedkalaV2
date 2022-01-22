<script>
    $(document).ready(function() {

        $('#discount_product').select2({
            'placeholder': 'نقش های مورد نظر را انتخاب کنید'
        });
        $('#discount_category').select2({
            'placeholder': 'نقش های مورد نظر را انتخاب کنید'
        });

        $('.btn_show_discant').click(function(e) {
            var id = $(this).data('id');
            var url = "/admin/discount/show";

            $.post(url, {
                'id': id,
            }, function(data) {
                var obj = JSON.parse(data)
                $('.show_discant').fadeIn()
                $(obj).each(function(key, value) {
                    // console.log(value[0]);

                    $('.show_discant_'+id).fadeIn(600).append(`
                                        <div>
                                            <span class='text-muted '>` + value[1] + ` id: </span>
                                            <span class='text-muted '>` + value[0] + `</span>
                                        </div>
                                    `);
                });





            });

        });

    });
</script>