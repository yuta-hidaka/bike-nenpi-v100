<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<! DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!--スマホで見やすいように準備します。↓-->
<meta name="viewport" content="width=device-width , initial-scale=1">

<title>バイク燃費.com-マイページ-</title>
<!--    googleFontのWebFontをimport-->
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+JP"
	rel="stylesheet">

<link rel="stylesheet" href="../../css/layout2.css">
<script src='//ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<link rel="stylesheet" href="../../css/headerBarCss.css">
<%@ include file="../common/google.adsence.html"%>
</head>

<script>

        $(document).ready(function() {

        $("#btn_history").on("click",function(){
			  location.href='/bikeNenpi/contents/account/history.jsp';
				  location.click();
        });

        $("#btn_history_bike").on("click",function(){
			  location.href='/bikeNenpi/contents/account/history_bike_select.jsp';
				  location.click();
      });

        $("#btn_update_prf").on("click",function(){
			  location.href='/bikeNenpi/contents/account/update.jsp';
				  location.click();
      });

        $("#btn_quit_prf").on("click",function(){
			  location.href='/bikeNenpi/contents/account/quit.jsp';
				  location.click();
      });
        });
        </script>

<body>
	<!--ページの中央部分-->
	<!--ヘッダーのインクルード-->
	<%@ include file="../common/header.jsp"%>


	<div class="space">
		<form action="/bikeNenpi/LoginCheck" method="POST">
			<table class="input_table">
				<tr class="tr_table">
					<td class="title_table">
						<h2 class=PageTitle_login>-account-</h2>
					</td>
				</tr>


				<tr>
					<td colspan="2" class="btn_index"><input type="button"
						value="投稿履歴(バイク別)" class="btn_submit" id="btn_history_bike"></td>
				</tr>


				<tr>
					<td colspan="2" class="btn_index"><input type="button"
						value="投稿履歴(全て)" class="btn_submit" id="btn_history"></td>
				</tr>

				<tr>
					<td colspan="2" class="btn_index"><input type="button"
						value="プロフィールの更新" class="btn_submit" id="btn_update_prf">
					</td>
				</tr>

				<tr>
					<td colspan="2" class="btn_index"><input type="button"
						value="退会" class="btn_submit" id="btn_quit_prf"></td>
				</tr>







			</table>
		</form>
	</div>
	<!--footerのインクルード-->
	<%@ include file="../common/footer.jsp"%>



</body>
</html>