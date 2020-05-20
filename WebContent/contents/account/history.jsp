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
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+JP" rel="stylesheet">
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

	like = function(data){

		console.log(this);

		var t = $("#fc"+data.fc_id);

		console.log(t);
		console.log(data.fc_good);
	var fcGood = data.fc_good+ 1;
	t.val("イイ燃費 "+fcGood+" 🔥");
	t.attr('disabled', 'disabled');

		  var request = {
				    fc_id : data.fc_id,
				    fc_good : fcGood,
				    process_flg : 2
				  };

		$.ajax({
		    type    : "post",
		    url     : "/bikeNenpi/FC_Find_A",
		    data    : { jsonTodo: JSON.stringify(request) },
		    async   : true,
		  }).done(function() {

		  })
		  .fail(function() {
		  })
		  .always(function() {
		  });
	}


	$(document).ready(function(){


		user_id = $("#user_id").val();
		getFc();
	});





function getFc() {

	console.log(findPoint);

	//リクエストJSON
	  var request = {
	    user_id : user_id,
	    findPoint : findPoint,
	    process_flg : 3
	  };

	  //ajaxでservletにリクエストを送信
	  $.ajax({
	    type    : "post",          //GET / POST
	    url     : "/bikeNenpi/FC_Find_A",  //送信先のServlet URL
	    data    : { jsonTodo: JSON.stringify(request) },       //リクエストJSON
	    async   : true,           //true:非同期(デフォルト), false:同期
	    success : function(data) {

	    	if(data.length  < 5){
	    		$(".more_fc").addClass("is-hide");
	    	}
	    	writeFc(data);
	    	console.log(data);
	    	findPoint = findPoint + 5;

	    },
	    error : function(XMLHttpRequest, textStatus, errorThrown) {
	      alert(XMLHttpRequest+"リクエスト時になんらかのエラーが発生しました：" + textStatus +":\n" + errorThrown);
	    }
	  });

	}

$("#more_fc_btn").on("click",function(){
	getFc();
});


