<div id="secondary" class="sidebar-blog widget-area" role="complementary">
	<div class="widget widget_text" id="text-2">
		<span class="gamma widget-title">درباره بلاگ یوزدکالا</span>
		<div class="textwidget">
			<p>جدیدترین اخبار و مقالاتِ صنعتِ فناوریِ اطلاعات و شبکه های کامپیوتری را در وبلاگِ یوزدکالا بخوانید.</p>
		</div>
		<!-- .textwidget -->
	</div>
	<!-- .widget_text -->
	
	<?php if($categories): ?>
		<div class="widget widget_categories " id="categories-2">
			<span class="gamma widget-title">دسته بندی ها</span>
			<ul>
				<?php foreach ($categories as $value): ?>
					<li><a href="<?= base_url() ?>blog/category/<?= $value['slug'] ?>"><?= $value['name'] ?></a></li>
				<?php endforeach; ?>
			</ul>
		</div>
	<?php endif; ?>
</div>