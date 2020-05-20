<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<! DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<%@ include file="../common/google.adsence.html"%>
<!--スマホで見やすいように準備します。↓-->
    <meta name="viewport" content="width=device-width , initial-scale=1">

    <title>バイク燃費.com-退会-</title>
<!--    googleFontのWebFontをimport-->
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+JP" rel="stylesheet">

    <link rel = "stylesheet" href="../../css/layout2.css">

    <link rel = "stylesheet" href="../../css/headerBarCss.css">

</head>

<body><!--ページの中央部分-->
<!--ヘッダーのインクルード-->
<%@ include file="../common/header.jsp" %>

<script>

$(document).ready(function() {

	var userId= $("#user_id").val();
	var prof;
	console.log(userId);

		//リクエストJSON
	  var request = {
	    user_id : userId,
	    process_flg:4
	  };

		$("#quit").on("click",function(){

			quit();

		});

function quit(){
	 $.ajax({
		    type    : "post",
		    url     : "/bikeNenpi/account",
		    data    : { jsonTodo: JSON.stringify(request) },
		    async   : true,
	  }).done(function(data) {

		  console.log(data.process_flg);
		  if(data.process_flg === 1){
			  location.href ="/bikeNenpi/contents/account/quit_complete.jsp";
			  location.click();

		  }

	  }).fail(function() {
	  }).always(function( jqXHR, textStatus ) {

	  });
}

});

	 </script>


<div class="space">
    <form action="/bikeNenpi/LoginCheck" method="POST">
    <table class="input_table">
        <tr class="tr_table">
            <td class="title_table">
                <h2 class=PageTitle_login>-退会-</h2>
            </td>
        </tr>

        <tr>
            <td class="">
            <p  class="quit_text">退会を行うとユーザー情報が削除されます。</p>
            <p  class="quit_text">燃費の情報は写真を除き保持されます。</p>
            <p  class="quit_text">燃費の情報も削除したい場合は、アカウントの投稿履歴より燃費情報をすべて削除してから退会をお願いします。</p>
            </td>
        </tr>


        <tr>
            <td colspan="2" class="btn_index">
                <input type="button" id="quit" value="退会する" class="btn_submit">
            </td>
        </tr>









    </table>
    </form>
    </div>
    <!--footerのインクルード-->
<%@ include file="../common/footer.jsp" %>



    </body>
</html>