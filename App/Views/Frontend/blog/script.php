<script>
    $(document).ready(function() {
        new WOW().init();


        $('.like_btn').click(function() {
            var action = '<?= base_url() ?>like';
            var like_btn = $(this);
            var dislike_btn = $('.dislike_btn');
            var count_box = $(this).parent().find('.count');
            count_box.html('..loading..');
            $.ajax({
                type: "post",
                url: action,
                data: {
                    entity_id: btn.data('id'),
                    entity_type: btn.data('type'),
                },
                timeout: 10000,
                success: function(response) {
                    count_box.html(response);
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
            count_box.html('..loading..');
            $.ajax({
                type: "post",
                url: action,
                data: {
                    entity_id: btn.data('id'),
                    entity_type: btn.data('type')
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
    });
</script>