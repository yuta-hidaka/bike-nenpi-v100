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

$("#reset_btn").on("click",function(){
	loginFlg = 2;
		btnPlace = 0;
		$("#eMessage").addClass("is-hide");
		$("#Message").addClass("is-hide");
		var mail = $("#mail_address").val();
		var birthday = $("#birthday").val();

		//リクエストJSON
	  var request = {
		mail_add : mail,
		birthday : birthday,
	    process_flg:1
	  };

	  $.ajax({
	    type    : "post",
	    url     : "/bikeNenpi/account",
	    data    : { jsonTodo: JSON.stringify(request) },
	    async   : true,
}).done(function(data) {

	console.log(data);
	  if(data.errorCode === 1 || data.errorCode === 2){
			$("#eMessage").removeClass("is-hide");

			switch(data.errorCode){
			case 1:
				  $("#eMessage").html("該当するアカウントが見つかりませんでした。<br/>メールアドレスまたは生年月日をもう一度ご確認ください。");
				break;
			case 2:
				  $("#eMessage").html("所定の回数をオーバーしました。<br>30分後に再度お試しください。");
				break;
			}
	  }else{

		  if(loginFlg === 2){
			  location.href='/bikeNenpi/contents/Login/reset.jsp';
			  location.click();
		  }

		$("#logIn_li").addClass("is-hide");
	$("#logOut_li").removeClass("is-hide");
		$("#eMessage").addClass("is-hide");
		$("#loginName").html(data.user_name);
		$("#user_id").val(data.user_id);
		$("#user_name").val(data.user_name);
		$(".iziModal-button-close").click();



	  }

})
.fail(function() {

})
.always(function( jqXHR, textStatus ) {
	loginFlg === 0
});
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
                <h2 class=PageTitle_login>-パスワード再発行-</h2>
            </td>
        </tr>
        <tr class="tr_table">
            <td class="title_table">
                <p class="p_reset_text">登録時のメールアドレスと<br>生年月日を入力してください。</p>
                <p id="eMessage" class="is-hide"></p>
                <p class="p_reset_text">不明な場合は<a href="mailto:support@bike-nenpi.com?subject=問い合わせ&amp;body=ご記入ください">サポート</a>まで</p>
            </td>
        </tr>

        <tr>
            <td class="input">
                <p class="l_text">メールアドレス</p>
                <input type="text" name="mail_address" class="input_text" id="mail_address" placeholder="xxxxx@bikenenpi.com">
            </td>
        </tr>

<tr>
					<td class="input">
						<div class="input_name">
							<p class="l_text">生年月日</p>
							<p class="input_birthday_list">
							<input type="date" id="birthday" name="birthday"   class="birthday"    value="2000-01-01"    min="1900-01-01" >​
							</p>
						</div>

					</td>
				</tr>

        <tr>
            <td colspan="2" class="btn_index">
                <input type="button" value="パスワードの再発行" id="reset_btn"class="btn_submit">
            </td>
        </tr>









    </table>

    </div>
    <!--footerのインクルード-->
<%@ include file="../common/footer.jsp" %>



    </body>
</html>