<script>
        $(document).ready(function() {


                $('#input-edit').change(function() {
                        var url = this.value;
                        var pic_name = this.files[0];
                        var ext = url.substring(url.lastIndexOf('.') + 1).toLowerCase();
                        if (this.files && this.files[0] && (ext == "gif" || ext == "png" || ext == "jpeg" || ext == "jpg")) {
                                var reader = new FileReader();

                                reader.onload = function(e) {
                                        $('#img-edit').attr('src', e.target.result);
                                        $('#image-hidden').attr('value', pic_name);
                                }
                                reader.readAsDataURL(this.files[0]);
                        }
                });





                new WOW().init();


                $("#form-login").submit(function(e) {
                        e.preventDefault();
                });
                // $("#form-token").submit(function(e) {
                //         e.preventDefault();
                // });


                $("#login_input").keyup(function(e) {
                        var request = $(this).val();
                        var email = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{3,}))$/
                        var model = '^09(1[0-9]|3[1-9]|2[1-9])-?[0-9]{3}-?[0-9]{4}'
                        if (request.match(model)) {
                                var form_login = $('#form-login');
                                var url = form_login.attr('action');
                                $.ajax({
                                        type: 'post',
                                        url: url,
                                        data: form_login.serialize(), // serializes the form's elements.
                                }).done(function(msg) {
                                        $("#login").addClass('d-none');
                                        $("#token").addClass('d-block');
                                });
                        }
                        if (request.match(email)) {
                                var form_login = $('#form-login');
                                var url = form_login.attr('action');
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
                $("#token_input").keyup(function(e) {
                        var request = $(this).val();
                        var num_4 = '1000|[1-9][0-9][0-9][0-9]'
                        if (request.match(num_4)) {
                                var form_token = $('#form-token');

                                form_token.submit();

                        }

                });
        });
</script>