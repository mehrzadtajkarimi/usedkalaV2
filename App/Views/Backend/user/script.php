<script>
        $(document).ready(function() {

                new WOW().init();
                $("#form-login").submit(function(e) {
                        e.preventDefault();
                });

                $("#phone-number").keyup(function(e) {
                        e.preventDefault();
                        var request_login = $("#phone-number").val();
                        var model = '^09(1[0-9]|3[1-9]|2[1-9])-?[0-9]{3}-?[0-9]{4}'
                        if (request_login.match(model)) {
                                var form_login = $('#form-login');
                                var url = form_login.attr('action');
                                // form_login.submit();
                                $.ajax({
                                        type: 'post',
                                        url: url,
                                        data: form_login.serialize(), // serializes the form's elements.
                                }).done(function(msg) {
                                        $("#login").addClass('d-none');
                                        $("#token").addClass('d-block');

                                });
                        }
                });
                $("#token-number").keyup(function(e) {
                        var request_token = $("#token-number").val();
                        var num_4 = '1000|[1-9][0-9][0-9][0-9]'
                        if (request_token.match(num_4)) {
                                var form_token = $('#form-token');
                                // var url = form_token.attr('action');
                                form_token.submit();
                        }

                });

        });
</script>