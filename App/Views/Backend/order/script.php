<script>
    $(document).ready(function() {

        CKEDITOR.replace('textarea', {
            extraPlugins: 'filebrowser',
            height: 300,
            // filebrowserUploadUrl: "/admin/setting/upload",
            filebrowserUploadUrl: "/upload.php",
            filebrowserUploadMethod: "form"
        });
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

        $('#order-category').select2({
            'placeholder': 'دسته بندی های مورد نظر را انتخاب کنید'
        });
        $('#order-tag').select2({
            'placeholder': 'دسته بندی های مورد نظر را انتخاب کنید'
        });

        $('#check-box').on('change', function() {
            var order_id = $(this).data('id');

            if ($(this).is(':checked')) {
                var type = 2;
            }
            $.ajax({
                type: "post",
                url: '<?= base_url() ?>admin/order/status/' + order_id,
                data: {
                    'order_id': order_id,
                    'type': type
                },
                success: function(response) {
                    $(this).html('disabled');

                    alert(response);

                },
            });
        })


        $('.handler').click(function(e) {
            e.preventDefault();
            var order_id = $(this).data('id');
            $.ajax({
                type: "post",
                url: '<?= base_url() ?>admin/order/get_admin',
                data: {
                    'order_id': order_id,
                    'type': 1
                },
                success: function(response) {
                    console.log(response);
                    this.html(response);
                },
            });
        });
        $('.sender').click(function(e) {
            e.preventDefault();
            var order_id = $(this).data('id');
            $.ajax({
                type: "post",
                url: '<?= base_url() ?>admin/order/get_admin',
                data: {
                    'order_id': order_id,
                    'type': 2
                },
                success: function(response) {
                    console.log(response);
                    this.html(response);
                },
            });
        });



        $('.access-show').click(function(e) {
            e.preventDefault();
            var id = $(this).data('id');
            var order = $("#response-order-" + id);
            $.ajax({
                type: "post",
                url: '<?= base_url() ?>admin/order/get_orders',
                data: {
                    'id': id
                },
                success: function(response) {
                    data = JSON.parse(response);

                    order.empty();
                    $(data).each(function(key, value) {
                        console.log(data);
                        order.append(`
                        <div class='row'>
                        <div class='col'>
                            <span class='text-muted '>` + value + `</span>
                        </div>
                        </div>
                        `);
                    });

                },
            });


        });









    });
</script>