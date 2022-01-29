<script>
    $(document).ready(function() {
        $(".quantity").children().click(function(e) {
            e.preventDefault();
            var that = $(this);
            var url  = that.attr('href');
            var id   = that.data('id');
            // alert(url);
            $.get({
                url: url,
                success: function(result) {
					// console.log(url+" result: "+result);
                    result = JSON.parse(result);
                    $(".product-quantity-" + id).html(result.count);
                    $(".product-total-price-" + id).html(result.total + " ریال");
                }
            });
        });


    });
</script>