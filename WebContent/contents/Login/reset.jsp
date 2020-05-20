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

<script src="/bikeNenpi/js/jquery-3.3.1.min.js"></script>
<%@ include file="../common/google.adsence.html"%>
</head>

<script type="text/javascript">

$(document).ready(function(){

	var session = false;
	var SessionId = $("#user_id").val();
	var loginFlg = 0;
	var btnPlace = 0;

$("#reset_login").on("click",function(){
$("#login").click();
});

});

</script>

<body><!--ページの中央部分-->
<!--ヘッダーのインクルード-->
<%@ include file="../common/header.jsp" %>


<div class="space">
    <table class="input_table">
        <tr class="tr_table">
            <td class="title_table">
                <h2 class=PageTitle_login>-再発行完了-</h2>
            </td>
        </tr>
        <tr class="tr_table">
            <td class="title_table">
                <p class="p_reset_text">パスワードを初期化しました。<br>生年月日がパスワードになっています。</p>
                <p class="p_reset_text attention_text"><strong>ログイン後すぐにパスワードを変更してください。</strong></p>
                <p class="p_reset_text"><br>例：1234年5月6日生まれ<br>パスワード：12340506</p>
                <p id="eMessage" class="is-hide"></p>
            </td>
        </tr>



        <tr>
            <td colspan="2" class="btn_index">
                <input type="button" value="ログインする" id="reset_login"class="btn_submit">
            </td>
        </tr>









    </table>

    </div>
    <!--footerのインクルード-->
<%@ include file="../common/footer.jsp" %>



    </body>
</html>