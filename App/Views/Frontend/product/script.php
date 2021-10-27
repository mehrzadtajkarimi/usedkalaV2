<script>
    $(document).ready(function() {
        new WOW().init();
        $("#theForm").submit(function(e) {
            e.preventDefault(); // avoid to execute the actual submit of the form.
            var form = $(this);
            var url = form.attr('action');
            if (<?= $auth ?>) {
                $.ajax({
                    type: "POST",
                    url: url,
                    data: form.serialize(), // serializes the form's elements.
                    success: function(data) {
                        $("#myForm").addClass('WOW slideInLeft d-block');
                    }
                });
            }
        });
    });
</script>