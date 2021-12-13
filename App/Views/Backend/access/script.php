<script>
    $(document).ready(function() {
        $('.access-permission').select2({
            'placeholder': 'دسته بندی های مورد نظر را انتخاب کنید'
        });
        $('.access-role').select2({
            'placeholder': 'دسته بندی های مورد نظر را انتخاب کنید'
        });
		
		function expand_block(that)
		{
			$(that).show();
			var targetHeight=$(that).height();
			$(that).css({overflow: "hidden", height: 0, display: "flex"});
			$(that).animate({height: targetHeight},function(){
				 $(that).css({overflow: "visible", height: "auto"});
			});
		}
        $('.button-collapse').click(function(e) {
            e.preventDefault();
            var target = $(this).data('target')+" > td > .row";
			
			var expandedBlock=undefined;
			$('.target-collapse > td > .row').each(function(){
				if (this.style.display=="flex")
				{
					expandedBlock=this;
					return true;
				}
			});
			
			if (expandedBlock!=undefined)
			{
				$(expandedBlock).css({overflow: "hidden", display: "flex"});
				$(expandedBlock).animate({height: 0},function(){
					$(expandedBlock).css({overflow: "visible", height: "auto", display: "none"});
					expand_block(target);
				});
			}
			else expand_block(target);
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
                        <div class='row'>
                        <div class='col'>
                        <a href='<?= base_url() ?>admin/access/delete_access/permission/` + value[2] + `' onclick="return confirm('آیا برای حذف اطلاعات اطمینان دارید');">
                        <i class='ml-3 fa fa-times-circle text-danger fa-lg'></i>
                        </a>
                        ` + value[1] + `
                        </div>
                        <div class='col'>
                        <span class='text-muted '>` + value[0] + `</span>
                        </div>
                        </div>
                        `);
                    });
                    role.empty();
                    $(data.role).each(function(key, value) {
                        console.log(data.role);
                        role.append(`
                        <div class='row'>
                        <div class='col'>
                        <a href='<?= base_url() ?>admin/access/delete_access/role/` + value[2] + `' onclick="return confirm('آیا برای حذف اطلاعات اطمینان دارید');">
                        <i class='ml-3 fa fa-times-circle text-danger fa-lg'></i>
                        </a>
                        <span>` + value[1] + `</span>
                        </div>
                        <div class='col'>
                        <span class='text-muted '>` + value[0] + `</span>
                        </div>
                        </div>
                        `);
                    });
                },
            });


        });

    });
</script>