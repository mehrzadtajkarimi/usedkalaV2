<script>
    $(document).ready(function() {
        new WOW().init();
        $(".theForm").submit(function(e) {
            e.preventDefault(); // avoid to execute the actual submit of the form.
            var form = $(this);
            var url = form.attr('action');
            $.ajax({
                type: "POST",
                url: url,
                data: form.serialize(), // serializes the form's elements.
                success: function(data) {
                    $("#myForm").addClass('WOW slideInLeft d-block');
                }
            });
        });

        $('.like').click(function() {
            alert('like')
            var that = this;
            var id = $(this).children('i').data('id');
            var type = $(this).children('i').data('type');
            $.ajax({
                type: "post",
                url: '<?= base_url() ?>like/' + id + '/' + type + ,
                success: function(response) {
                    console.log(response);
                    if (response != "") {
                        $(this).children('i').html(response);
                    }
                    $('.dislike').removeClass('text-danger')
                    $(that).addClass('text-success')
                }
            });
        });
        $('.dislike').click(function() {
            alert('dislike')
            var that = this;
            var id = $(this).children('i').data('id');
            var type = $(this).children('i').data('type');
            $.ajax({
                type: "post",
                url: '<?= base_url() ?>dislike/' + id + '/' + type + ,
                success: function(response) {
                    console.log(response);
                    if (response != "") {
                        $(this).children('i').html(response);
                    }
                    $('.like').removeClass('text-success')
                    $(that).addClass('text-danger')
                }
            });
        });
    });
</script>