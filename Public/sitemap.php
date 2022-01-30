<?php
Header('Content-type: text/xml');
$date=date("Y-m-d");
echo ('<?xml version="1.0" encoding="UTF-8"?>');
?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
	<url>
		<loc>https://usedkala.com</loc>
		<lastmod><?= $date ?></lastmod>
		<changefreq>daily</changefreq>
	</url>
	<url>
		<loc>https://usedkala.com/shop</loc>
		<lastmod><?= $date ?></lastmod>
		<changefreq>daily</changefreq>
	</url>
	<url>
		<loc>https://usedkala.com/blog</loc>
		<lastmod><?= $date ?></lastmod>
		<changefreq>daily</changefreq>
	</url>
	<url>
		<loc>https://usedkala.com/contact</loc>
		<lastmod><?= $date ?></lastmod>
		<changefreq>weekly</changefreq>
	</url>
	<url>
		<loc>https://usedkala.com/product/discounts</loc>
		<lastmod><?= $date ?></lastmod>
		<changefreq>monthly</changefreq>
	</url>
<?php
include "connectioni.php";
$query=mysqli_query($CON,"SELECT * FROM `categories`");
while ($row=mysqli_fetch_array($query))
{
	if ($row['type']==0) $prefix="category/";
	else if ($row['type']==1) $prefix="blog/category/";
	echo ('
	<url>
		<loc>https://usedkala.com/'.$prefix.$row['slug'].'</loc>
		<lastmod>'.$date.'</lastmod>
		<changefreq>daily</changefreq>
	</url>');
}
$query=mysqli_query($CON,"SELECT * FROM `products` ORDER BY `id` DESC");
while ($row=mysqli_fetch_array($query))
{
	echo ('
	<url>
		<loc>https://usedkala.com/product/'.$row['slug'].'</loc>
		<lastmod>'.$date.'</lastmod>
		<changefreq>weekly</changefreq>
	</url>');
}
$query=mysqli_query($CON,"SELECT * FROM `blogs` ORDER BY `id` DESC");
while ($row=mysqli_fetch_array($query))
{
	echo ('
	<url>
		<loc>https://usedkala.com/blog/'.$row['slug'].'</loc>
		<lastmod>'.$date.'</lastmod>
		<changefreq>daily</changefreq>
	</url>');
}
mysqli_close($CON);
?>
</urlset>