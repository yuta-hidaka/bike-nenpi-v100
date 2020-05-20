<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<! DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

<!--スマホで見やすいように準備します。↓-->
    <meta name="viewport" content="width=device-width , initial-scale=1">

    <title>バイク燃費.com-ログイン-</title>
<!--    googleFontのWebFontをimport-->
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+JP" rel="stylesheet">

    <link rel = "stylesheet" href="../../css/layout2.css">

    <link rel = "stylesheet" href="../../css/headerBarCss.css">
<%@ include file="../common/google.adsence.html"%>
</head>

<body><!--ページの中央部分-->
<!--ヘッダーのインクルード-->
<%@ include file="../common/header.jsp" %>




<div class="space">
    <form action="/bikeNenpi/LoginCheck" method="POST">
    <table class="input_table">
        <tr class="tr_table">
            <td class="title_table">
                <h2 class=PageTitle_login>-ログイン-</h2>
            </td>
        </tr>

        <tr>
            <td class="input">
                <p  class="input_name">メールアドレス</p>
                <input type="text" name="mail_address" class="input_text" >
            </td>
        </tr>

        <tr>
            <td class="input">
                <p  class="input_name">パスワード</p>
                <input type="password" name="password" class="input_text">
            </td>
        </tr>

        <tr>
            <td colspan="2" class="btn_index">
                <input type="submit" value="ログイン" class="btn_submit">
            </td>
        </tr>


        <tr>
            <td class="input_link_td">
							<p class="input_text_p2">
								<a href="/bikeNenpi/contents/Login/reset_.jsp" class="">パスワードを忘れた</a>
							</p>

							<p class="input_text_p2">または</p>

							<p class="input_text_p2">
								<a href="/bikeNenpi/contents/regist/regist_input1.jsp" class="">新規登録</a>
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