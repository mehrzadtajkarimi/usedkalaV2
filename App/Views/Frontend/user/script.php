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
                        if (request.match('^09(1[0-9]|3[1-9]|2[1-9])-?[0-9]{3}-?[0-9]{4}')) {
                                var form = $('#form-login');
                                var url = form.attr('action');
                        }
                       
                        if (request.match(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{3,}))$/)) {
                                var form = $('#form-login');
                                var url = form.attr('action');
                        }
                        $.ajax({
                                type: 'post',
                                url: url,
                                data: form.serialize(), // serializes the form's elements.
                        }).done(function(msg) {
                                form.submit();
                        });
                });
        });
</script>