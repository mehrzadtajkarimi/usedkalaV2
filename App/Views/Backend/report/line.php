<table class="table table-striped">
    <thead>
        <tr>
            <th>تعداد</th>
            <th>نام کاربر</th>
            <th>توضیحات</th>
            <th>آدرس</th>
            <th>جمع تخفیف</th>
            <th>جمع پرداختی</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($report as $value) : ?>
            <tr>
                <td>۱</td>
                <td><?= $value['user_full_name'] ?></td>
                <td><?= $value['note'] ?? '---' ?></td>
                <td><?= $value['address'] ?> </td>
                <td><?= number_format($value['discount_total'] ?? 0) ?> </td>
                <td><?= number_format($value['grand_total']) ?> </td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>