<!DOCTYPE html>
<html>

<head>

  <?php include_once BASEPATH  . 'views/backend/layouts/include/head.php' ?>

</head>

<body class="hold-transition sidebar-mini">
  <div class="wrapper">
    <nav class="main-header navbar navbar-expand bg-white navbar-light border-bottom">

      <?php include_once BASEPATH  . 'views/backend/layouts/include/nav.php' ?>

    </nav>
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
      <a href="<?= base_url() ?>admin" class="brand-link">
        <img src="<?= asset_url() ?>backend/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">پنل مدیریت</span>
      </a>
      <div class="sidebar">
        <?php include_once BASEPATH  . 'views/backend/layouts/include/sidebar.php' ?>
      </div>
    </aside>

    <div class="content-wrapper">
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <?php include_once BASEPATH  . 'views/backend/layouts/include/breadcrumb.php' ?>
          </div>
        </div>
      </section>
      <section class="content">

        <?= $view ?>

      </section>
    </div>
    <?php include_once BASEPATH  . 'views/backend/layouts/include/footer.php' ?>
</body>

</html>