

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

    <title>バイク燃費.com-エラーが発生しました-</title>
<!--    googleFontのWebFontをimport-->
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+JP" rel="stylesheet">

    <link rel = "stylesheet" href="/bikeNenpi/css/layout2.css">
    <link rel = "stylesheet" href="/bikeNenpi/css/headerBarCss.css">
    <script src="/bikeNenpi/js/jquery-3.3.1.min.js"></script>

</head>

<body><!--ページの中央部分-->
<!--ヘッダーのインクルード-->
<%@ include file="../common/header.jsp" %>


<div class="compleat_block">

    <table class="compleat_table">
        <tr>
            <td class="input" colspan="2">
                <div  class="input_complete">大変申し訳ありません。予期せぬエラーが発生しました。<br>
                もう一度お試し頂く前に、再ログインしていただきその状態で再度お試しください。<br>
                改善しない場合はサポートまたはTwitterメッセージまでご連絡ください。
                <p class="p_reset_text"><a href="https://twitter.com/BikeNenpi_com">Twitter</a></p>
                <p class="p_reset_text"><a href="mailto:support@bike-nenpi.com?subject=問い合わせ&amp;body=ご記入ください">サポート</a></p>
                    <input type="hidden" name="birthday" class="input_text">
                </div>
            </td>
</tr>




    </table>

    <!--footerのインクルード-->
<%@ include file="../common/footer.jsp" %>

    </div>





    </body>
</html>