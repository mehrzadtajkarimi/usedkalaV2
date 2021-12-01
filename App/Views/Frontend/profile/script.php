<script>
        $(document).ready(function() {
               

                // $('#profile-province').select2({
                //         'placeholder': 'استان مورد نظر را انتخاب کنید',
                //         theme: "bootstrap4"
                // });
                if($('#profile-province').val() != ""){
                        var province_id = $('#profile-province').val();
                        var city_id = $("#profile-city").attr('data-city-id');
                        $.ajax({
                                type: "post",
                                url: "<?= base_url() ?>profile/city/" + province_id,
                                data: province_id,
                                success: function(response) {
                                        var response_array = JSON.parse(response);
                                        $("#profile-city").empty();
                                        response_array.forEach(function(i){
                                                if(i.id == city_id){
                                                        $('#profile-city').append('<option value="'+i.id+'" selected>'+i.name+'</option>');
                                                } else {
                                                        $('#profile-city').append('<option value="'+i.id+'">'+i.name+'</option>');
                                                }
                                        })
                                }
                        });
                }
                $('#profile-province').change(function() {
                        var id = $(this).val();
                        $.ajax({
                                type: "post",
                                url: "<?= base_url() ?>profile/city/" + id,
                                data: id,
                                success: function(response) {
                                        var response_array = JSON.parse(response);
                                        $("#profile-city").empty();
                                        response_array.forEach(function(i){
                                                $('#profile-city').append('<option value="'+i.id+'">'+i.name+'</option>');
                                        })
                                }
                        });
                });
        });
</script>