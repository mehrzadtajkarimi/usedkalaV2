<script src="<?= asset_url() ?>Backend/plugins/datepicker/persian-date.min.js"></script>
<script src="<?= asset_url() ?>Backend/plugins/datepicker/persian-datepicker.min.js"></script>
<script>
        $(document).ready(function() {
                $(".profile-birthday").pDatepicker({
               "inline": false,
               "format": "YYYY/MM/DD",
               "viewMode": "day",
               "initialValue": true,
               "minDate": null,
               "maxDate": null,
               "autoClose": true,
               "position": "auto",
               "altFormat": "X",
               "altField": "#profile-birthday",
               "onlyTimePicker": false,
               "TimePicker": true,
               "onlySelectOnDate": true,
               "calendarType": "persian",
               "inputDelay": 800,
               "observer": true,
               "calendar": {
                   "persian": {
                       "locale": "fa",
                       "showHint": true,
                       "leapYearMode": "algorithmic"
                   },
                   "gregorian": {
                       "locale": "en",
                       "showHint": true
                   }
               },
               "navigator": {
                   "enabled": true,
                   "scroll": {
                       "enabled": true
                   },
                   "text": {
                       "btnNextText": "<",
                       "btnPrevText": ">"
                   }
               },
               "toolbox": {
                   "enabled": true,
                   "calendarSwitch": {
                       "enabled": true,
                       "format": "HH:mm"
                   },
                   "todayButton": {
                       "enabled": true,
                       "text": {
                           "fa": "امروز",
                           "en": "Today"
                       }
                   },
                   "submitButton": {
                       "enabled": true,
                       "text": {
                           "fa": "تایید",
                           "en": "Submit"
                       }
                   },
                   "text": {
                       "btnToday": "امروز"
                   }
               },
               "dayPicker": {
                   "enabled": true,
                   "titleFormat": "YYYY MMMM"
               },
               "monthPicker": {
                   "enabled": true,
                   "titleFormat": "YYYY"
               },
               "yearPicker": {
                   "enabled": true,
                   "titleFormat": "YYYY"
               },
               "responsive": true
           });
                
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