function writeFc(data){
	var fcTable="";
	var cnt = 0;

	data.forEach(function(list){
		cnt++;
		var fuel="";
        if(list.fuel === 1){
    		fuel="ガソリン";
        }else{
    		fuel="ハイオク";
        }


		 var split = list.fc.toString().split(".")
			if(split[1] === null || split[1] === undefined){
				list.fc=list.fc+".00";
			}else if(split[1].length === 1){
				list.fc=list.fc+"0";
			}else{
			}

			 var arr = list.date_time.split(" ");
			 list.date_time = arr[0] || list.date_time;

			 //画像の有無を確かめる
$.ajax({
    type    : "post",          //GET / POST
    url     : list.ubikePhotPass,  //送信先のServlet URL
    async   : true,           //true:非同期(デフォルト), false:同期
  }).done(function(data) {

	  if(data.lenght === 0){
		  console.log("true");
		  $(".regist_fc_in_fc_show").removeClass("is-hide");
	  }
  })
  .fail(function() {
	  list.ubikePhotPass ="/bikeNenpi/img/NoPhot2.png";
  })
  .always(function( jqXHR, textStatus ) {


	  list.ubikePhotPass = "'"+list.ubikePhotPass+"'";
		fcTable='<table class="fc_show_table2 fst2" id='+list.fc_id+'>'+
	       '<tr>'+
	       '<th colspan=3 class="">'+
	   	   '<p class="bike_name_his">'+list.bike_name+'の燃費</p>'+
	       '</th>'+
	   '</tr>'+
        '<tr>'+
            '<th class="FC_Check_Show_td_th">'+
        	   '<p class="const">投稿者</p>'+
        	   '<p><span id="user_name2"></span>'+list.user_name+' さん</p>'+
            '</th>'+
            '<th   colspan=2  class="FC_Check_Show_td_th">'+
               '<p class="const">街乗り/高速</p>'+
               '<p><span id="city_ride2"></span>'+list.city_ride+'%/<span id="high_way_ride2"></span>'+list.high_way_ride+'%</p>'+
           '</th>'+
        '</tr>'+
       '<tr class="FC_All_Show_tr">'+
           '<th class="FC_Check_Show_td_th">'+
               '<p class="const">燃費</p>'+
               '<p><span id="fc2"></span>'+list.fc+' Km/L</p>'+
           '</th>'+
           '<th class="FC_Check_Show_td_th">'+
               '<p class="const">油種</p>'+
               '<p><span id="fuel2">'+fuel+'</span></p>'+
           '</th>'+
           '<th class="FC_Check_Show_td_th">'+
               '<p class="const">年式</p>'+
               '<p><span id="model_year2"></span>'+list.model_year+' 年式</p>'+
           '</th>'+
       '</tr>'+
       '<tr class="FC_All_Show_tr">'+
       '<td colspan="4" class="FC_All_Show_td_th fc_show_comment"><input type="hidden" id="fc_good" val="'+list.fc_good+'">'+
               '</span><input type="button" id="fc'+list.fc_id+'"value="イイ燃費の数： '+list.fc_good+' 🔥" class="fc_like" ><div class="coment_block" ><span class="const">一言コメント</span>'+
                '<span class="comentDate">'+list.date_time+'</span>'+
               '<p><span id="comment">'+list.fc_comment+'</span></p></div>'+
           '</td>'+
       '</tr>'+
       '<tr class="FC_All_Show_img ">'+
           '<td colspan="4" class="" id="c_uphot_td">'+
           '<img id="c_uphot" alt="" src='+list.ubikePhotPass+' class="imgView" >'+
           '</td>'+
       '</tr>'+
       '<tr>'+
       '<th colspan=3 class="">'+
   	   '<input type="button" value="この投稿を削除" onclick="delete_fc('+list.fc_id+','+list.ubikePhotPass+');" class="delete_btn">'+
       '</th>'+
   '</tr>'+
   '</table>';
   //作成したテーブルを挿入。
		$('#fc_block').before(fcTable);



  });

	});

	if(cnt === 0){
		$("#history_none").html("まだ、燃費を投稿してません。");
	}else{
		$("#history").html(bikeName+" の燃費を写真と一緒に自慢しませんか？");
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

</script>

<body><!--ページの中央部分-->
<!--ヘッダーのインクルード-->


<h2 class=PageTitle_login><br/><br/>-<span id="bike_name1"></span>投稿履歴-</h2>
<input type="hidden" id="bike_id" value="1" >
<input type="hidden" id="find_point" value="0" >

<!--ヘッダーのインクルード-->
<%@ include file="../common/header.jsp" %>


<!--     <p class="bike_phot_top_Block">
            <img src="[バイクの写真]" alt="[タイトル]画像" class=bike_phot_top>
    </p> -->

<div class="serch_fc">
<!--     <table class="table_FC_show_block">
        <tr>
            <td class="most_FC_show_td">
                    <table class="FC_show_table">
                        <tr>
                        <td>
                    <span id="bike_name2"></span>
                        </td>
                        </tr>
                        <tr>
                        <td>
                          <p class="FC_show" >平均燃費<p>
                            <p class="FC_show" ><span id="fc_ave"></span>km/L<p>
                        </td>
                        </tr>
                    </table>

                    <table class="FC_show_table">
                        <tr>
                        <td>
                          今月の最良燃費<small class="attention">*1</small>
                        </td>
                        </tr>
                       <tr>
                        <td>
                          <p>👑<span  id="fc_max_user">名無し</span>さん<p>
                        </td>
                        </tr>
                        <tr>
                        <td>
                            <p class="FC_show"><span id="fc_max"></span> km/L<p>
                        </td>
                        </tr>
                    </table>
    </table> -->


<div class="regist_fc_in_fc_show is-hide">
<p id="please_fc_regist">投稿した燃費がありません。初燃費を投稿しませんか？</p>

<input  type="button" id="fc_regist_btn" class="btn_submit" value="燃費を投稿する">
</div>

<div id="fc_block">

</div>
<div class="more_fc">
<input  type="button" id="more_fc_btn" class="btn_submit" value="さらに読み込む">

</div>
</div>


    <!--footerのインクルード-->
<%@ include file="../common/footer.jsp" %>


    <div class="adsence3">
        <?php include ('../common/google.adsence.html'); ?>
    </div>



    </body>
</html>