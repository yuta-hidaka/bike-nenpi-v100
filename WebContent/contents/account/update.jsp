<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page  import="bikeNenpi.BEANS.Bean_UserInfo"%>
<! DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<%@ include file="../common/google.adsence.html"%>
<!--スマホで見やすいように準備します。↓-->
    <meta name="viewport" content="width=device-width , initial-scale=1">

    <title>バイク燃費.com-プロフィール更新-</title>
<!--    googleFontのWebFontをimport-->
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+JP" rel="stylesheet">

    <link rel = "stylesheet" href="../../css/layout2.css">

    <link rel = "stylesheet" href="../../css/headerBarCss.css">

<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-136344605-1"></script>
 <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<script src='//ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<link rel="stylesheet" href="/bikeNenpi/css/iziModal.min.css">
<link rel="stylesheet" href="/bikeNenpi/css/toastr.min.css">
<script async  src="https://www.googletagmanager.com/gtag/js?id=UA-136344605-1"></script>
<script src="/bikeNenpi/js/iziModal.min.js"></script>
<script src="/bikeNenpi/js/toastr.min.js"></script>

</head>

<script>
var firstMail= "";
var gError = "";
var prof;

$(document).ready(function() {
	var userId= $("#user_id").val();


		//リクエストJSON
	  var request = {
	    user_id : userId,
	    process_flg:2
	  };
	  account();

function account(){
	 $.ajax({
		    type    : "post",
		    url     : "/bikeNenpi/account",
		    data    : { jsonTodo: JSON.stringify(request) },
		    async   : true,
	  }).done(function(data) {
		  prof = data;
		  data.ubike1 = data.ubike1 || "";
		  data.ubike2 = data.ubike2 || "";
/* 		  $("#user_name").val(data.user_name); */

           firstMail = data.mail_add;
		  $("#mail").val(data.mail_add);
		  $("#password_i").val(data.password);
		  $("#ubike1").val(data.ubike1);
		  $("#ubike2").val(data.ubike2);
		  $(".name_class").val(data.user_name);

	  }).fail(function() {
	  }).always(function( jqXHR, textStatus ) {

	  });

}

	 $("#check").on("click",function(){
		 $.when().then(function(){
			 mailPass_c();

		 }).then(function(){


		 });
	 });

	 $("#back").on("click",function(){

		 $("#check_block").addClass("is-hide");
		 $("#input_block").removeClass("is-hide");

	 });

	 $("#regist").on("click",function(){

		 prof.process_flg = 3;

		 $.ajax({
			    type    : "post",
			    url     : "/bikeNenpi/account",
			    data    : { jsonTodo: JSON.stringify(prof) },
			    async   : true,
		  }).done(function(data) {

			  location.href='/bikeNenpi/contents/account/update_complete.jsp';
			  location.click();


		  }).fail(function() {
		  }).always(function( jqXHR, textStatus ) {

		  });
	 });


});











