<div id="content" class="site-content" tabindex="-1">
    <div class="col-full">
        <div class="row">
            <nav class="woocommerce-breadcrumb">
                <?php foreach ($breadcrumb as $key => $value) : ?>
                    <?php if (count($breadcrumb) - 1 != $key) : ?>
                        <a href="<?= base_url() ?>category/<?= $value['slug'] ?>"><?= $value['name'] ?></a>
                        <span class="delimiter">
                            <i class="fa fa-chevron-left" aria-hidden="true"></i>
                        </span>
                    <?php else : ?>
                        <span><?= $value['name'] ?></span>
                    <?php endif; ?>
                <?php endforeach; ?>
            </nav>
            <!-- .woocommerce-breadcrumb -->
            <div id="primary" class="content-area">
                <main id="main" class="site-main">
                    <section class="section-product-categories">
                        <header class="section-header">
                            <h1 class="woocommerce-products-header__title page-title"><?= $description['H1'] ?? $description['title'] ?></h1>
                        </header>
                        <div class="woocommerce columns-5">
                            <div class="product-loop-categories">
                                <?php foreach ($categories as $value) : ?>
                                    <div class="product-category product ">
                                        <!-- change  id categories rename categories_id -->
                                        <a href="<?= base_url() ?>category/<?= $value['slug'] ?>">
                                            <?php if ($value['path'] != "") : ?>
                                                <img src="<?= $value['path'] ?>" alt="<?= $value['alt'] ?>" class="uksquareimg" width="224" height="197">
                                            <?php endif; ?>
                                            <h2 class="woocommerce-loop-category__title">
                                                <?= $value['name'] ?>
                                                <mark class="count"></mark>
                                            </h2>
                                        </a>
                                    </div>
                                <?php endforeach; ?>
                            </div>
                            <!-- .product-loop-categories -->
                        </div>
                        <!-- .woocommerce -->
                    </section>
                </main>
                <!-- #main -->
            </div>
            <!-- #primary -->
        </div>
        <!-- .row -->
    </div>
    <!-- .col-full -->
</div>
<?php include BASEPATH  . 'App/Views/Frontend/product/index.php' ?>
<?php if (!is_null($description['description'])) : ?>
    <div class="card border-0  p-3 ">
        <div class="card-body">
            <div class="card-text"><?= $description['description'] ?></div>
        </div>
    </div>
<?php endif; ?>