<table class="table table-striped">
    <thead>
        <tr>
            <th>شماره</th>
            <th>نام محصول</th>
            <th>قیمت</th>
            <th>تعداد</th>
            <th>جمع فروش</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($report as $value) : ?>
            <tr>
                <td><?= $value['product_id'] ?></td>
                <td><?= $value['product_name'] ?></td>
                <td><?= number_format($value['product_price']) ?></td>
                <td><?= number_format($value['quantity_total']) ?></td>
                <td><?= number_format($value['grand_total']) ?></td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>