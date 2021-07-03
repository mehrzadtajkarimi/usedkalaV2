<ul class="list-group">
    <?php foreach ($children as  $value) : ?>
        <li class="list-group-item">
            <div class="d-flex">
                <span class="p-1"> <?= $value['name'] ?> </span>
                <a href="<?= base_url() ?>admin/category/delete"><span class="p-1 m-1 shadow-sm badge badge-danger"> حذف</span></a>
                <a href="<?= base_url() ?>admin/category/edit"><span class="p-1 m-1 shadow-sm badge badge-success"> ویرایش</span></a>
                <a href="<?= base_url() ?>admin/category/create"><span class="p-1 m-1 shadow-sm badge badge-warning"> ایجاد زیر دسته</span></a>
            </div>
            <?php
            include_data(base_url().'views/backend/category/group.php',$value['id']);

            ?>

        </li>
    <?php endforeach; ?>
</ul>