var gData = "";
$(document).ready(function() {


	$("#mail").on("input",function(){
		 $("#eMail").addClass("is-hide");
	});

	$("#in_name").on("input",function(){
		 $("#eName").addClass("is-hide");
	});

	$("#password_i").on("input",function(){
		var inPassword = $("#password_i").val();
		if(inPassword.match(/^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{8,100}$/) || inPassword.match(/^(?=.*?[a-z])(?=.*?\d)(?=.*?[!-\/:-@[-`{-~])[!-~]{8,100}$/i)){
			 $("#ePassword").addClass("ok");
			 $("#ePassword").html("OK");
		}else{
			$("#ePassword").removeClass("ok");
			 $("#ePassword").removeClass("is-hide");
			 $("#ePassword").html("<br>大文字を含む8文字以上の半角英数字を入力してください。");
		}

	});



$("#next").on("click",function(){

	mailPass_c();

});

});


function valSet(){
	 if(gError === 1){
		 return false;
	 }
		scrollTo(0, 300);
		 $("#check_block").removeClass("is-hide");
		 $("#input_block").addClass("is-hide");

		  var mail = $("#mail").val();
		  var password = $("#password_i").val();
		  var ubike1 = $("#ubike1").val();
		  var ubike2 = $("#ubike2").val();
		  var user_name = $(".name_class").val();

		   prof.mail_add = mail;
		   prof.password = password;
		   prof.ubike1 = ubike1;
	       prof.ubike2 =ubike2;
		  prof.user_name = user_name;

		  $("#c_mail").html(mail);
		  $("#c_password").html(password);
		  $("#c_ubike1").html(ubike1);
		  $("#c_ubike2").html(ubike2);
		  $("#c_user_name").html(user_name);
}


function mailPass_c(){
	var inMail = $("#mail").val();
	var inName = $("#user_name").val();
	var inPassword = $("#password_i").val();
	var text ="";
	var cnt = 0;
	gError = 0;

	if(inMail === "" || inMail === null ||inMail === undefined){
		 $("#eMail").removeClass("is-hide");
		 $("#eMail").html("<br>メールアドレスの入力をお願いします。");
	  cnt = 1;
	  gError = 1;
	}else{
		if(inMail.match(/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/)){


		var request = {
			    mail_add : inMail,
			    process_flg : 5
			  };

		  $.ajax({
			    type    : "post",
			    url     : "/bikeNenpi/account",
			    data    : { jsonTodo: JSON.stringify(request) },
			    async   : true,
		  }).done(function(data) {
			  console.log("ajax");


		  console.log(firstMail);
		  console.log(inMail);
			  if(firstMail === inMail){
				  data.errorCode = 0;
			  }

			  if(data.errorCode === 1){
				  cnt = 1;
				  gError = 1;
					 $("#eMail").removeClass("is-hide");
					 $("#eMail").html("<br>このメールアドレスは登録済みです。");
			  }else{

			  }


		  })
		  .fail(function() {

		  })
		  .always(function( jqXHR, textStatus ) {

			  if(inName === "" || inName === null ||inName === undefined){
					 $("#eName").removeClass("is-hide");
					 $("#eName").html("<br>ニックネームの入力をお願いします。");
					cnt = 1;
					gError = 1;
				}else{
					$("#ePassword").addClass("is-hide");
				}

				if(inPassword === "" || inPassword === null ||inPassword === undefined){
					 $("#ePassword").removeClass("is-hide");
					 $("#ePassword").html("<br>パスワードの入力をお願いします。");
					cnt = 1;
					gError = 1;
				}else{
					if(inPassword.match(/^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{8,100}$/) || inPassword.match(/^(?=.*?[a-z])(?=.*?\d)(?=.*?[!-\/:-@[-`{-~])[!-~]{8,100}$/i)){
						 $("#ePassword").addClass("ok");
						 $("#ePassword").html("OK");
					}else{

						 $("#ePassword").removeClass("is-hide");
						 $("#ePassword").html("<br>大文字を含む8文字以上の半角英数字を入力してください。");
						 cnt = 1;
						 gError = 1;
					}
				}
				if(cnt !== 0){

					gError = cnt;
					return false;
					}else{
						valSet();
						var s = document.getElementById('submit_bbt');
				s.click();
					}

			  });

		  }else{

				 $("#eMail").removeClass("is-hide");
				 $("#eMail").html("<br>メールアドレスの形式で入力をお願いします。");
				 gError = 1;
				 return false;
		  }
	}

		}

function submit_c(code) {
  	if(13 === code)
  	{
  		mailPass_c();
  	}
  }










</script>


