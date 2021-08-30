<script>
        $(document).ready(function() {
                $("#register").click(function(e) {
                        url = $(this).attr('data-href');
                        e.preventDefault();
                        $.get(url, function() {
                                alert("Data: ");
                        });


                });







                new WOW().init();
                $("#login").keyup(function(e) {
                        var request = $(this).val();
                        var ready = false;
                        var email = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{3,}))$/
                        // var email =/^([\w-\.]+@(?!gmail.com)(?!yahoo.com)(?!hotmail.com)([\w-]+\.)+[\w-]{2,4})?$/
                        var model = '^09(1[0-9]|3[1-9]|2[1-9])-?[0-9]{3}-?[0-9]{4}'
                        if (request.match(model)) {
                                var form = $('#form-login');
                                var url = form.attr('action');
                                ready = true;
                        }

                        if (request.match(email)) {
                                var form = $('#form-login');
                                var url = form.attr('action');
                                ready = true;
                        }
                        if (ready == true) {
                                form.submit();
                        }
                });
                $("#token").keyup(function(e) {
                        var request = $(this).val();
                        var num_4 = '1000|[1-9][0-9][0-9][0-9]'
                        if (request.match(num_4)) {
                                var form = $('#form-login');
                                var url = form.attr('action');
                                form.submit();
                        }

                });
        });
</script>