<div id="primary" class="content-area">
    <main id="main" class="site-main">
        <article class="post format-image">
            <div class="media-attachment">
                <div class="post-thumbnail">
                    <img alt="" class="wp-post-image img-thumbnail img-fluid" src="<?= $blog['path'] ?>">
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
                <?php foreach ($tags as $value) : ?>
                    <div class="ml-4 mb-2">
                        <small>
                            <a href="#">#<?= $value['tag'] ?></a>
                        </small>
                    </div>
                <?php endforeach; ?>
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
<div class="container-fluid">
    <hr>
    <div id="myForm" class="alert alert-success alert-dismissible  mr-5 ml-5  d-none" data-wow-duration="2s" data-wow-offset="10" role="alert">
        <strong>" کامنت با موفقیت ارسال شد بعد از تایید مدیر نمایش داده می شود"</strong>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <?php if ($comments) : ?>
        <h5 class="card-title m-3">نظرات :</h5>
        <?php foreach ($comments as $value) : ?>
            <div class="ml-4 mb-5">
                <div class="card">
                    <div class="card-body p-3">
                        <h5 class="card-title"><?= $value['title'] ?> </h5>
                        <p class="card-text"><?= $value['message'] ?></p>
                    </div>
                    <small class=" pl-5 text-muted">

                        <?php if(!empty($value['reply'])): ?>
                            <p>نمایش پاسخ :</p>
                            <div class="">
                                <h5 class=""><?= $value['reply']['title'] ?> </h5>
                                <p class="pl-3"><?= $value['reply']['message'] ?></p>
                            </div>
                        <?php endif; ?>
                    </small>

                </div>
                <small>آیا این دیدگاه برایتان مفید بود؟</small>

                <span class="m-2 pointer dislike text-muted " >
                    <small class="count"><?= $value['dislikes'] ?></small>
                    <i class="dislike_btn fa fa-thumbs-down fa-1x " data-id="<?= $value['id'] ?>" data-type="Comment" data-auth="<?= $auth ?: FALSE ?>" data" title="کلیک کنید تا وضعیت تغییر کند" ></i>
                </span>
                <span class="m-2 pointer  text-darkBrandController">
                    <small class="count"><?= $value['likes'] ?></small>
                    <i class="like_btn fa fa-thumbs-up  fa-1x " data-id="<?= $value['id'] ?>" data-type="Comment" data-auth="<?= $auth ?: FALSE ?>" title="کلیک کنید تا وضعیت تغییر کند"></i>
                </span>
                </span>

            </div>
        <?php endforeach; ?>
        <form class="theForm" action="<?= base_url() ?>comment/<?= $blog['blog_id'] ?>/Blog" method="post">
        <input type="hidden" name="slug" value="<?= $blog['slug'] ?>">
        <div class="form-group mr-5 ml-5 mb-5">
            <label for="my-textarea">
                    <h5 class="card-title m-3"> ثبت نظر:</h5>
                </label>
                <input class="form-control mb-3" type="text" name="title" placeholder="موضوع متن خود را بنویسید" minlength="5" required>
                <textarea class="form-control" name="comment" rows="5" <?= is_null($auth) ? 'readonly  placeholder="برای درج نظر ابتدا با نام کاربری وارد شوید"' : '' ?>></textarea>
                <button class="btn btn-primary mt-3 ml-2" type="submit">ارسال</button>
            </div>
        </form>
        <?php else : ?>
            <form class="theForm" action="<?= base_url() ?>comment/<?= $blog['blog_id'] ?>/Blog" method="post">
                <input type="hidden" name="slug" value="<?= $blog['slug'] ?>">
            <div class="form-group mr-5 ml-5 mb-5">
                <label for="my-textarea">
                    <h5 class="card-title m-3">اولین نفری باشید که در مورد این مقاله نظر ثبت می کنید :</h5>
                </label>
                <input class="form-control mb-3" type="text" name="title" placeholder="موضوع متن خود را بنویسید" minlength="5" required>
                <textarea class="form-control" name="comment" rows="5"></textarea>
                <button class="btn btn-primary mt-3 ml-2" type="submit">ارسال</button>
            </div>
        </form>
    <?php endif; ?>

</div>
<?php include(BASEPATH . "/App/Views/Frontend/blog/script.php") ?>