<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="bikeNenpi.BEANS.Bean_UserInfo"%>


<! DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!--スマホで見やすいように準備します。↓-->
<meta name="viewport" content="width=device-width , initial-scale=1">

<title>バイク燃費.com-新規登録-</title>
<!--    googleFontのWebFontをimport-->
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+JP"
	rel="stylesheet">

<link rel="stylesheet" href="/bikeNenpi/css/layout2.css">
<link rel="stylesheet" href="/bikeNenpi/css/headerBarCss.css">
<script src="/bikeNenpi/js/jquery-3.3.1.min.js"></script>

<!--     画像切り抜きjs-cropperの導入 -->
<!-- <script src="/path/to/jquery.js"></script> -->
<link href="/bikeNenpi/dist/cropper.css" rel="stylesheet">
<script src="/bikeNenpi/dist/cropper.js"></script>
<%@ include file="../common/google.adsence.html"%>
</head>

<body>
	<!--ページの中央部分-->
	<!--ヘッダーのインクルード-->
	<%@ include file="../common/header.jsp"%>


<script>

var gData = "";
$(document).ready(function() {


	$("#in_mail").on("input",function(){
		 $("#eMail").addClass("is-hide");
	});

	$("#in_name").on("input",function(){
		 $("#eName").addClass("is-hide");
	});

	$("#in_password").on("input",function(){
		var inPassword = $("#in_password").val();
		if(inPassword.match(/^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{8,100}$/) || inPassword.match(/^(?=.*?[a-z])(?=.*?\d)(?=.*?[!-\/:-@[-`{-~])[!-~]{8,100}$/i)){
			 $("#ePassword").addClass("ok");
			 $("#ePassword").html("OK");
		}else{
			$("#ePassword").removeClass("ok");
			 $("#ePassword").removeClass("is-hide");
			 $("#ePassword").html("<br>大文字を含む8文字以上の半角英数字を入力してください。");
		}

	});



$("#smt").on("click",function(){

	mailPass_c();

});

});


function mailPass_c(){
	var inMail = $("#in_mail").val();
	var inName = $("#in_name").val();
	var inPassword = $("#in_password").val();
	var text ="";
	var cnt = 0;

	if(inMail === "" || inMail === null ||inMail === undefined){
		 $("#eMail").removeClass("is-hide");
		 $("#eMail").html("<br>メールアドレスの入力をお願いします。");
	  cnt = 1;
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
			  if(data.errorCode === 1){
				  cnt = 1;
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
				}else{
					$("#ePassword").addClass("is-hide");
				}

				if(inPassword === "" || inPassword === null ||inPassword === undefined){
					 $("#ePassword").removeClass("is-hide");
					 $("#ePassword").html("<br>パスワードの入力をお願いします。");
					cnt = 1;
				}else{
					if(inPassword.match(/^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{8,100}$/) || inPassword.match(/^(?=.*?[a-z])(?=.*?\d)(?=.*?[!-\/:-@[-`{-~])[!-~]{8,100}$/i)){
						 $("#ePassword").addClass("ok");
						 $("#ePassword").html("OK");
					}else{

						 $("#ePassword").removeClass("is-hide");
						 $("#ePassword").html("<br>大文字を含む8文字以上の半角英数字を入力してください。");
						 cnt = 1;
					}
				}
				if(cnt !== 0){

					return false;
					}else{

						var s = document.getElementById('submit_bbt');
				s.click();
					}

			  });

		  }else{

				 $("#eMail").removeClass("is-hide");
				 $("#eMail").html("<br>メールアドレスの形式で入力をお願いします。");
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


	<div class="space">
		<form action="/bikeNenpi/UserRegist" method="post"
			accept-charset="UTF-8">
			<input type="hidden" name="UserRegistFlg" class="input_text"
				value="0">
			<table class="input_table">
				<tr class="tr_table">
					<td class="title_table">
						<h2 class=PageTitle_login>-新規登録-</h2>
					</td>
				</tr>

				<tr>
					<td class="input">
						<div class="input_name">
							<p class="l_text">メールアドレス<span id="eMail" class="is-hide eMessage"></span></p>
							<input type="email" name="mail_address" class="input_text" placeholder="bike_nenpi@bike-nenpi.com" id="in_mail" onkeypress="submit_c(event.keyCode);">
						</div>
					</td>
				</tr>

				<tr>
					<td class="input">
						<div class="input_name">
							<p class="l_text">ニックネーム<span id="eName" class="is-hide eMessage"></span></p>
							 <input type="text" name="nickname" class="input_text" placeholder="ねんぴタロー" id="in_name" onkeypress="submit_c(event.keyCode);">
						</div>
					</td>
				</tr>

				<tr>
					<td class="input">
						<div class="input_name">
							<p class="l_text">パスワード<span id="ePassword" class="is-hide eMessage"></span></p>
							 <input type="password" name="password" class="input_text" id="in_password" onkeypress="submit_c(event.keyCode);">
						</div>
					</td>
				</tr>



				<tr>
					<td colspan="2" class="btn_index1 btn_input1">
					<input type="submit" value="次へ" class="is-hide" id="submit_bbt">
										<input type="button" value="次へ" class="btn_submit regist_input_next_btn" id="smt" >
					</td>
				</tr>
			</table>

			<input type="hidden" name="regist_process_flg" class="input_text"
				value="0">

		</form>
	</div>
	<!--ヘッダーのインクルード-->
	<%@ include file="../common/footer.jsp"%>





</body>
</html>