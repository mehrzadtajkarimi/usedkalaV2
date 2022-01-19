<div class="col-full">
	<div class="row">
		<?php /*
		<nav class="woocommerce-breadcrumb">
			<a href="<?= $GLOBALS['rootPath'] ?>">خانه</a>
			<span class="delimiter">
				<i class="fa fa-arrow-left"></i>
			</span>
			<a href="<?= $GLOBALS['rootPath'] ?>blog">بلاگ</a>
			<span class="delimiter">
				<i class="fa fa-arrow-left"></i>
			</span><?= $Row['field0'] ?>
		</nav> */ ?>
		<div id="primary" class="content-area">
			<main id="main" class="site-main">
				<article class="post format-image">
					<header class="entry-header">
						<h1 class="entry-title"><?= $setting['value'] ?></h1>
					</header>
					<!-- .entry-header -->
					<div class="entry-content" itemprop="articleBody"><?= $setting['description'] ?></div>
					<!-- .entry-content -->
				</article>
				<!-- .post -->
				
			</main>
			<!-- #main -->
		</div>
	</div>
</div>