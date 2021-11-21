<div id="content" class="site-content">
    <div class="col-full">
        <div class="row">
            <nav class="woocommerce-breadcrumb">
                <a href="https://usedkala.com/">خانه</a>
                <span class="delimiter">
                    <i class="fa fa-arrow-left"></i>
                </span>
                وبلاگ
            </nav>
        </div>
        <div class="row">
            <div class="col-3">
                <div class="widget widget_text" id="text-2">
                    <span class="gamma widget-title">درباره بلاگ یوزدکالا</span>
                    <div class="textwidget">
                        <p>لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.</p>
                    </div>
                    <!-- .textwidget -->
                </div>
                <!-- .widget_text -->
                <hr>
                <?php if($categories): ?>
                    <div class="widget widget_categories " id="categories-2">
                        <span class="gamma widget-title">دسته بندی ها</span>
                        <ul>
                            <?php foreach ($categories as $value): ?>
                                <li><a href="<?= base_url() ?>blog/category/<?= $value['id'] ?>/<?= $value['slug'] ?>"><?= $value['name'] ?></a></li>
                            <?php endforeach; ?>
                        </ul>
                    </div>
                <?php endif; ?>
            </div>
            <div class="col-9">
                <main id="main" class="site-main">
                    <?php foreach ($blogs as $value) : ?>
                        <div class=" m-5 p-5 card shadow">
                            <div class="card-body">
                                <article class="post format-image hentry">
                                    <div class="media-attachment">
                                        <div class="post-thumbnail">
                                            <a href="https://usedkala.com/blog/test-news">
                                                <img alt="" class="wp-post-image" src="<?= $value['path'] ?>">
                                            </a>
                                        </div>
                                    </div>
                                    <!-- .media-attachment -->
                                    <div class="content-body">
                                        <header class="entry-header">
                                            <h1 class="entry-title">
                                                <a rel="bookmark" href="https://usedkala.com/blog/test-news"><?= $value['title'] ?></a>
                                            </h1>
                                            <!-- .entry-title -->
                                            <div class="entry-meta">
                                                <span class="cat-links">
                                                    <a href="blog-single.html" rel="category tag">اخبار HPE</a>
                                                </span>
                                                <span class="posted-on">
                                                    <a href="blog-single.html" rel="bookmark">
                                                        <time datetime="2017-03-23T08:06:09+00:00" class="entry-date published">23 آذر 1398</time>
                                                        <time datetime="2017-06-22T10:40:23+00:00" class="updated">24 آذر 1398</time>
                                                    </a>
                                                </span>
                                                <span class="author">
                                                    <a title="Posts by Jane Smith" href="#" rel="author">فاطمه محمدی</a>
                                                </span>
                                                </div-->
                                                <!-- .entry-meta -->
                                        </header>
                                        <!-- .entry-header -->
                                        <!-- <div class="entry-content">
                                            <p><?= $value['value'] ?></p>
                                        </div> -->
                                        <!-- .post-excerpt -->
                                        <div class="post-readmore">
                                            <a class="btn btn-primary" href="/blog/<?= $value['blog_id'] ?>/<?= $value['slug'] ?>">ادامه مطلب</a>
                                        </div>
                                        <!-- .comments-link -->
                                    </div>
                                </article>
                            </div>
                        </div>
                    <?php endforeach; ?>
                </main>
                <!-- #main -->
            </div>
        </div>
    </div>
</div>