<script>
    function replaceAll(str) {
        str = str.toString();
        str = str.replace(/0/g, "۰");
        str = str.replace(/1/g, "۱");
        str = str.replace(/2/g, "۲");
        str = str.replace(/3/g, "۳");
        str = str.replace(/4/g, "۴");
        str = str.replace(/5/g, "۵");
        str = str.replace(/6/g, "۶");
        str = str.replace(/7/g, "۷");
        str = str.replace(/8/g, "۸");
        str = str.replace(/9/g, "۹");

        return str;
    }
    function isEmpty( el ){
        return !$.trim(el.html())
    }

    $(document).ready(function() {
        if(window.location.href == '<?= base_url() ?>wishList'){
            if(isEmpty($('.products'))){
                $('.products-row').append('<div class="alert alert-warning">محصولی یافت نشد</div>')
            }
        }
        new WOW().init();
        $(".theForm").submit(function(e) {
            e.preventDefault(); // avoid to execute the actual submit of the form.
            var form = $(this);
            var url = form.attr('action');
            if (<?= $auth ? $auth : "FALSE" ?>) {
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
                        count_box.html(replaceAll(response.like));
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
                        count_box.html(replaceAll(response.dislike));
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
            var wish_list_btn = $(this);
            if(!wish_list_btn.hasClass('text-danger')){
                var action = '<?= base_url() ?>wishList';
                $.ajax({
                    type: "post",
                    url: action,
                    data: {
                        entity_id: wish_list_btn.data('id'),
                        entity_type: wish_list_btn.data('type')
                    },
                    timeout: 10000,
                    success: function(response) {
                        response = JSON.parse(response);
                        if(response.error){
                            alert(response.error)
                        } else{
                            wish_list_btn.removeClass('fa fa-heart-o')
                            wish_list_btn.addClass('fa fa-heart text-danger')
                            $('#top-cart-wishlist-count').text(replaceAll(response.count))
                        }
                    },
                    error: function(response) {
                        wish_list_btn.html("Err!");
                    }
    
                });
            } else {
                var action = '<?= base_url() ?>wishList/remove';
                $.ajax({
                    type: "post",
                    url: action,
                    data: {
                        entity_id: wish_list_btn.data('id'),
                        entity_type: wish_list_btn.data('type')
                    },
                    timeout: 10000,
                    success: function(response) {
                        response = JSON.parse(response);
                        wish_list_btn.removeClass('fa fa-heart text-danger')
                        wish_list_btn.addClass('fa fa-heart-o')
                        $('#top-cart-wishlist-count').text(replaceAll(response.count_wishlist))
                    },
                    error: function(response) {
                        wish_list_btn.html("Err!");
                    }
    
                });
            }
        });
        $('.add_to_wishlist').click(function(e) {
            e.preventDefault();
            var wish_list_btn = $(this);
            if(!wish_list_btn.hasClass('active')){
                var action = '<?= base_url() ?>wishList';
                $.ajax({
                    type: "post",
                    url: action,
                    data: {
                        entity_id: wish_list_btn.data('id'),
                        entity_type: wish_list_btn.data('type')
                    },
                    timeout: 10000,
                    success: function(response) {
                        response = JSON.parse(response);
                        if(response.error){
                            alert(response.error)
                        } else {
                            wish_list_btn.addClass('active')
                            $('#top-cart-wishlist-count').text(replaceAll(response.count))
                        }
                    },
                    error: function(response) {
                        wish_list_btn.html("Err!");
                    }
    
                });
            } else {
                var action = '<?= base_url() ?>wishList/remove';
                $.ajax({
                    type: "post",
                    url: action,
                    data: {
                        entity_id: wish_list_btn.data('id'),
                        entity_type: wish_list_btn.data('type')
                    },
                    timeout: 10000,
                    success: function(response) {
                        response = JSON.parse(response);
                        wish_list_btn.removeClass('active');
                        $('#top-cart-wishlist-count').text(replaceAll(response.count_wishlist));
                        if(window.location.href == '<?= base_url() ?>wishList'){
                            wish_list_btn.parent().parent().remove();
                            if(response.count_wishlist == 0){
                                $('.products-row').append('<div class="alert alert-warning">محصولی یافت نشد</div>')
                            }
                        }
                    },
                    error: function(response) {
                        wish_list_btn.html("Err!");
                    }
    
                });
            }
        });
    });
</script>