<script>
    $(document).ready(function() {
        $(".quantity").click(function(e) {
            theURL = $(this).attr('href');
            e.preventDefault();
            $.ajax({
                url: theURL,
                success: function(result) {
                    $("#quantity").html(result);
                }
            });
        });
            $('#minus').addClass("fadeOutDown");
            $('#plus').addClass("fadeOutUp");
    });
</script>