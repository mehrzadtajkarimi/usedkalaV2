<script>
    $(document).ready(function() {
        new WOW().init();


        $('.like').click(function() {
            alert('like')
            var action = '<?= base_url() ?>like/';
            var id = $(this).children('i').data('id');
            var type = $(this).children('i').data('type');
            $.ajax({
                type: "post",
                url: action,
                data: {
                    entity_id: id,
                    entity_type: type
                },
                success: function(response) {
                    console.log(response);
                    if (response != "") {
                        $(this).children('i').html(response);
                    }
                    $('.dislike').removeClass('text-danger')
                    $(this).addClass('text-success')
                }
            });
        });
        $('.dislike').click(function() {
            alert('dislike')
            var that = this;
            var action = '<?= base_url() ?>dislike/';
            var id = $(this).children('i').data('id');
            var type = $(this).children('i').data('type');
            $.ajax({
                type: "post",
                url: action ,
                data: {
                    entity_id: id,
                    entity_type: type
                },
                success: function(response) {
                    console.log(response);
                    if (response != "") {
                        $(this).children('i').html(response);
                    }
                    $('.like').removeClass('text-success')
                    $(this).addClass('text-danger')
                }
            });
        });
    });
</script>