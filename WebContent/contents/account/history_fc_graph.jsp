<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%
	//ArrayList<String> list = new ArrayList<String>();
	//Bean_UserInfo Bean_Input_User = new Bean_UserInfo();
	@SuppressWarnings("unchecked")
	ArrayList<String> list = (ArrayList<String>) request.getAttribute("list");

	System.out.println(list.get(0));
	System.out.println(list.get(1));
%>

<! DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../common/google.adsence.html"%>
<!--スマホで見やすいように準備します。↓-->
<meta name="viewport" content="width=device-width , initial-scale=1">

<title>バイク燃費.com-燃費記録-</title>
<!--    googleFontのWebFontをimport-->
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+JP"
	rel="stylesheet">
<link rel="stylesheet" href="/bikeNenpi/css/layout2.css">
<link rel="stylesheet" href="/bikeNenpi/css/headerBarCss.css">
<link rel="stylesheet" href="/bikeNenpi/css/apexcharts.css">
<script src="/bikeNenpi/js/jquery-3.3.1.min.js"></script>
<script src="/bikeNenpi/js/apexcharts.min.js"></script>

</head>


<script>


var options = null;
var chart = null;
var de_flg=0;
	var like;
	var user_id = $("#user_id").val();
	//var bike_id = document.getElementById("bike_id").value;
	var bike_id = $("#bike_id").val();
	var bikeName="";
	var model_year = $("#model_year").val();
	var findPoint = 0;
	var today = new Date();
	//today = today.setDate(today.getDate() + 1);
	var day = today.getMonth() + 1;
	if(day.length === 1){
		day = "0"+day
	}
	var searchDate = (today.getFullYear() + "/" + (today.getMonth() + 1) + "/" + (today.getDate()+1));

    var year = today.getFullYear();
    var month = today.getMonth() + 1;
    var day = today.getDate();
    var d_day = (year) + "年" + (month) + "月" + (day) + "日";





	$(document).ready(function() {
		 bike_id = $("#bike_id").val();
		user_id = $("#user_id").val();
		model_year = $("#model_year").val();



		getFc(searchDate);


	    $("#today").html(d_day);

	    $("#backDay").on('click', function() {
	    	de_flg=1;
	        $.when().then(function() {
	        	today = new Date(searchDate);
	            today.setDate(today.getDate() - 1)


	        }).then(function() {
	            year = today.getFullYear();
	            month = today.getMonth() + 1;
	            day = today.getDate();
	            searchDate = (year) + "/" + (month) + "/" + (day);
	            today.setDate(today.getDate() - 1)
	            year = today.getFullYear();
	            month = today.getMonth() + 1;
	            day = today.getDate();
	        }).then(function() {

	        	 d_day = (year) + "年" + (month) + "月" + (day) + "日";

	    		$('#fc_block').empty();
	    		//$('#chart').empty();

	            getFc(searchDate);
	            $("#today").html(d_day);

	        });




	    });
	    $("#nextDay").on('click', function() {
	    	de_flg=1;
	        $.when().then(function() {
	        	today = new Date(searchDate);
	            today.setDate(today.getDate() + 1)


	        }).then(function() {
	            year = today.getFullYear();
	            month = today.getMonth() + 1;
	            day = today.getDate();
	            searchDate = (year) + "/" + (month) + "/" + (day)+ " 00:00:00";
	            today.setDate(today.getDate() - 1)
	            year = today.getFullYear();
	            month = today.getMonth() + 1;
	            day = today.getDate();
	        }).then(function() {


	            d_day = Number(year) + "年" + Number(month) + "月" + Number(day) + "日";


	    		$('#fc_block').empty();
	    		//$('#chart').empty();

	            getFc(searchDate);
	            $("#today").html(d_day);

	        });
	    });



	});
	function writeGraph(data){

		console.log(chart);

		if(chart != undefined){

		}
		var x=[];
		var y=[];

		var max=0;
		var min=0;
		var ave=0;
		var cnt=0;

		$("#bike_name1").html(data[0].bike_name + " (" + data[0].model_year+")");


		data.forEach(function(list){
			 var date =  list.regist_time.split(" ");
			 var date_ = date[0].split("-");

			 date = date_[0]+"年"+date_[1]+"月"+date_[2]+"日"
			 y.push(list.fc);
			 x.push(date);

			 if(max <= list.fc){
				 max = list.fc;
			 }

			 if(min > list.fc || cnt === 0){
				 min = list.fc;
			 }

			 ave = ave + list.fc;

			 cnt = cnt + 1;

		})

		ave = (ave / cnt).toFixed(2);
		$("#cntFc").html(cnt);
		$("#aveFc").html(ave);
		$("#maxFc").html(max);
		$("#minFc").html(min);


	


$.when().then(function(){
	 options = {
			  chart: {
			        id: 'yt',
			        group: 'social',
			        type: 'area'
			  },
			  colors: ['#90ee90'],
			    style: {
			        fontSize:  '16px',
			        color:  '#f0f8ff'
			      },
			  series: [{
			    name: '(Km/L)',
			    data:y
			  }],

			  xaxis: {
			    categories: x,
			    style: {
			        fontSize:  '16px',
			        color:  '#f0f8ff'
			      },
			  },

			  chart: {
				    foreColor: '#f0f8ff'
				},
			}
}).then(function(){
	console.log(x.length);
	console.log(y.length);




}).then(function(){
	if(de_flg!==0){


		chart.updateOptions({
			chart: {
		        id: 'yt',
		        group: 'social',
		        type: 'area'
		  },
		  colors: ['#90ee90'],
		    style: {

		        fontSize:  '16px',
		        color:  '#f0f8ff'
		      },
		  series: [{
		    name: '(Km/L)',
		    data:y
		  }],

		  xaxis: {
		    categories: x,
		    style: {
		        fontSize:  '16px',
		        color:  '#f0f8ff'
		      },
		  },

		  chart: {
			    foreColor: '#f0f8ff'
			},
			})
	}else{
		chart = new ApexCharts(document.querySelector("#chart"), options);
		chart.render();
	}

});




	}


	function getFc(searchDate) {


		var request = {
			user_id : user_id,
			date_time : searchDate,
			findPoint : findPoint,
			bike_id : bike_id,
			model_year : model_year,
			process_flg : 6
		};



		//ajaxでservletにリクエストを送信
		$.ajax({
			type : "post",
			url : "/bikeNenpi/FC_Find_A",
			data : {
				jsonTodo : JSON.stringify(request)
			},
			async : true,
			success : function(data) {

				writeGraph(data);
				writeFc(data);
				//writebike(data);

/* 				if (data.length < 30) {
					$('.more_fc').addClass('is-hide');
				} */

				findPoint = findPoint + 15;
			}
		});



	}

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
			  $(".regist_fc_in_fc_show").removeClass("is-hide");
		  }
	  })
	  .fail(function() {
		  list.ubikePhotPass ="/bikeNenpi/img/NoPhot2.png";
	  })
	  .always(function( jqXHR, textStatus ) {


		  list.ubikePhotPass = "'"+list.ubikePhotPass+"'";
			fcTable =  '<table class="fc_show_table2 fst2" id='+list.fc_id+'>'+
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

			$('#fc_block').append(fcTable);



	  });

		});
		//$('#fc_block').html(fcTable);
		if(cnt === 0){
			$("#history_none").html("まだ、燃費を投稿してません。");
		}else{
			$("#history").html(bikeName+" の燃費を写真と一緒に自慢しませんか？");
		}
		//$('#fc_block').append(fcTable);


	}



	var delete_fc = function(fc_id,UbikePhotPass){

		var answer = confirm("燃費を削除しますか？");
		if(answer) {

		}else{
		return false;
		}

		if(UbikePhotPass === "/bikeNenpi/img/NoPhot2.png"){
			UbikePhotPass = "none";
		}


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

				  fc_id = "#"+fc_id

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

<body>
	<!--ページの中央部分-->
	<!--ヘッダーのインクルード-->


	<h2 class=PageTitle_login>
		<br /> <br />-<span id="bike_name1"></span> の燃費記録-
	</h2>
	<input type="hidden" id="bike_id" value="<%=list.get(0)%>">
	<input type="hidden" id="model_year" value="<%=list.get(1)%>">

	<!--ヘッダーのインクルード-->
	<%@ include file="../common/header.jsp"%>


	<!--     <p class="bike_phot_top_Block">
            <img src="[バイクの写真]" alt="[タイトル]画像" class=bike_phot_top>
    </p> -->
	<div class="" style="">
		<input type="button" id="backDay" class="btn-link btn-link" value="◀">
		<span id="today" class="text-muted"></span> <input type="button"
			id="nextDay" class="btn-link btn-link" value="▶">
	</div>

	<div class="fc_show_box">
	<p>燃費の数：<span id="cntFc"></span> (Max：20)</p>
	<p>平均燃費：<span id="aveFc"></span> Km/L</p>
	<p>最高燃費：<span id="maxFc"></span> Km/L</p>
	<p>最低燃費：<span id="minFc"></span> Km/L</p>
	</div>

	<div id="chart"></div>


	<div class="serch_fc">

		<div class="regist_fc_in_fc_show is-hide">
			<p id="please_fc_regist">投稿した燃費がありません。初燃費を投稿しませんか？</p>

			<input type="button" id="fc_regist_btn" class="btn_submit"
				value="燃費を投稿する">
		</div>

		<div id="fc_block"></div>
<!-- 		<div class="more_fc">
			<input type="button" id="more_fc_btn" class="btn_submit"
				value="さらに読み込む">

		</div> -->
	</div>


	<!--footerのインクルード-->
	<%@ include file="../common/footer.jsp"%>


	<div class="adsence3">
		<?php include ('../common/google.adsence.html'); ?>
	</div>



</body>
</html>