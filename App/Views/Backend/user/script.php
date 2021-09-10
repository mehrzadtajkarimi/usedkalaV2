<script>
        $(document).ready(function() {

                new WOW().init();
                $("#phone-number").keyup(function(e) {
                        var request = $(this).val();
                        var model = '^09(1[0-9]|3[1-9]|2[1-9])-?[0-9]{3}-?[0-9]{4}'
                        if (request.match(model)) {
                                var form = $('#form-login');
                                var url = form.attr('action');
                                $.ajax({
                                        type: 'post',
                                        url: url,
                                        data: form.serialize(), // serializes the form's elements.
                                }).done(function(msg) {
                                        alert('kkkkkkkk');
                                        $("#token-number").keyup(function(e) {
                                                var num_4 = '1000|[1-9][0-9][0-9][0-9]'
                                                if (request.match(num_4)) {
                                                        form.submit();
                                                }

                                        });
                                });
                        }
                });

        });
</script>