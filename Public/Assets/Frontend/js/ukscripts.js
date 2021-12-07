/* function msgbox(msgtext,dir)
{
	if (dir=="ltr") {document.getElementById('msgboxnote').style.direction='ltr'; document.getElementById('msgboxnote').style.textAlign='left';}
	document.getElementById('msgboxnote').innerHTML=msgtext;
	document.getElementById('msgbox').style.display='block';
	document.getElementById('msgboxbutton').focus();
}
function replaceAll(str)
{
	str=str.toString();
	str=str.replace(/0/g,"۰");
	str=str.replace(/1/g,"۱");
	str=str.replace(/2/g,"۲");
	str=str.replace(/3/g,"۳");
	str=str.replace(/4/g,"۴");
	str=str.replace(/5/g,"۵");
	str=str.replace(/6/g,"۶");
	str=str.replace(/7/g,"۷");
	str=str.replace(/8/g,"۸");
	str=str.replace(/9/g,"۹");
	
	return str;
} */

slides={
	1:{
		"title":"",
		"desc":"",
		"link":""
	},
	2:{
		"title":"",
		"desc":"",
		"link":""
	},
	3:{
		"title":"",
		"desc":"",
		"link":""
	}
};
changing=0;
var slide=1;
function changeslide(id)
{
	if (slide!=id && changing==0)
	{
		changing=1;
		step=0;
		// slideintvalstep();
		$("#slide_btn"+slide).removeClass("active");
		slide=id;
		$(".usedkalaslide .content").addClass("hide");
		$("#slide_btn"+id).addClass("active");
		setTimeout(function(){
			$(".usedkalaslide .scrollthis").animate({right: ((id-1)*(-100))+"%"},1000,function(){
				$(".usedkalaslide .title").html(slides[id].title);
				$(".usedkalaslide .desc").html(slides[id].desc);
				if (slides[id].title!="" || slides[id].desc!="")
					$(".usedkalaslide .content").removeClass("hide");
				changing=0;
			});
		},300);
	}
}
var slideCount=3;
function nextslide()
{
	if (slide<slideCount) changeslide(slide+1);
	else changeslide(1);
}
function prevslide()
{
	if (slide>1) changeslide(slide-1);
	else changeslide(slideCount);
}

step=0;
function slideintvalstep()
{
	step+=0.2;
	if (step>=100) 
		nextslide();
	$(".usedkalaslide .progress").css("width",step+"%");
	// step2=1+((100-step)/500);
	// if (step2<1) step2=1;
	// $("#slide"+slide).css("transform","scale("+step2+")");
}








var clicked=0;
var clickedX, clickedY, clickedTop, globx, globy;
function mover(event)
{
	globy=event.pageY;
	globx=event.pageX;
	if (clicked==3)
	{
		$(".usedkala_product_enlarge").show();
		$(".usedkala_product_enlarge div").css("background-image","url("+$($(".techmarket-wc-product-gallery__image.slick-current").children().children()[0]).attr("src")+")");		
		
		var difLeft=globx-$(".usedkala_product_enlarge").offset().left;
		var difLeftDomain=$(".usedkala_product_enlarge").width();
		var domain_x=$(".usedkala_product_enlarge div").width()-difLeftDomain;
		$(".usedkala_product_enlarge div").css("left",-(domain_x*difLeft/difLeftDomain));
		
		var difTop=globy-$(".usedkala_product_enlarge").offset().top;
		var difTopDomain=$(".usedkala_product_enlarge").height();
		var domain_y=$(".usedkala_product_enlarge div").height()-difTopDomain;
		$(".usedkala_product_enlarge div").css("top",-(domain_y*difTop/difTopDomain));
	}
	else
	{
		$(".usedkala_product_enlarge").hide();
	}
}
function toggle_responsive()
{
	var ratioHeight=$($(".techmarket-wc-product-gallery__image.slick-current").children().children()[0]).height();
	var ratioWidth=$($(".techmarket-wc-product-gallery__image.slick-current").children().children()[0]).width();
	$(".usedkala_product_enlarge").css("height",($(".usedkala_product_enlarge").width()*ratioHeight)/ratioWidth);
	$(".usedkala_product_enlarge div").css("width",$(".usedkala_product_enlarge").width()*2);
	$(".usedkala_product_enlarge div").css("height",($(".usedkala_product_enlarge div").width()*ratioHeight)/ratioWidth);
}
window.onresize=function(){toggle_responsive();};
toggle_responsive();
setInterval(toggle_responsive,1000);