   <!-- /.content-wrapper -->

   <footer class="main-footer">
       <strong>CopyLeft &copy; 2018 <a href="http://github.com/hesammousavi/">حسام موسوی</a>.</strong>
   </footer>

   <!-- Control Sidebar -->
   <aside class="control-sidebar control-sidebar-dark">
       <!-- Control sidebar content goes here -->
   </aside>
   <!-- /.control-sidebar -->
   </div>
   <!-- ./wrapper -->


   <!-- Bootstrap 4 -->
   <script src="<?= asset_url() ?>Backend/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
   <!-- SlimScroll -->
   <script src="<?= asset_url() ?>Backend/plugins/slimScroll/jquery.slimscroll.min.js"></script>
   <!-- FastClick -->
   <script src="<?= asset_url() ?>Backend/plugins/fastclick/fastclick.js"></script>
   <!-- AdminLTE App -->
   <script src="<?= asset_url() ?>Backend/dist/js/adminlte.min.js"></script>
   <!-- AdminLTE for demo purposes -->
   <script src="<?= asset_url() ?>Backend/dist/js/demo.js"></script>



   <!-- OPTIONAL SCRIPTS -->
   <script src="<?= asset_url() ?>Backend/plugins/chart.js/Chart.min.js"></script>
   <script src="<?= asset_url() ?>Backend/plugins/WOW/dist/wow.min.js"></script>
   <script src="<?= asset_url() ?>Backend/dist/js/demo.js"></script>
   <script src="<?= asset_url() ?>Backend/dist/js/pages/dashboard3.js"></script>
   <script src="<?= asset_url() ?>Backend/plugins/Multiple-Image-Picker-jQuery/spartan-multi-image-picker-min.js"></script>
   <script src="<?= asset_url() ?>Backend/plugins/datepicker/persian-date.min.js"></script>
   <script src="<?= asset_url() ?>Backend/plugins/datepicker/persian-datepicker.min.js"></script>
   <script src="<?= asset_url() ?>Backend/plugins/select2/select2.min.js"></script>
   <script src="<?= asset_url() ?>Backend/dist/js/pages/my.js"></script>




   <script type="text/javascript">
       $(document).ready(function() {
           $(".start_at").pDatepicker({
               "inline": false,
               // "format": "LLLL",
               "viewMode": "day",
               "initialValue": true,
               "minDate": null,
               "maxDate": null,
               "autoClose": true,
               "position": "auto",
               "altFormat": "X",
               "altField": "#start_at",
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
               "timePicker": {
                   "enabled": true,
                   "step": "1",
                   "hour": {
                       "enabled": true,
                       "step": true
                   },
                   "minute": {
                       "enabled": true,
                       "step": null
                   },
                   "second": {
                       "enabled": false,
                       "step": null
                   },
                   "meridian": {
                       "enabled": null
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
           $(".finish_at").pDatepicker({
               "inline": false,
               // "format": "LLL",
               "viewMode": "day",
               "initialValue": true,
               "minDate": null,
               "maxDate": null,
               "autoClose": true,
               "position": "auto",
               "altFormat": "X",
               "altField": "#finish_at",
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
               "timePicker": {
                   "enabled": true,
                   "step": "1",
                   "hour": {
                       "enabled": true,
                       "step": true
                   },
                   "minute": {
                       "enabled": true,
                       "step": null
                   },
                   "second": {
                       "enabled": false,
                       "step": null
                   },
                   "meridian": {
                       "enabled": null
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





           $(".js-range-slider").ionRangeSlider({
               skin: "round",
               grid: true,
               min: 0,
               max: 100,
               from: 21,
               max_postfix: "+",
               prefix: "Age: ",
               postfix: " years"
           });

       });
   </script>