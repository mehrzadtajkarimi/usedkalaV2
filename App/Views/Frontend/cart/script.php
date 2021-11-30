<script>
    $(document).ready(function() {
        $(".quantity").children().click(function(e) {
            e.preventDefault();
            theURL = $(this).attr('href');
            $.get({
                url: theURL,
                success: function(result) {
                    result = JSON.parse(result);
                    $("#product-quantity").html(result.count);
                    $("#product-total-price").html(result.total);
                }
            });
        });


    });
</script>