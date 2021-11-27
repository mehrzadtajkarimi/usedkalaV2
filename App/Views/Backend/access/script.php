<script>
    $(document).ready(function() {
        $('#role_permission').select2({
            'placeholder': 'دسته بندی های مورد نظر را انتخاب کنید'
        });


        $('#access-show').click(function(e) {
            e.preventDefault();
            var id = $(this).data('id');
            $.ajax({
                type: "post",
                url: '<?= base_url() ?>admin/access/get_access',
                data: {
                    'id': id
                },
                success: function(response) {
                    data = JSON.parse(response);
                    // alert(response.message);
                    console.log(data);
                    
                    $("#response-permission ul li").empty();
                    $(data.permission).each( function(key, value) {
                        console.log(value);
                        $("#response-permission ul li").append("<div>"+ value[1]+"</div>");
                    });
                    $("#response-role ul li").empty();
                    $(data.role).each( function(key, value) {
                        console.log(value);
                        $("#response-role ul li").append(value[1]);
                    });
                },
            });


        });

    });
</script>