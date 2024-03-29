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


        $('.status_sender').click(function(e) {

            $('.tracker').fadeOut(0);
            $('.tracker input').prop('required', false).val('');
            if (this.value == 1) {
                $('.tracker-post input').prop('required', true);
                $('.tracker-post').fadeIn(400);
            }
            if (this.value == 2) {
                $('.tracker-postbar input').prop('required', true);
                $('.tracker-postbar').fadeIn(400);
            }
            if (this.value == 3) {
                $('.tracker-chapar input').prop('required', true);
                $('.tracker-chapar').fadeIn(400);
            }
            if (this.value == 4) {
                $('.tracker-alopeyk input').prop('required', true);
                $('.tracker-alopeyk').fadeIn(400);
            }
            if (this.value == 5) {
                $('.tracker-snappـbox input').prop('required', true);
                $('.tracker-snappـbox').fadeIn(400)
            }
        });

        $('.btn-submit-order-tracing').click(function() {

            $('.form-order-tracing').submit(function(e) {
                e.preventDefault();
                alert('Success');
                that = $('.form-order-tracing');
                id = that.data('id');
                url = that.val('action');

                $.ajax({
                    type: "post",
                    url: url,
                    data: {
                        'id': id
                    },
                    success: function(response) {
                        alert(response);
                    }
                });


            });
        });



        $('#order-category').select2({
            'placeholder': 'دسته بندی های مورد نظر را انتخاب کنید'
        });
        $('#order-tag').select2({
            'placeholder': 'دسته بندی های مورد نظر را انتخاب کنید'
        });

        $('.check-box-handler').on('change', function() {
            var that = $(this);
            var order_id = $(that).data('id');
            if ($(that).is(':checked')) {
                var type = 2;
                 // location.reload();
                location=location;
            }
            $.ajax({
                type: "post",
                url: '<?= base_url() ?>admin/order/status/' + order_id,
                data: {
                    'order_id': order_id,
                    'type': type
                },
                success: function(response) {
                    if (response) {
                        $('.check-box-handler-' + order_id).parents().eq(3).fadeOut(1000, function() {
                            $('.check-box-sender-' + order_id).parents().eq(3).fadeIn(1000);
                        });
                    }
                },
            });
        });

        $('.check-box-sender').on('change', function() {
            var that = $(this);
            var order_id = $(that).data('id');
            var status_sender = $(that).data('status_sender');

            if ($(that).is(':checked')) {
                var type = 3;
                if (status_sender) {
                    var isGood = confirm('لطفا ابتدا روش ارسال را مشخص کنید');
                    // location.reload();
                    location=location;
                }
            }
            $.ajax({
                type: "post",
                url: '<?= base_url() ?>admin/order/status/' + order_id,
                data: {
                    'order_id': order_id,
                    'type': type
                },
                success: function(response) {
                    if (response) {
                        $('.check-box-sender-' + order_id).parents().eq(3).fadeOut(1000, function() {
                            $('.check-box-delivery-' + order_id).parents().eq(2).fadeIn(1000);
                        });
                    }
                },
            });
        });

        $('.check-box-delivery').on('change', function() {
            var order_id = $(that).data('id');
            $('.check-box-delivery' + order_id).parents().eq(3).fadeOut(1000);
        });


        $('.handler').click(function(e) {
            e.preventDefault();
            var that = $(this);
            var order_id = $(this).data('id');
            // that.empty();
            $.ajax({
                type: "post",
                url: '<?= base_url() ?>admin/order/get_admin',
                data: {
                    'order_id': order_id,
                    'type': 1
                },
                success: function(response) {
                    that.fadeOut(function() {
                        that.html(response);
                        that.fadeIn();
                        $('#check-box').parent().css('d-none');
                    });
                },
            });
        });
        $('.sender').click(function(e) {
            e.preventDefault();
            that = $(this);
            var order_id = $(this).data('id');
            $.ajax({
                type: "post",
                url: '<?= base_url() ?>admin/order/get_admin',
                data: {
                    'order_id': order_id,
                    'type': 2
                },
                success: function(response) {
                    console.log(that);
                    that.fadeIn(10000).delay(20000);
                    that.html(response);
                },
            });
        });



        $('.access-show').click(function(e) {
            e.preventDefault();
            var order_id = $(this).data('id');
            var order_tbody = $(".target-collapse-response-" + order_id + " .target-tbody");
            var order_tfoot = $(".target-collapse-response-" + order_id + " .target-tfoot");
            var order_tr = $(".target-collapse-response-" + order_id);
            $.ajax({
                type: "post",
                url: '<?= base_url() ?>admin/order/get_orders',
                data: {
                    'order_id': order_id
                },
                success: function(response) {
                    data = JSON.parse(response);
                    console.log(data);
                    order_tbody.empty();
                    $(data).each(function(key, value) {
                        console.log(value);
                        order_tr.fadeIn(1000).delay(200);
                        if (value['discount_percent']) {
                            order_tbody.append(`
                                <tr>
                                    <td class='text-center'>
                                        <pre class='text-muted '>` + key + `</pre>
                                    </td>
                                    <td class='text-center'>
                                        <span class='text-muted '>` + value['title'] + `</span>
                                    </td>
                                    <td class='text-center'>
                                        <small>
                                            <del class='text-danger'>
                                                ` + number_format(value['price']) + `
                                            </del>
                                        </small>
                                        <pre class='text-muted '>` + number_format(value['discount_percent']) + `</pre>
                                    </td>
                                    <td class='text-center'>
                                        <pre class='text-muted '>` + number_format(value['quantity']) + `</pre>
                                    </td>
                                    <td class='text-center'>
                                        <pre class='text-muted '>` + number_format(value['quantity'] * value['discount_percent']) + `</pre>
                                    </td>
                                </tr>
                            `);
                        } else {
                            order_tbody.append(`
                                <tr>
                                    <td class='text-center'>
                                        <pre class='text-muted '>` + key + `</pre>
                                    </td>
                                    <td class='text-center'>
                                        <span class='text-muted '>` + value['title'] + `</span>
                                    </td>
                                    <td class='text-center'>
                                        <pre class='text-muted '>` + number_format(value['price']) + `</pre>
                                    </td>
                                    <td class='text-center'>
                                        <pre class='text-muted '>` + number_format(value['quantity']) + `</pre>
                                    </td>
                                    <td class='text-center'>
                                        <pre class='text-muted '>` + number_format(value['quantity'] * value['price']) + `</pre>
                                    </td>
                                </tr>
                            `);
                        };
                    });

                    var sum = 0;
                    $(data).each(function(key, value) {
                        discount_percent = value['percent'] > 0 ? value['percent'] : 0;

                        if (value['discount_percent'] && value['discount_coupon']) {
                            sum += Number(value['quantity'] * value['discount_coupon']);
                        } else if (value['discount_percent']) {
                            console.log(value['discount_coupon']);

                            sum += Number(value['quantity'] * value['discount_percent']);
                        } else if (value['discount_coupon']) {

                            sum += Number(value['quantity'] * value['discount_coupon']);
                        } else {

                            sum += Number(value['quantity'] * value['price']);

                        };
                    });
                    let created_at = new Date(data[0]['created_at']).toLocaleDateString('fa-IR');
                    console.log(created_at);
                    if (discount_percent > 0) {
                        order_tfoot.append(`
                            <tr>
                                <td colspan="10">
                                    <div class="row">    
                                    <div class="col-3">
                                        <b class='text-muted font-weight-bold d-block'>آدرس : ` + data[0]['address'] + `</b>
                                        <b class='text-muted font-weight-bold d-block'>تاریــخ  : ` + created_at + `</b>
                                    </div>
                                        <div class="offset-5"></div>
                                        <div class="col-2">
                                            <pre class='text-muted font-weight-bold'> جمع کل + ` + discount_percent + ` تخفیف</pre>
                                        </div>
                                        <div class="col-2">
                                            <pre class='text-muted font-weight-bold'>` + number_format(sum) + `</pre>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        `);
                    } else {
                        order_tfoot.append(`
                            <tr>
                                <td colspan="10">
                                    <div class="row">    
                                    <div class="col-3">
                                        <b class='text-muted font-weight-bold d-block'>آدرس : ` + data[0]['address'] + `</b>
                                        <b class='text-muted font-weight-bold d-block'>تاریــخ  : ` + created_at + `</b>
                                    </div>
                                        <div class="offset-5"></div>
                                        <div class="col-2">
                                            <pre class='text-muted font-weight-bold'>جمع کل</pre>
                                        </div>
                                        <div class="col-2">
                                            <pre class='text-muted font-weight-bold'>` + number_format(sum) + `</pre>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        `);
                    }
                },
            });
        });



        function number_format(floatvar, decimallength, sepratorstr) {
            if (sepratorstr == undefined || sepratorstr == "") sepratorstr = ",";
            var intvar = parseInt(floatvar);
            var decimals = floatvar - intvar;
            if (decimallength != undefined)
                var decimalstr = "." + decimals.toFixed(decimallength).toString().substr(2);
            else
                var decimalstr = "";
            var stringint = intvar.toString();
            var stringlength = parseInt(stringint.length);
            var sepcount = parseInt(stringlength / 3);
            var firstchars = parseInt(stringlength % 3);
            var returnstr = "";
            for (var i = 1; i <= sepcount; i++)
                returnstr = sepratorstr + stringint.substr(i * (-3), 3) + returnstr;
            if (firstchars == 0) returnstr = returnstr.substr(1);
            else returnstr = stringint.substr(0, firstchars) + returnstr;
            return returnstr + decimalstr;
        }





    });
</script>