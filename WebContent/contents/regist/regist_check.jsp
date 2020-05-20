<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bikeNenpi.BEANS.Bean_UserInfo"%>
<%@page import="bikeNenpi.UTILs.Exchanger"%>


<! DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

<!--スマホで見やすいように準備します。↓-->
    <meta name="viewport" content="width=device-width , initial-scale=1">

    <title>バイク燃費.com-登録確認-</title>
<!--    googleFontのWebFontをimport-->
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+JP" rel="stylesheet">

    <link rel = "stylesheet" href="/bikeNenpi/css/layout2.css">
    <link rel = "stylesheet" href="/bikeNenpi/css/headerBarCss.css">
    <script src="/bikeNenpi/js/jquery-3.3.1.min.js"></script>
<%@ include file="../common/google.adsence.html"%>
</head>

<body><!--ページの中央部分-->
<!--ヘッダーのインクルード-->
<%@ include file="../common/header.jsp" %>




<%
	      Bean_UserInfo Bean_Input_User = new Bean_UserInfo();
    	Bean_Input_User=(Bean_UserInfo)request.getAttribute("Bean_Input_User");

    	 %>


<script>

$(document).ready(function() {
var password = $("#password_2").val();
var birthday = $("#birthday").val();
var cnt = password.length;
var text = "";

console.log(password);
console.log(birthday);


for(var i = 0 ; i < cnt ;i++){
	console.log("text");
	text = text + "●";
}

console.log(text);
$("#password_text").html(text);

birthday = birthday.replace("-","年");
birthday = birthday.replace("-","月");
birthday = birthday + "日";

$("#birthday_text").html(birthday);

});


//Submitでの処理状況を変化させます。
$(document).on('click','#back',function() {


//regist_checkに処理が移るようにする
	$("#back").append('<input type="hidden" name="regist_process_flg" class="input_text" value="4">');
	window.setTimeout(function(){
	$("#regist_b").attr('action', '/bikeNenpi/UserRegist');
	$("#regist_b").submit();
	}, 1 );

});
$(document).on('click','#next',function() {
	//regist_input1に処理が移るようにする
	$("#next").append('<input type="hidden" name="regist_process_flg" class="input_text" value="3">');
	window.setTimeout(function(){
		$("#regist_b").attr('action', '/bikeNenpi/UserRegist');
		$("#regist_b").submit();
		}, 1 );
});



</script>

<div class="space">
    <form action="/bikeNenpi/UserRegist" method="post" id="regist_b">
                     <input type="hidden" name="UserRegistFlg" class="input_text" value="1">
    <table class="input_table">

<%--     <input type="hedden" name="accept" value="<%=Bean_Input_User.getAccept() %>"> --%>

                <tr class="tr_table">
            <td class="title_table">
                <h2 class=PageTitle_login>-登録確認-</h2>
            </td>
        </tr>

         <tr>
            <td class="input" colspan="2">
                <p  class="input_name">下記の内容で登録します。 </p>
            </td>
        </tr>
        <tr>
            <td class="input">
                <div  class="input_name"><p class="l_text">-メールアドレス-</p>
                <input type="hidden" name="mail_address" class="input_text" value="<%=Bean_Input_User.getMail_add() %>">
                </div>
                <p class="input_name input_check"><%=Bean_Input_User.getMail_add() %></p>
            </td>
        </tr>
        <tr>
            <td class="input">
                <div  class="input_name"><p class="l_text">-ニックネーム-</p>
                <input type="hidden" name="nickname" class="input_text" value="<%=Bean_Input_User.getUser_name() %>">
                </div>
                <p class="input_name input_check"><%=Bean_Input_User.getUser_name() %></p>
            </td>
        </tr>

        <tr>
            <td class="input">
                <div  class="input_name"><p class="l_text">-パスワード-</p>
                <input type="hidden" name="password" id="password_2" class="input_text" value="<%=Bean_Input_User.getPassword() %>">
                </div>
                <p class="input_name input_check" id="password_text"></p>
            </td>
        </tr>

        <tr>
            <td class="input">

                <div  class="input_name"><p class="l_text">-生年月日-</p>
                    <input type="hidden" name="birthday" id="birthday" class="input_text" value="<%=Bean_Input_User.getBirthday() %>">
                </div>
                <p class="input_name input_check" id="birthday_text">

                </p>

            </td>
        </tr>

        <tr>
            <td class="input">

                <div  class="input_name">
                   <p class="l_text">-性別-</p>
                    <input type="hidden" name="gender" id="select1" value="<%=Bean_Input_User.getGender()%>">
                </div>
                <p class="input_name input_check">
                    <%= Exchanger.ChangeGender(Bean_Input_User.getGender()) %>
                </p>
            </td>
        </tr>



        <tr>
            <td class="input">
                <div  class="input_name"><p class="l_text">-愛車①-</p>
                <input type="hidden" name="bike1" class="input_text" value=" <%=Bean_Input_User.getUbike1() %>">
                </div>
                <p  class="input_name input_check">
                    <%=Bean_Input_User.getUbike1() %>
                </p>
            </td>
        </tr>

       <tr>
            <td class="input">
                <div  class="input_name"><p class="l_text">-愛車②-</p>
                <input type="hidden" name="bike2" class="input_text" value="<%=Bean_Input_User.getUbike2() %>">
                		              <input type="hidden" id="d_rb5" name="accept"value="<%=Bean_Input_User.getAccept() %>">
                </div>
                <p  class="input_name input_check">
                    <%=Bean_Input_User.getUbike2() %>
                </p>
            </td>
        </tr>
        <tr>
            <td colspan="2"  class="btn_index4">
                <p class="btn_index4">
                <input type="submit" value="登録する" class="btn_submit" id="next">
                </p>
            </td>
        </tr>
        <tr>
            <td colspan="2"  class="btn_index4">
                <p class="btn_index4">
                    <input type="submit" value="修正する" class="btn_submit" id="back"><br/>
                </p>
            </td>
        </tr>




    </table>

    </form>
    </div>
    <!--footerのインクルード-->
<%@ include file="../common/footer.jsp" %>




    </body>
</html>