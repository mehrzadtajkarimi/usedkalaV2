function toggle_responsive()
{
	// $(".products .product img.uksquareimg").css("height",$(".products .product img.uksquareimg").width());
	// $(".product-loop-categories .product-category a img.uksquareimg").css("height",$(".product-loop-categories .product-category a img.uksquareimg").width());
	$("img.uksquareimg").each(function(){
		$(this).css("height",$(this).width());
	})
}
window.onresize=function(){toggle_responsive();};
toggle_responsive();
setInterval(toggle_responsive,1000);