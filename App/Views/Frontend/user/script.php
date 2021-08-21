<script>
    $(document).ready(function() {
        $(".quantity").click(function(e) {
            theURL = $(this).attr('href');
            e.preventDefault();
            $.ajax({
                url: theURL,
                success: function(result) {
                    $("#quantity").html(result);
                    new WOW().init();
                }
            });
        });


    });
</script>