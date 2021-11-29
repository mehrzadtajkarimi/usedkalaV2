<script>
    $(document).ready(function() {
        $('#access-permission').select2({
            'placeholder': 'دسته بندی های مورد نظر را انتخاب کنید'
        });
        $('#access-role').select2({
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
                    
                    var response_role = $("#response-role ul li");
                    var response_permission = $("#response-permission ul li");
                    // alert(response.message);

                    response_permission.empty();
                    $(data.permission).each(function(key, value) {
                        console.log(value);
                        response_permission.append(`
                        <div>
                        <a href='<?= base_url() ?>admin/access/delete_access/permission/` + value[2] + `' onclick="return confirm('آیا برای حذف اطلاعات اطمینان دارید');">
                        <i class='fa fa-times-circle text-danger fa-lg ml-3'></i>
                        </a>    
                        ` + value[1] + `
                        </div>  
                        `);
                    });
                    response_role.empty();
                    $(data.role).each(function(key, value) {
                        console.log(value);
                        response_role.append(`
                        <div>
                        <a href='<?= base_url() ?>admin/access/delete_access/role/` + value[2] + `' onclick="return confirm('آیا برای حذف اطلاعات اطمینان دارید');">
                        <i class='fa fa-times-circle text-danger fa-lg ml-3'></i>
                        </a>
                        ` + value[1] + `
                        </div>
                        `);
                    });
                },
            });


        });

    });
</script>