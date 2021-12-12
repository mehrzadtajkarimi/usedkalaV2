<div class="col-full">
	<div class="row">
		<nav class="woocommerce-breadcrumb">
			<a href="<?= base_url() ?>">خانه</a>
			<span class="delimiter">
				<i class="fa fa-arrow-left"></i>
			</span>
			وبلاگ
		</nav>
		
		<div id="primary" class="content-area">
			<main id="main" class="site-main">
				<?php foreach ($blogs as $value) : ?>
				<article class="post format-image hentry">
					<div class="media-attachment">
						<div class="post-thumbnail">
							<a href="<?= base_url() ?>blog/<?= $value['slug'] ?>">
								<img alt="" class="wp-post-image" src="<?= $value['path'] ?>">
							</a>
						</div>
					</div>
					<!-- .media-attachment -->
					<div class="content-body">
						<header class="entry-header">
							<h1 class="entry-title">
								<a rel="bookmark" href="<?= base_url() ?>blog/<?= $value['slug'] ?>"><?= $value['title'] ?></a>
							</h1>
							<!-- .entry-title -->
							<div class="entry-meta">
								<?php /* <span class="cat-links">
									<a href="blog-single.html" rel="category tag">اخبار HPE</a>
								</span> */ ?>
								<span class="posted-on">
									<a href="<?= base_url() ?>blog/<?= $value['slug'] ?>" rel="bookmark">
										<time datetime="<?= $value['created_at'] ?>" class="entry-date published"><?= $value['jDate'] ?></time>
										<?php // <time datetime="2017-06-22T10:40:23+00:00" class="updated">24 آذر 1398</time> ?>
									</a>
								</span>
								<?php /* <span class="author">
									<a title="Posts by Jane Smith" href="#" rel="author">فاطمه محمدی</a>
								</span> */ ?>
							</div>
							<!-- .entry-meta -->
						</header>
						<!-- .entry-header -->
						<div class="entry-content">
							<p><?= $value['meta_title'] ?></p>
						</div>
						<!-- .post-excerpt -->
						<div class="post-readmore">
							<a class="btn btn-primary" href="<?= base_url() ?>blog/<?= $value['slug'] ?>">ادامه مطلب</a>
						</div>
						<!-- .comments-link -->
					</div>
				</article>
				<?php endforeach; ?>
			</main>
			<!-- #main -->
		</div>
		
		<?php include_once BASEPATH."App/Views/Frontend/blog/sidebar.php" ?>
		
	</div>
</div>
