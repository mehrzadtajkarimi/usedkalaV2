function msgbox(msgtext,dir)
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
}
function acc_signup()
{
	var first_name=document.getElementById('signup_first_name').value;
	var last_name=document.getElementById('signup_last_name').value;
	var company=document.getElementById('signup_company').value;
	var mail=document.getElementById('signup_mail').value;
	var tell=document.getElementById('signup_cell').value;
	var pass=document.getElementById('signup_pass1').value;
	var pass2=document.getElementById('signup_pass2').value;
	
	var rules=1;
	
	msgbox('در حال ارسال اطلاعات، لطفا شکیبا باشید...');
	
	var dacon=new XMLHttpRequest();
	dacon.onreadystatechange=function()
	{
		if (dacon.readyState==4 && dacon.status==200)
		{
			if (dacon.responseText!="1") msgbox(dacon.responseText);
			else document.location=rootPath+"account/verify";
		}
	}
	dacon.open("POST",rootPath+"acc_signup.php",true);
	dacon.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	dacon.send("tell="+tell + "&first_name="+first_name + "&last_name="+last_name + "&company="+company + "&mail="+mail + "&pass="+pass + "&pass2="+pass2 + "&rules="+rules);
}
function acc_forgot()
{
	msgbox('در حال ارسال اطلاعات، لطفا شکیبا باشید...');
	var daEmail=$("#forgotinput").val();
	var dacon=new XMLHttpRequest();
	dacon.onreadystatechange=function()
	{
		if (dacon.readyState==4 && dacon.status==200)
		{
			if (dacon.responseText!="1") msgbox(dacon.responseText);
			else document.location=rootPath+"account/verify";
		}
	}
	dacon.open("GET",rootPath+"acc_resetpass.php?m="+daEmail,true);
	dacon.send();
}
function acc_newpass()
{
	document.location=rootPath+"account/newpass/"+$("#accountVerifyEmail").val()+"/"+$("#accountVerifyInput").val();
}
var vfcd, resetpassmail;
function acc_resetpass()
{
	msgbox('در حال ارسال اطلاعات، لطفا شکیبا باشید...');
	var pass1=$("#newpass_pass1").val();
	var pass2=$("#newpass_pass2").val();
	var dacon=new XMLHttpRequest();
	dacon.onreadystatechange=function()
	{
		if (dacon.readyState==4 && dacon.status==200)
		{
			msgbox(dacon.responseText);
		}
	}
	dacon.open("POST",rootPath+"acc_resetpass_do.php",true);
	dacon.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	dacon.send("m="+resetpassmail+"&vfcd="+vfcd+"&pass1="+pass1+"&pass2="+pass2);
}
function acc_signin()
{
	msgbox('در حال ارسال اطلاعات، لطفا شکیبا باشید...');
	var user=$("#signin_user").val();
	var pass=$("#signin_pass").val();
	if ($("#signin_remember")[0].checked) var remember=1;
	else var remember=0;
	
	var dacon=new XMLHttpRequest();
	dacon.onreadystatechange=function()
	{
		if (dacon.readyState==4 && dacon.status==200)
		{
			if (dacon.responseText!="1") msgbox(dacon.responseText);
			else document.location=rootPath+"account";
		}
	}
	dacon.open("POST",rootPath+"acc_signin.php",true);
	dacon.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	dacon.send("username="+user+"&pass="+pass+"&rememberme="+remember);
}

function add_to_cart(id)
{
	msgbox('در حال ارسال اطلاعات، لطفاً شکیبا باشید...');
	$.ajax({
		method: "POST",
		url: rootPath+"add_to_cart.php",
		data: {
			"id": id
		}
	})
	.done(function( msg ) {
		msgbox('افزودن به سبد خرید با موفقیت انجام شد.');
	});
}
function checkout_province_change(id)
{
	$("#billing_state").val(0);
	$("#checkout_city_label").text("در حال بارگزاری...");
	$.ajax({
		method: "POST",
		url: rootPath+"checkout_province_change.php",
		data: {
			"id": id
		}
	})
	.done(function( msg ) {
		$("#billing_state").html(msg);
	});
}