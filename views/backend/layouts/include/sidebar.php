          <!-- Sidebar user panel (optional) -->
          <div class="user-panel mt-3 pb-3 mb-3 d-flex">
              <div class="image">
                  <img src="<?= asset_url() ?>backend/dist/img/user.png" class="img-circle elevation-2" alt="User Image">
              </div>
              <div class="info">
                  <a href="<?= base_url() ?>admin/profile" class="">مهرزاد</a>
                  <a href="<?= base_url() ?>admin/logout" class="left" >
                      <i class="fa fa-sign-out"></i>
                  </a>
              </div>
          </div>

          <!-- Sidebar Menu -->
          <nav class="mt-2">
              <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                  <!-- Add icons to the links using the .nav-icon class
                 with font-awesome or any other icon font library -->
                  <li class="nav-item has-treeview">
                      <a href="#" class="nav-link">
                          <i class="nav-icon fa fa-dashboard"></i>
                          <p>
                              کاربران
                              <i class="right fa fa-angle-left"></i>
                          </p>
                      </a>
                      <ul class="nav nav-treeview">
                          <li class="nav-item">
                              <a href="<?= base_url() ?>admin/users" class="nav-link">
                                  <i class="fa fa-circle-o nav-icon"></i>
                                  <p>لیست کاربران</p>
                              </a>
                          </li>
                      </ul>
                  </li>

              </ul>
          </nav>
          <!-- /.sidebar-menu -->