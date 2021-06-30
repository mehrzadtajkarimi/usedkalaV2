<ul class="list-group">
    <?php foreach ($children as $value) : ?>
        <li class="list-group-item">
            <div class="d-flex">
                <span class="p-1"> <?= $value['name'] ?> </span>
                <a href="<?= base_url() ?>admin/category/delete"><span class="badge badge-danger shadow-sm m-1 p-1"> حذف</span></a>
                <a href="<?= base_url() ?>admin/category/edit"><span class="badge badge-success shadow-sm m-1 p-1"> ویرایش</span></a>
                <a href="<?= base_url() ?>admin/category/create"><span class="badge badge-warning shadow-sm m-1 p-1"> ایجاد زیر دسته</span></a>
            </div>
            <?php


echo '<pre>';
var_dump($value);

// if ($value['name'][0]) {
//     var_dump($value['name']);
// }
            ?>
        </li>
    <?php endforeach; ?>
</ul>