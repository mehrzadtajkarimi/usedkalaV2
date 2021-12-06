<script>
    $(document).ready(function() {
        new WOW().init();


        $('.like_btn').click(function() {
            var action = '<?= base_url() ?>like';
            var like_btn = $(this);
            var dislike_btn = $(this).parent().siblings('.dislike').children('.dislike_btn');
            var count_box = $(this).parent().find('.count');
            $.ajax({
                type: "post",
                url: action,
                data: {
                    entity_id: like_btn.data('id'),
                    entity_type: like_btn.data('type'),
                },
                timeout: 10000,
                success: function(response) {
                    response = JSON.parse(response);
                    if(response.like){
                        count_box.html(response.like);
                        dislike_btn.removeClass('text-danger')
                        like_btn.addClass('text-success')
                    } else {
                        alert(response.error)
                    }
                },
                error: function(response) {
                    count_box.html("Err!");
                }
            });
        });
        $('.dislike_btn').click(function() {
            var action = '<?= base_url() ?>dislike';
            var dislike_btn = $(this);
            var like_btn = $(this).parent().siblings('.dislike').children('.like_btn');
            var count_box = $(this).parent().find('.count');
            $.ajax({
                type: "post",
                url: action,
                data: {
                    entity_id: dislike_btn.data('id'),
                    entity_type: dislike_btn.data('type')
                },
                success: function(response) {
                    response = JSON.parse(response);
                    if(response.dislike){
                        count_box.html(response.dislike);
                        like_btn.removeClass('text-success')
                        dislike_btn.addClass('text-danger')
                    } else {
                        alert(response.error)
                    }
                },
                error: function(response) {
                    count_box.html("Err!");
                }

            });
        });
        $('.wish_list_btn').click(function() {
            var action = '<?= base_url() ?>whishList';
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
    });
</script>