<script>
    $(document).ready(function() {
        new WOW().init();
        $(".theForm").submit(function(e) {
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
                        alert('دیدگاه با موفقیت ارسال شد.');
                    }
                });
            }
        });


        $('.like_btn').click(function() {
            var action = '<?= base_url() ?>like';
            var like_btn = $(this);
            var dislike_btn = $('.dislike_btn');
            var count_box = $(this).parent().find('.count');
            if (!like_btn.data('auth')) {
                alert('ابتدا باید وارد بشوید')
                return
            }
            count_box.html('..loading..');
            $.ajax({
                type: "post",
                url: action,
                data: {
                    entity_id: like_btn.data('id'),
                    entity_type: like_btn.data('type'),
                },
                timeout: 10000,
                success: function(response) {
                    response = JSON.parse(response)
                    console.log(response.count)
                    count_box.html(response.count);
                    dislike_btn.removeClass('text-danger')
                    like_btn.addClass('text-success')
                },
                error: function(response) {
                    count_box.html("Err!");
                }
            });
        });
        $('.dislike_btn').click(function() {
            var action = '<?= base_url() ?>dislike';
            var dislike_btn = $(this);
            var like_btn = $('.like_btn');
            var count_box = $(this).parent().find('.count');
            if (!dislike_btn.data('auth')) {
                alert('ابتدا باید وارد بشوید')
                return
            }
            count_box.html('..loading..');
            $.ajax({
                type: "post",
                url: action,
                data: {
                    entity_id: dislike_btn.data('id'),
                    entity_type: dislike_btn.data('type')
                },
                success: function(response) {
                    count_box.html(response);
                    like_btn.removeClass('text-success')
                    dislike_btn.addClass('text-danger')
                },
                error: function(response) {
                    count_box.html("Err!");
                }

            });
        });
        $('.wish_list_btn').click(function() {
            var action = '<?= base_url() ?>wishList';
            var wish_list_btn = $(this);
            if (!wish_list_btn.data('auth')) {
                alert('ابتدا باید وارد بشوید');
                return
            }
            $.ajax({
                type: "post",
                url: action,
                data: {
                    entity_id: wish_list_btn.data('id'),
                    entity_type: wish_list_btn.data('type')
                },
                timeout: 10000,
                success: function(response) {

                    wish_list_btn.removeClass('fa fa-heart-o')
                    wish_list_btn.addClass('fa fa-heart text-danger')
                },
                error: function(response) {
                    wish_list_btn.html("Err!");
                }

            });
        });
        $('.add_to_wishlist').click(function(e) {
            e.preventDefault();
            var action = '<?= base_url() ?>wishList';
            var wish_list_btn = $(this);
            if (!wish_list_btn.data('auth')) {
                alert('ابتدا باید وارد بشوید');
                return
            }
            $.ajax({
                type: "post",
                url: action,
                data: {
                    entity_id: wish_list_btn.data('id'),
                    entity_type: wish_list_btn.data('type')
                },
                timeout: 10000,
                success: function(response) {
                    wish_list_btn.addClass('active')
                },
                error: function(response) {
                    wish_list_btn.html("Err!");
                }

            });
        });
    });
</script>