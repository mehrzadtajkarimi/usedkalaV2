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
                    }
                });
            }
        });


        $('.like').click(function() {
            var that = this;
            var id   = $(this).data('id');
            alert( $(this.i).data('id'));
            $.ajax({
                type: "post",
                url: '<?= base_url() ?>product/comment/' + id + '/like',
                success: function(data) {
                    $('.dislike').removeClass('text-danger')
                    $(that).addClass('text-success')
                }
            });
        });
        $('.dislike').click(function() {
            var that = this;
            var id   = $(this).data('id');
            alert( $(this).data('id'));
            $.ajax({
                type: "post",
                url: '<?= base_url() ?>product/comment/' + id + '/dislike',
                success: function(data) {
                    $('.like').removeClass('text-success')
                    $(that).addClass('text-danger')
                }
            });
        });
    });
</script>