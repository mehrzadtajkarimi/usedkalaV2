<ul class="list-group">
    <li class="list-group-item">
        <div class="d-flex">
            <span class="p-1"> سرور </span>
            <a href="<?= base_url() ?>admin/category/delete"><span class="badge badge-danger shadow-sm m-1 p-1"> حذف</span></a>
            <a href="<?= base_url() ?>admin/category/edit"><span class="badge badge-success shadow-sm m-1 p-1"> ویرایش</span></a>
            <a href="<?= base_url() ?>admin/category/create"><span class="badge badge-warning shadow-sm m-1 p-1"> ایجاد زیر دسته</span></a>
        </div>
        <?php
        include BASEPATH . 'views/backend/category/group.php';
        ?>
    </li>
</ul>