<body><!--ページの中央部分-->
<!--ヘッダーのインクルード-->
<%@ include file="../common/header.jsp" %>


	<div class="space" id="input_block">
			<table class="input_table">

				<tr class="tr_table">
					<td class="title_table">
						<h2 class=PageTitle_login>-プロフィール更新-</h2>
					</td>
				</tr>
				<tr>
					<td class="input">
						<div class="input_name">
							<p class="l_text">変更箇所を書き換えてください。</p>
						</div>
					</td>
				</tr>
				<tr>
					<td class="input">
						<div class="input_name">
							<p class="l_text">ニックネーム<span id="eName" class="is-hide eMessage"></span></p>
							<input type="text" name="" class="input_text name_class" id="user_name" placeholder="ねんぴたろう" id="in_name" onkeypress="submit_c(event.keyCode);">
						</div>
					</td>
				</tr>
				<tr>
					<td class="input">
						<div class="input_name">
							<p class="l_text">メールアドレス<span id="eMail" class="is-hide eMessage"></span></p>
							<input type="text" name="bike1" class="input_text" id="mail" placeholder="bike_nenpi@bike-nenpi.com"  onkeypress="submit_c(event.keyCode);">
						</div>
					</td>
				</tr>
				<tr>
					<td class="input">
						<div class="input_name">
							<p class="l_text">パスワード<span id="ePassword" class="is-hide eMessage"></span></p>
							<input type="password" name="bike1" id="password_i" class="input_text" onkeypress="submit_c(event.keyCode);">
						</div>
					</td>
				</tr>




				<tr>
					<td class="input">
						<div class="input_name">
							<p class="l_text">愛車①</p>
							<input type="text" name="bike1" class="input_text" id="ubike1"
								placeholder="スーパーカブ50" value="">
						</div>
					</td>
				</tr>

				<tr>
					<td class="input">
						<div class="input_name">
							<p class="l_text">愛車②</p>
							<input type="text" name="bike2" class="input_text" id="ubike2"
								placeholder="HAYABUSA" value="">
						</div>
					</td>
				</tr>

				<tr>
					<td colspan="2" class="btn_index4">
						<p class="btn_index4">
							<input type="submit" value="登録確認" class="btn_submit" id="check">
						</p>
					</td>
				</tr>
			</table>
	</div>




	<!--更新確認-->

<div class="space is-hide" id="check_block">

    <table class="input_table">

<%--     <input type="hedden" name="accept" value="<%=Bean_Input_User.getAccept() %>"> --%>

				<tr class="tr_table">
					<td class="title_table">
						<h2 class=PageTitle_login>-登録確認-</h2>
					</td>
				</tr>

				<tr>
					<td class="input" colspan="2">
						<p class="input_name">下記の内容で更新します。</p>
					</td>
				</tr>
				<tr>
					<td class="input">
						<div class="input_name">
							<p class="l_text">-メールアドレス-</p>
							<input type="hidden" name="mail_address" class="input_text"
								value="">
						</div>
						<p class="input_name input_check" id="c_mail"></p>
					</td>
				</tr>
				<tr>
					<td class="input">
						<div class="input_name">
							<p class="l_text">-ニックネーム-</p>
							<input type="hidden" name="nickname" class="input_text" value="">
						</div>
						<p class="input_name input_check" id="c_user_name"></p>
					</td>
				</tr>

				<tr>
					<td class="input">
						<div class="input_name">
							<p class="l_text">-パスワード-</p>
						</div>
						<p class="input_name input_check" id="c_password"></p>
					</td>
				</tr>
				<tr>
					<td class="input">
						<div class="input_name">
							<p class="l_text">-愛車①-</p>
						</div>
						<p class="input_name input_check" id="c_ubike1"></p>
					</td>
				</tr>
				<tr>
					<td class="input">
						<div class="input_name">
							<p class="l_text">-愛車②-</p>
						</div>
						<p class="input_name input_check" id="c_ubike2"></p>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="btn_index4">
						<p class="btn_index4">
							<input type="submit" value="登録する" class="btn_submit" id="regist">
						</p>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="btn_index4">
						<p class="btn_index4">
							<input type="submit" value="修正する" class="btn_submit" id="back"><br />
						</p>
					</td>
				</tr>

			</table>
    </div>




    <!--footerのインクルード-->
<%@ include file="../common/footer.jsp" %>



    </body>
</html>