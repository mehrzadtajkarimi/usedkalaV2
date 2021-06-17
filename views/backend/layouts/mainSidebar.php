   <!-- Main Sidebar Container -->
   <aside class="main-sidebar sidebar-dark-primary elevation-4">

       <!-- Brand Logo -->
       <a href="/admin" class="brand-link">
           <span class="brand-text font-weight-light"> shop</span>
       </a>

       <!-- Sidebar -->
       <div class="sidebar">
           <div>
               <!-- Sidebar user panel (optional) -->
               <div class="pb-3 mt-3 mb-3 user-panel d-flex">
                   <div class="image">
                       <img src="<?= asset_url() ?>panel/dist/img/user.png" class="img-circle " alt="User Image">
                   </div>
                   <div class="info">
                       <a href="#" class="d-block"> مهرزاد</a>
                   </div>
               </div>

               <!-- Sidebar Menu -->
               <nav class="mt-2">
                   <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">




                       <li class="nav-item has-treeview @yield('sidebar-users')">
                           <a href="#" class="nav-link @yield('sidebar-users')">
                               <i class="nav-icon fa fa-users"></i>
                               <p>
                                   کاربران
                                   <i class="right fa fa-angle-left"></i>
                               </p>
                           </a>
                           <ul class="nav nav-treeview">
                               <li class="nav-item">
                                   <a href="{{ route('user.index') }}" class="nav-link @yield('sidebar-user')">
                                       <i class="ml-2 far fa-circle nav-icon"></i>
                                       <p>لیست کاربران</p>
                                   </a>
                               </li>
                           </ul>
                       </li>






                       <!-- <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fa fa-th"></i>
                            <p>
                                لینک ساده
                                <span class="right badge badge-danger">جدید</span>
                            </p>
                        </a>
                    </li> -->





                   </ul>
               </nav>
               <!-- /.sidebar-menu -->
           </div>
       </div>
       <!-- /.sidebar -->
   </aside>