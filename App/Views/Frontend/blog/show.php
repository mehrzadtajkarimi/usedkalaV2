<div id="primary" class="content-area">
    <main id="main" class="site-main">
        <article class="post format-image">
            <div class="media-attachment">
                <div class="post-thumbnail">
                    <img alt="" class="wp-post-image img-thumbnail img-fluid" src="<?= $blog['path'] ?>" >
                </div>
            </div>
            <header class="entry-header">
                <h1 class="entry-title">
                <?= $blog['key'] ?>
                </h1>
                <!-- .entry-title -->
                <div class="entry-meta">
                    <span class="cat-links">
                        <a rel="category tag"></a>
                    </span>
                    <!-- .cat-links -->
                    <span class="posted-on">
                        <a rel="bookmark" href="#">
                            <time class="entry-date published">۷ امرداد ۱۳۹۹</time>
                        </a>
                    </span>
                    <!-- .posted-on -->
                    <!--span class="author">
									<a rel="author" title="نوشته شده توسط رضا جهانی" href="#">رضا جهانی</a>
								</span-->
                    <!-- .author -->
                </div>
                <!-- .entry-meta -->
            </header>
            <!-- .entry-header -->
            <div class="entry-content" itemprop="articleBody">
                <p><?= $blog['value'] ?></p>
            </div>
            <!-- .entry-content -->
        </article>
        <!-- .post -->
        <!-- .post-author-info -->
        <nav aria-label="سایر پست ها" class="navigation post-navigation" id="post-navigation">
            <span class="screen-reader-text">سایر پست ها</span>
            <div class="nav-links">
                <div class="nav-previous">
                    <a rel="prev" href="https://usedkala.com/blog/asdasd">
                        <span class="meta-nav"><i class="fa fa-arrow-right" aria-hidden="true"></i></span>
                        &nbsp;asdasd </a>
                </div>
                <!-- /.nav-previous -->
            </div>
            <!-- /.nav-links -->
        </nav>
        <!-- /.post-navigation -->

    </main>
    <!-- #main -->
</div>