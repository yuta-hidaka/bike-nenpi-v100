<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<! DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

<!--スマホで見やすいように準備します。↓-->
    <meta name="viewport" content="width=device-width , initial-scale=1">

    <title>バイク燃費.com-燃費を探す-</title>
<!--    googleFontのWebFontをimport-->
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+JP" rel="stylesheet">

    <link rel = "stylesheet" href="../../css/layout2.css">

    <link rel = "stylesheet" href="../../css/headerBarCss.css">

</head>

<body><!--ページの中央部分-->
<!--ヘッダーのインクルード-->
    <?php include ('../common/header.php'); ?>

<h2 class=PageTitle_login><br/><br/>-燃費を探す-</h2>
<!--

    <div class="regist_comp"><h2　class="regist_comp">ご登録ありがとうございます！
        <br/></h2></div>
-->


<div class="serch_fc">
    <table class="table_serch_fc">
        <tr>
            <td class="btn_index">
                <a href="/php/findData/find_with_meaker.php">メーカーから探す</a>
            </td>
        </tr>
        <tr>
            <td class="btn_index">
                <a href="#">国から探す</a>
            </td>
        </tr>
    </table>
</div>


    <!--footerのインクルード-->
    <?php include ('../common/footer.php'); ?>



    </body>
</html>