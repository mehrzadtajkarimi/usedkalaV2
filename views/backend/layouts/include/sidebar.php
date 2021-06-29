          <!-- Sidebar user panel (optional) -->
          <div class="user-panel mt-3 pb-3 mb-3 d-flex">
              <a href="<?= base_url() ?>admin/profile" class="image">
                  <img src="<?= asset_url() ?>backend/dist/img/user.png" class="img-circle elevation-2" alt="User Image">
                  <span class="">مهرزاد</span>
              </a>
              <div class="info">
                  <a href="<?= base_url() ?>admin/logout" class="position-absolute " style="right: 195px">
                      <i class="fa fa-sign-out p-1"></i>
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
                          <p>
                              کاربران
                              <i class="right fa fa-angle-left"></i>
                          </p>
                          <i class="nav-icon fa fa-dashboard"></i>
                      </a>
                      <ul class="nav nav-treeview">
                          <li class="nav-item">
                              <a href="<?= base_url() ?>admin/users" class="nav-link">
                                  <p>لیست کاربران</p>
                                  <i class="fa fa-circle-o nav-icon"></i>
                              </a>
                          </li>
                      </ul>
                  </li>
                  <li class="nav-item has-treeview">
                      <a href="#" class="nav-link">
                          <p>
                              دسته بندی ها
                              <i class="right fa fa-angle-left"></i>
                          </p>
                          <i class="nav-icon fa fa-book"></i>
                      </a>
                      <ul class="nav nav-treeview">
                          <li class="nav-item">
                              <a href="<?= base_url() ?>admin/category" class="nav-link">
                                  <p>لیست دسته بندی ها</p>
                                  <i class="fa fa-circle-o nav-icon"></i>
                              </a>
                          </li>
                      </ul>
                  </li>
              </ul>
          </nav>
          <!-- /.sidebar-menu -->