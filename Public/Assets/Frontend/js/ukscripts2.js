function toggle_responsive()
{
	$(".products .product img").css("height",$(".products .product img").width());
	$(".product-loop-categories .product-category a img").css("height",$(".product-loop-categories .product-category a img").width());
}
window.onresize=function(){toggle_responsive();};
toggle_responsive();
setInterval(toggle_responsive,1000);