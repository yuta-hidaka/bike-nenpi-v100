

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@page  import="bikeNenpi.BEANS.Bean_UserInfo"%>
    <%@page  import="bikeNenpi.UTILs.Exchanger"%>


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





<%-- <%
	      Bean_UserInfo Bean_Input_User = new Bean_UserInfo();
    	Bean_Input_User=(Bean_UserInfo)request.getAttribute("Bean_Input_User");
    	 %>
 --%>

<div class="compleat_block">

    <table class="compleat_table">
        <tr>
            <td class="input" colspan="2">
                <p  class="input_complete">燃費登録ありがとうございます！
                    <input type="hidden" name="birthday" class="input_text">
                </p>
            </td>
        </tr>
                <tr>
            <td class="input" colspan="2">
                <p  class="input_complete">他のユーザーの燃費を確認しますか？
                    <input type="hidden" name="birthday" class="input_text">
                </p>
            </td>
        </tr>

        <tr >
			<td colspan="2" class="btn_index btn_long" >
                <a href="/bikeNenpi/contents/bike/<%=request.getAttribute("bike_id")%>.jsp" >登録した燃費を確認する</a>
            </td>
        </tr>

        <tr>
            <td class="btn_index">
                <a href="/bikeNenpi/contents/FcFind/find_top.jsp">燃費を探す</a>
            </td>

            <td class="btn_index">
                <a href="#" id="regist_2fc">燃費を登録</a>
            </td>
</tr>




    </table>

    <!--footerのインクルード-->
<%@ include file="../common/footer.jsp" %>

    </div>





    </body>
</html>