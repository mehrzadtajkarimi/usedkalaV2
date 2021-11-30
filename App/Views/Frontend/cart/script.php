<script>
    $(document).ready(function() {
        $(".quantity").children().click(function(e) {
            theURL = $(this).data('href');
            $.get({
                url: theURL,
                success: function(result) {
                    $(".quantity").html(result);
                    // new WOW().init();
                }
            });
        });


    });
</script>