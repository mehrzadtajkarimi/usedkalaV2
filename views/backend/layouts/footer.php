    </div>
    </div>
    </div>


    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
        <div class="p-3">

        </div>
    </aside>
    <!-- /.control-sidebar -->

    <!-- Main Footer -->
    <footer class="main-footer">
        <!-- To the right -->
        <div class="float-right d-none d-sm-inline">
        </div>
        <!-- Default to the left -->
    </footer>
    </div>
    <!-- ./wrapper -->

    <!-- REQUIRED SCRIPTS -->

    <!-- jQuery -->
    <script src="<?= asset_url() ?>panel/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="<?= asset_url() ?>panel/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="<?= asset_url() ?>panel/dist/js/adminlte.js"></script>

    <script src="<?= asset_url() ?>panel/plugins/jQuery-Toast-Message-Plugin/build/toastr.min.js"></script>

    <script src="<?= asset_url() ?>panel/plugins/chart.js/Chart.js"></script>
    <script src="<?= asset_url() ?>panel/dist/js/demo.js"></script>
    <script src="<?= asset_url() ?>panel/dist/js/pages/dashboard3.js"></script>
    <script src="<?= asset_url() ?>panel/plugins/select2/select2.full.js"></script>
    <script src="<?= asset_url() ?>panel/plugins/jQuery-Toast-Message-Plugin/build/toastr.min.js"></script>

    <script src="<?= asset_url() ?>panel/plugins/font-awesome/js/all.js"></script>



    <script src="<?= asset_url() ?>js/admin.js"></script>
    <script src="<?= asset_url() ?>panel/plugins/datepicker/persian-date.min.js"></script>
    <script src="<?= asset_url() ?>panel/plugins/datepicker/persian-datepicker.min.js"></script>

    <script src="<?= asset_url() ?>panel/plugins/iCheck/icheck.js"></script>
    @yield('script')
    <script>
        $(document).ready(function() {
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "newestOnTop": false,
                "progressBar": true,
                "positionClass": "toast-top-left",
                "preventDuplicates": false,
                "onclick": null,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "30000",
                "extendedTimeOut": "30000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            }
            // @if($errors -> any())
            // @foreach($errors -> all() as $error)
            // var error = '{{ $error }}';
            // toastr["error"](error);
            // @endforeach
            // @endif

            // @foreach(['success', 'error', 'info', 'warning'] as $msgType)
            // @if(session() -> has($msgType))
            // var msgType = '{{ $msgType }}';
            // var msgText = '{{ session($msgType) }}';
            // toastr[msgType](msgText);
            // @endif
            // @endforeach
        });
        $(document).ready(function() {
            $('input').iCheck({
                checkboxClass: 'icheckbox_flat-blue',
                radioClass: 'iradio_flat-blue'
            });
        });
    </script>
    <button class='invisible btn-loading-black'></button>
    <button class='invisible btn-loading-white'></button>

    </body>

    </html>