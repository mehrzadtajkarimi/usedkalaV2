<div class="card ">
  <div class="p-0 shadow-sm card-body">
    <div class="card-header">
      <div class="row">
        <div class="col-4">
          <h3 class="p-3 card-title">متای صفحات اصلی</h3>
        </div>
        <div class="offset-4"> </div>
        
    </div>
  </div>
  <div class="p-0 card-body table-responsive">
    <div class="card ">
      <div class="card-body">
        <table class="table table--vertical_middle ">
          <thead>
            <tr>
              <th class="text-center" scope="col">نام</th>
              <th class="text-center" scope="col">اقدامات</th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($pagemetas as $value) : ?>
              <tr>
                <td class="text-center"><?= $value['title'] ?></td>
                <td class="text-center">
                  <a href="<?= base_url() ?>admin/pagemetas/<?= $value['id'] ?>/edit" type="button" class="shadow-sm btn btn-success btn-sm " style="padding: 0px 20px; border-radius: 18px;">
                    ویرایش متا
                  </a>
                </td>
              </tr>
            <?php endforeach; ?>

          </tbody>
        </table>
      </div>
    </div>
  </div>
  <nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">
      <li class="page-item <?php if (pagination_count('settings', 10) + 1 == 1 || (isset($_GET['page']) && $_GET['page'] == 1) || !isset($_GET['page'])) echo "disabled" ?>">
        <a class="page-link" href="<?= base_url() ?>admin/pagemetas?page=<?php if (isset($_GET['page']) && $_GET['page'] > 1) echo $_GET['page'] - 1; ?> " aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
          <span class="sr-only">Previous</span>
        </a>
      </li>
      <?php for ($i = 0; $i <=  pagination_count('settings', 10); $i++) : ?>
        <li class="page-item <?php if (isset($_GET['page']) && $_GET['page'] == ($i + 1)) echo "active"; else if (!isset($_GET['page']) && ($i + 1) == 1) echo "active" ?>">
          <a class="page-link" href="<?= base_url() ?>admin/pagemetas?page=<?= $i + 1 ?>"><?= $i + 1 ?></a>
        </li>
      <?php endfor; ?>
      <li class="page-item <?php if (pagination_count('settings', 10) + 1 == 1 || (isset($_GET['page']) &&  pagination_count('settings', 10) + 1  == $_GET['page'])) echo "disabled" ?>">
        <a class="page-link" href="<?= base_url() ?>admin/pagemetas?page=<?php if (isset($_GET['page'])) echo $_GET['page'] + 1; else echo 2 ?>" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
          <span class="sr-only">Next</span>
        </a>
      </li>
    </ul>
  </nav>
</div>
</div>

<?php
include_once BASEPATH  . 'App/Views/Backend/layouts/include/ckeditor.php';
?>