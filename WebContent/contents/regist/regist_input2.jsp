<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="bikeNenpi.BEANS.Bean_UserInfo"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
    <%@page  import="bikeNenpi.UTILs.Exchanger"%>

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
<%@ include file="../common/google.adsence.html"%>
</head>

<body>
	<!--ページの中央部分-->
	<%@ include file="../common/header.jsp"%>



	<%
	System.out.println("koko9?");
    ArrayList<String> birthday = new ArrayList<String>();
	Bean_UserInfo Bean_Input_User = new Bean_UserInfo();

	if((Bean_UserInfo)request.getAttribute("Bean_Input_User") != null){
	Bean_Input_User=(Bean_UserInfo)request.getAttribute("Bean_Input_User");
	}

	System.out.println(Bean_Input_User.getBirthday());



    if(Bean_Input_User.getBirthday() != null){

    }else{
    	Bean_Input_User.setBirthday("2000-01-01");
    	Bean_Input_User.setUbike1("");
    	Bean_Input_User.setUbike2("");
    	Bean_Input_User.setGender(3);
    }
/*     @SuppressWarnings("unchecked") */
%>

	<script>

 $(document).ready(function(){
/* var time = new Date();
var year = time.getFullYear();
for (var i = year; i >= 1900; i--) {
    $('#year').append('<option value="' + i + '" class="birthday_list">' + i + '年</option>');
}
for (var i = 1; i <= 12; i++) {
    $('#month').append('<option value="' + i + '" class="birthday_list">' + i + '月</option>');
}
for (var i = 1; i <= 31; i++) {
    $('#day').append('<option value="' + i + '" class="birthday_list">' + i + '日</option>');
} */

var cnt = 0;

	 $("#d_rb5").on("change",function(){

		 console.log(cnt%2);
		 if(cnt%2 == 0){
			 $(".accept").html("同意済");
			  $(".accept").removeClass("is-hide");
			  $(".accept").removeClass("is-hide");

		 }else{
			 $(".accept").html("");
			  $(".accept").addClass("is-hide")
		 }
		 cnt++;
	 });

});


//Submitでの処理状況を変化させます。
$(document).on('click','#back',function() {
//regist_checkに処理が移るようにする
	$("#back").append('<input type="hidden" name="regist_process_flg" class="input_text" value="1">');
	window.setTimeout(function(){
	$("#regist_b").attr('action', '/bikeNenpi/UserRegist');
	$("#regist_b").submit();
	}, 1 );
});

$(document).on('click','#next',function() {

var accept_c = $("#d_rb5:checked").val() || 0;
var birthday_c = $("#birthday").val();

if(accept_c === 0){
	alert("利用規約に同意をお願いします。");
	return false;
}

	//regist_input1に処理が移るようにする
	$("#next").append('<input type="hidden" name="regist_process_flg" class="input_text" value="2">');
	window.setTimeout(function(){
		$("#regist_b").attr('action', '/bikeNenpi/UserRegist');
		$("#regist_b").submit();
		}, 1 );
});

</script>
	<div class="space">
		<form action="/bikeNenpi/UserRegist" method="post" id="regist_b">
			<input type="hidden" name="UserRegistFlg" class="input_text"
				value="0">
				<input type="hidden" name="mail_address"
				class="input_text" value="<%= Bean_Input_User.getMail_add() %>">
			<input type="hidden" name="nickname" class="input_text"
				value="<%= Bean_Input_User.getUser_name() %>"> <input
				type="hidden" name="password" class="input_text"
				value="<%= Bean_Input_User.getPassword() %>">

			<table class="input_table">
				<tr>
					<td class="input">
						<div class="input_name">
							<p class="l_text">生年月日</p>

							<p class="input_birthday_list">
							<label class="birthday_label">
							<input type="date" id="birthday" name="birthday"   class="birthday"    value="<%=Bean_Input_User.getBirthday() %>"    min="1900-01-01" >
							</label>​
							</p>
						</div>

					</td>
				</tr>
				<tr>
					<td class="input">

						<div class="input_name">
							<p class="l_text">性別</p>
							<div class="radio_input gender">
								<input type="radio" name="gender" id="select1" value="1" <%=Exchanger.Num1Checker(Bean_Input_User.getGender()) %>><label for="select1" class="gendar_label">男性</label>
								<input type="radio" name="gender" id="select2" value="2" <%=Exchanger.Num2Checker(Bean_Input_User.getGender()) %>><label for="select2" class="gendar_label">女性</label>
								<input type="radio" name="gender" id="select3" value="3" <%=Exchanger.Num3Checker(Bean_Input_User.getGender()) %>> <label for="select3" class="gendar_label">選択しない</label>
							</div>
						</div>

					</td>
				</tr>


				<tr>
					<td class="input">
						<div class="input_name">
							<p class="l_text">愛車①*任意</p> <input type="text" name="bike1" class="input_text" placeholder="スーパーカブ50" value="<%=Bean_Input_User.getUbike1() %>">
						</div>
					</td>
				</tr>
				<tr>
					<td class="input">
						<div class="input_name">
							<p class="l_text">愛車②*任意</p>
							 <input type="text" name="bike2" class="input_text" placeholder="CBX400" value="<%=Bean_Input_User.getUbike2() %>">
						</div>
					</td>
				</tr>

				<tr>
					<td class="input">
						<div class="input_name_check">
						<input type="checkbox" id="d_rb5"name="accept" value="1" />
									<a href="/bikeNenpi/contents/termofservice.html" target="_blank">利用規約</a>に同意する。
									<div class="accept is-hide"></div>
						</div>
					</td>
				</tr>

				<tr>
					<td colspan="2" class="btn_next input_check_btn">
						<span class="btn_index1">
							<input type="button" value="登録確認" class="btn_submit regist_btn" id="next">
						</span>

						<span class="btn_index1">
							<input type="button" value="戻る" class="btn_submit" id="back"><br />
						</span>

					</td>
			</table>
		</form>
	</div>
	<%@ include file="../common/footer.jsp"%>



</body>
</html>