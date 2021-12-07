<script>
    $(document).ready(function() {
        $('.access-permission').select2({
            'placeholder': 'دسته بندی های مورد نظر را انتخاب کنید'
        });
        $('.access-role').select2({
            'placeholder': 'دسته بندی های مورد نظر را انتخاب کنید'
        });

        $('.button-collapse').click(function(e) {
            e.preventDefault();
            var target = $(this).data('target');

            $('.target-collapse').slideUp();
            $(target).slideDown();

        });



        $('.access-show').click(function(e) {
            e.preventDefault();
            var id = $(this).data('id');
            var permission = $("#response-permission-" + id);
            var role = $("#response-role-" + id);
            $.ajax({
                type: "post",
                url: '<?= base_url() ?>admin/access/get_access',
                data: {
                    'id': id
                },
                success: function(response) {
                    data = JSON.parse(response);

                    permission.empty();
                    $(data.permission).each(function(key, value) {
                        console.log(data.permission);
                        permission.append(`
                        <div>
                        <a href='<?= base_url() ?>admin/access/delete_access/permission/` + value[2] + `' onclick="return confirm('آیا برای حذف اطلاعات اطمینان دارید');">
                        <i class='ml-3 fa fa-times-circle text-danger fa-lg'></i>
                        </a>    
                        ` + value[1] + `
                        </div>  
                        `);
                    });
                    role.empty();
                    $(data.role).each(function(key, value) {
                        console.log(data.role);
                        role.append(`
                        <div>
                        <a href='<?= base_url() ?>admin/access/delete_access/role/` + value[2] + `' onclick="return confirm('آیا برای حذف اطلاعات اطمینان دارید');">
                        <i class='ml-3 fa fa-times-circle text-danger fa-lg'></i>
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