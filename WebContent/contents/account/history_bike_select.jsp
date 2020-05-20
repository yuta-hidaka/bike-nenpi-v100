<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<! DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../common/google.adsence.html"%>
<!--スマホで見やすいように準備します。↓-->
<meta name="viewport" content="width=device-width , initial-scale=1">

<title>バイク燃費.com-投稿履歴-</title>
<!--    googleFontのWebFontをimport-->
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+JP"
	rel="stylesheet">
<link rel="stylesheet" href="/bikeNenpi/css/layout2.css">
<link rel="stylesheet" href="/bikeNenpi/css/headerBarCss.css">
<script src="/bikeNenpi/js/jquery-3.3.1.min.js"></script>


</head>


<script>
var like;
var user_id = $("#user_id").val();


$(document).ready(function(){

});

$(document).ready(function(){

	$("#fc_regist_btn").on("click",function(){
		location.href = "/bikeNenpi/contents/FcRegist/regist_top.jsp";
		location.click();
	});

	var bikeId = $("#bike_id").val();
	var findPoint = 0;
	var bikeName ="";
	var bikeId = $("#bike_id").val();
	var findPoint = 0;


	$(document).ready(function(){
		user_id = $("#user_id").val();
		getBikeList();
	});





function getBikeList() {


	//リクエストJSON
	  var request = {
	    user_id : user_id,
	    findPoint : findPoint,
	    process_flg : 5
	  };

	  //ajaxでservletにリクエストを送信
	  $.ajax({
	    type    : "post",
	    url     : "/bikeNenpi/FC_Find_A",
	    data    : { jsonTodo: JSON.stringify(request) },
	    async   : true,
	    success : function(data) {
	    	console.log(data);
	    	writebike(data);

	    	if(data.length < 15){
$('.more_fc').addClass('is-hide');
	    	}

	    	findPoint = findPoint + 15;
	    }
	  });

	};


$("#more_btn").on("click",function(){
	console.log(findPoint);
	getBikeList();
});





function writebike(data){
	var fcTable="";
	var cnt = 0;
	var table = "";

	data.forEach(function(list){
		cnt++;

		table =
			table+

		'<tr><td class="input">'+
		'<p class="model_year">'+list.model_year+' 年式</p><p class="green_round_btn" onclick="fcGo('+list.bike_id+','+list.model_year+')">'+list.bike_name+'</p>'+
		'</td></tr>'
		;



	});
	table =
	'<table class="table_1">'+
	table+
	'</table>';

	$('#fc_block').before(table);

	if(cnt !== 15){

		$("#more_fc").addClass("is-hide");

	}

}



});

var delete_fc = function(fc_id,UbikePhotPass){

	var answer = confirm("燃費を削除しますか？");
	if(answer) {

	}else{
	return false;
	}

	if(UbikePhotPass === "/bikeNenpi/img/NoPhot2.png"){
		UbikePhotPass = "none";
	}

	console.log(UbikePhotPass);

	  var request = {
			    p_pass : UbikePhotPass,
			    fc_id : fc_id,
			    process_flg : 4,

			  };
	  $.ajax({
		    type    : "post",          //GET / POST
		    url     : "/bikeNenpi/FC_Find_A",
		    data    : { jsonTodo: JSON.stringify(request) },
		    async   : true,           //true:非同期(デフォルト), false:同期
		  }).done(function(data) {
			  console.log(fc_id);
			  fc_id = "#"+fc_id
			  console.log(fc_id);
			  $(fc_id).remove();
			  alert("燃費を削除しました。");
		  })
		  .fail(function() {

			  alert("削除に失敗しました。再ログイン後に再度お試しください。");

		  })
		  .always(function( jqXHR, textStatus ) {

		  });
}



function fcGo(bike_id,year){
		$.when().
		then(function(){

			console.log(bike_id);
			console.log(year);

			$("#fc_bike_id").val(bike_id);
			$("#model_year").val(year);


		}).then(function(){
			setTimeout(function(){

				 fcGoForm();
			},10);
		});
	}

	function fcGoForm(){
		$("#fcGoForm").submit();
	}

</script>

<body>
	<!--ページの中央部分-->
	<!--ヘッダーのインクルード-->


	<h2 class=PageTitle_login>
		<br /> <br />-<span id="bike_name1"></span>投稿履歴-
	</h2>
	<input type="hidden" id="bike_id" value="1">
	<input type="hidden" id="find_point" value="0">

	<!--ヘッダーのインクルード-->
	<%@ include file="../common/header.jsp"%>


	<!--     <p class="bike_phot_top_Block">
            <img src="[バイクの写真]" alt="[タイトル]画像" class=bike_phot_top>
    </p> -->

	<div class="serch_fc">

<form action="/bikeNenpi/FC_Find" method="post" id="fcGoForm">
		<input type="hidden" value="" name="bike_id" id="fc_bike_id">
		<input type="hidden" value="2" name="fc_find_process_flg">
		<input type="hidden" value="" name="model_year" id="model_year">
</form>

		<div class="regist_fc_in_fc_show is-hide">
			<p id="please_fc_regist">投稿した燃費がありません。初燃費を投稿しませんか？</p>

			<input type="button" id="fc_regist_btn" class="btn_submit"
				value="燃費を投稿する">
		</div>

		<div id="fc_block"></div>
		<div class="more_fc">
			<input type="button" id="more_btn" class="btn_submit" value="さらに読み込む">

		</div>
	</div>


	<!--footerのインクルード-->
	<%@ include file="../common/footer.jsp"%>


	<div class="adsence3">
		<?php include ('../common/google.adsence.html'); ?>
	</div>



</body>
</html>