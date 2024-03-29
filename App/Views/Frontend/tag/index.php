<?php if(!is_null($tags)): ?>
    <div class="card border-0  p-3 ">
        <div class="card-body">
            <p class="card-text"><?= $tags['tags'] ??''?></p>
        </div>
    </div>
<?php endif; ?>
<div id="content" class="site-content" tabindex="-1">
    <div class="col-full">
        <div class="row">
            <!-- <nav class="woocommerce-breadcrumb">
                <a href="home-v1.html">Home</a>
                <span class="delimiter">
                    <i class="tm tm-breadcrumbs-arrow-right"></i>
                </span>Computers &amp; Laptops
            </nav> -->
            <!-- .woocommerce-breadcrumb -->
            <div id="primary" class="content-area">
                <main id="main" class="site-main">
                    <section class="section-product-categories">
                        <header class="section-header">
                            <h1 class="woocommerce-products-header__title page-title"><?= $tags['H1']??'' ?></h1>
                        </header>
                        <div class="woocommerce columns-5">
                            <div class="product-loop-categories">
                                <?php foreach ($tags as $value) : ?>
                                    <div class="product-category product ">
                                        <!-- change  id categories rename categories_id -->
                                        <a href="<?= base_url() . lcfirst($value['entity_type']) ?>/<?= $value['id'] ?>/<?= $value['slug'] ?>">
                                            <img src="<?= $value['path'] ?>" alt="Ultrabooks" width="224" height="197">
                                            <h2 class="woocommerce-loop-category__title">
                                                <?= $value['title'] ?>
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