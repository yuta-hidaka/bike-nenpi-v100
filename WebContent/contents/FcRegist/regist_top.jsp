<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<! DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

<!--スマホで見やすいように準備します。↓-->
    <meta name="viewport" content="width=device-width , initial-scale=1">

    <title>バイク燃費.com-燃費を登録する-</title>
<!--    googleFontのWebFontをimport-->
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+JP" rel="stylesheet">

    <link rel = "stylesheet" href="../../css/layout2.css">
    <link rel = "stylesheet" href="../../css/headerBarCss.css">
    <script src="../../js/jquery-3.3.1.min.js"></script>
<%@ include file="../common/google.adsence.html"%>
</head>


<script>

function submit(id,name,flg){
$.when().then(function(){
	$("#bId").val(id);
	$("#bName").val(name);
	$("#find").val(flg);
}).then(function(){
	document.find_form.submit();
});

//formのサブミット
function submit() {
//submit()でフォームの内容を送信

}

}


$(document).ready(function() {
	$("#search_box").on("blur",function(){
/* 		$("#s_result").addClass("is-hide");
		$("#tbl_result").empty();
		$("#search_box").val("");
 */
	});


	$("#search_box").on("input",function(){
		$("#s_result").removeClass("is-hide");
		$("#tbl_result").empty();
		var word = $("#search_box").val();
	//リクエストJSON
	  var request = {
	    word : word,
	    process_flg : 0
	  };

		if(word != ""){
	  $.ajax({
		    type    : "post",
		    url     : "/bikeNenpi/Bike_Find_A",
		    data    : { jsonTodo: JSON.stringify(request) },
		    async   : true,
	  }).done(function(data) {

		  $("#tbl_result").empty();
		  if(data ==="" || data.length ===0){
				$("#s_result").addClass("is-hide");
				$("#alert").removeClass("is-hide");
				$("#alert").html("バイク情報が見つかりません。");
		  }else{
				$("#alert").addClass("is-hide");
				$("#s_result").removeClass("is-hide");
		  }


		  data.forEach(function(list){

			  var bikeVal="'"+list.bike_name+"'";

			  var result =
			'<tr id="result_child"><td>'+
			  '<div class="regist_fc_in_fc_show">'+
			 /*  '<p id="result_fc_regist" class="result_fc_regist">'+list.maker_name_jp+':'+list.bike_name+'</p>'+ */
			 /*  '<input  type="submit" id="" class="result_fc_regist" value="'+list.maker_name_jp+':'+list.bike_name+'">'+ */
			  '<div><p class="result_fc_regist_find_maker">'+list.maker_name_jp+'</p><div class="result_a_block"><a onclick="submit('+list.bike_id+','+bikeVal+',8)" class="result_fc_regist result_fc_regist_find" href="#" >'+list.bike_name+'</a></div>'+
			  '</div></div>'+
			  '</td></tr>';
			  $("#tbl_result").append(result);


		  });


	  })
	  .fail(function() {
		  list.ubikePhotPass ="/bikeNenpi/img/NoPhot2.png";
	  })
	  .always(function( jqXHR, textStatus ) {
		  });
	  }else{

			$("#s_result").addClass("is-hide");

	  }
		});



/* $('#find_maker').on('click',function(){
	$("#find").val(4);
console.log("find_maker");
submit();

})

$('#find_country').on('click',function(){
	$("#find").val(5);
console.log("find_country");
submit();

})

//formのサブミット
function submit() {
//submit()でフォームの内容を送信
document.find_form.submit();
} */



	var position = $("#search_by_name").offset().top;

	$("#search_box").click(function(){
	    $("html,body").animate({
	        scrollTop : position
	    }, {
	        queue : false
	    });
	});

});




</script>

<body><!--ページの中央部分-->
<!--ヘッダーのインクルード-->
<%@ include file="../common/header.jsp" %>



<h2 class=PageTitle_login><br/><br/>-燃費を登録-</h2>
<!--

    <div class="regist_comp"><h2 class="regist_comp">ご登録ありがとうございます！
        <br/></h2></div>
-->

		<p class="result_fc_findf "  id="search_by_name">バイク名で探す
		</p>
		<div class="fc_search_block">
			<div class="search_box_td">
				<input type="text" id="search_box" placeholder="kawasaki H2" autocomplete="off">
			</div>
			<div id="alert" class="is-hide"></div>
			<div id="s_result" class="is-hide">
				<table id="tbl_result">
				</table>
			</div>
		</div>


<div class="serch_fc">
    <table class="table_serch_fc">
        <tr>
            <td class="btn_index">
                <a href="#" onclick="submit(0,0,4)" id="find_maker">メーカーから探す</a>
            </td>
        </tr>
        <tr>
            <td class="btn_index">
                <a href="#" onclick="submit(0,0,5)"  id="find_country">国から探す</a>
            </td>
        </tr>
    </table>

</div>

	<form name="find_form" action="../../FC_Regist" method="post">
		<input type="hidden" name="fc_regist_process_flg" value="4" id="find">
		<input type="hidden" id="bId" name="bike_id" value="">
		<input type="hidden" id="bName" name="bike_name"value="">
	</form>

	<!--footerのインクルード-->
<!--ヘッダーのインクルード-->
<%@ include file="../common/footer.jsp" %>





    </body>
</html>