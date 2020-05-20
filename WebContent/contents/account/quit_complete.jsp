

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@page  import="bikeNenpi.BEANS.Bean_UserInfo"%>
    <%@page  import="bikeNenpi.UTILs.Exchanger"%>


<! DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<%@ include file="../common/google.adsence.html"%>
<!--スマホで見やすいように準備します。↓-->
    <meta name="viewport" content="width=device-width , initial-scale=1">

    <title>バイク燃費.com-退会完了-</title>
<!--    googleFontのWebFontをimport-->
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+JP" rel="stylesheet">

    <link rel = "stylesheet" href="/bikeNenpi/css/layout2.css">
    <link rel = "stylesheet" href="/bikeNenpi/css/headerBarCss.css">
    <script src="/bikeNenpi/js/jquery-3.3.1.min.js"></script>

</head>

<body><!--ページの中央部分-->
<!--ヘッダーのインクルード-->
<%@ include file="../common/header.jsp" %>


<%
	      Bean_UserInfo Bean_Input_User = new Bean_UserInfo();
    	Bean_Input_User=(Bean_UserInfo)request.getAttribute("Bean_Input_User");
    	 %>


<div class="compleat_block">

    <table class="compleat_table">
        <tr>
            <td class="input" colspan="2">
                <p  class="input_complete">退会が完了しました。<br>また、遊びに来てください！
                </p>
            </td>
        </tr>
    </table>

    <!--footerのインクルード-->
<%@ include file="../common/footer.jsp" %>

    </div>





    </body>
</html>