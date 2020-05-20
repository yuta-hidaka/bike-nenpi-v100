

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@page  import="bikeNenpi.BEANS.Bean_FCInfo"%>
    <%@page  import="bikeNenpi.UTILs.Exchanger"%>


<! DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<%@ include file="../common/google.adsence.html"%>
<!--スマホで見やすいように準備します。↓-->
    <meta name="viewport" content="width=device-width , initial-scale=1">

    <title>バイク燃費.com-登録確認-</title>
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
		Bean_FCInfo FCInfo = new Bean_FCInfo();
    	FCInfo=(Bean_FCInfo)request.getAttribute("Bean_FC_Info");

    	 %>


<script>

function b_submit(flg){
	console.log(flg);
		 var flg = $('#fc_regist_process_flg');
		 flg.val(flg);
			 setTimeout(function(){
		  $('form').submit();
		 },10);

}

$(document).ready(function(){




	console.log("test");

console.log("<%=FCInfo.getUbikePhotPass() %>");


var uphot =document.getElementById('uphot');
var uphotPass = '<%=FCInfo.getUbikePhotPass() %>';
/* uphot.html(uphotPass);
 */

	$('.uphot').attr('src',uphotPass );







});



</script>

<div class="space">
    <form action="/bikeNenpi/FC_Regist" method="post">
    <input type="hidden" name="UserRegistFlg"   id='fc_regist_process_flg' class="input_text" value="1">
    <table class="input_table">

<%--     <input type="hedden" name="accept" value="<%=Bean_Input_User.getAccept() %>"> --%>

                <tr class="tr_table">
            <td class="title_table">
                <h2 class=PageTitle_login>-登録確認-</h2>
            </td>
        </tr>

         <tr>
            <td class="input" colspan="2">
                <p  class="input_name input_check"><%=FCInfo.getBike_name() %>の燃費を<br />下記の内容で登録します。 </p>
            </td>
        </tr>
        <tr>
            <td class="input">
                <p  class="input_name input_check">-平均燃費-
                <input type="hidden" name="mail_address" class="input_text" value="<%=FCInfo.getFc() %>">
                </p>
                <p class="input_name input_check"><%=FCInfo.getFc() %></p>
            </td>
        </tr>
        <tr>
            <td class="input">
                <p  class="input_name input_check">-年式-
                <input type="hidden" name="nickname" class="input_text" value="<%=FCInfo.getModel_year() %>">
                </p>
                <p class="input_name input_check"><%=FCInfo.getModel_year() %></p>
            </td>
        </tr>

                <tr>
            <td class="input">
                <p  class="input_name input_check">-街乗り：高速-
                <input type="hidden" name="nickname" class="input_text" value="<%=FCInfo.getCity_ride() %>">
                 <input type="hidden" name="nickname" class="input_text" value="<%=FCInfo.getHigh_way_ride() %>">
                </p>
                <p class="input_name input_check"><%=FCInfo.getCity_ride() %>:<%=FCInfo.getHigh_way_ride() %></p>
            </td>
        </tr>

        <tr>
            <td class="input">
                <p  class="input_name input_check">-一言コメント-
                <input type="hidden" name="password" class="input_text" value="<%=FCInfo.getFc_comment() %>">
                </p>
                <p class="input_name input_check"><%=FCInfo.getFc_comment() %></p>
            </td>
        </tr>

        <tr>
            <td class="input">

                <p  class="input_name input_check">-愛車の写真-
                    <input type="hidden" name="birthday" class="input_text" value="<%=FCInfo.getFc_comment()  %>">



                </p>
                <p class="uphot_p">
                <img id="img"  class="uphot" >
                </p>

            </td>
        </tr>

        <tr>
            <td colspan="2"  class="btn_index4">
                <p class="btn_index4">
                <input type="button" value="登録する" class="btn_submit" onClick="b_submit(2);" id="regist">
                </p>
            </td>
        </tr>
        <tr>
            <td colspan="2"  class="btn_index4">
                <p class="btn_index4">
                    <input type="button" value="修正する" class="btn_submit" onClick="b_submit(3);" id="regist"><br/>
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