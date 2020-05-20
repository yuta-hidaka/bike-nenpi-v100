<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="bikeNenpi.BEANS.Bean_UserInfo"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@page import="bikeNenpi.BEANS.Bean_BikeInfo"%>
<%@page import="bikeNenpi.UTILs.Exchanger"%>


<! DOCTYPE html>
<html>
<head>



<meta charset="UTF-8">

<!--スマホで見やすいように準備します。↓-->
<meta name="viewport" content="width=device-width , initial-scale=1">

<title>バイク燃費.com-燃費登録-</title>
<!--    googleFontのWebFontをimport-->
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+JP"
	rel="stylesheet">

<link rel="stylesheet" href="/bikeNenpi/css/layout2.css">
<link rel="stylesheet" href="/bikeNenpi/css/headerBarCss.css">
<script src="/bikeNenpi/js/jquery-3.3.1.min.js"></script>
<script src="/bikeNenpi/js/exif.js"></script>
<script src="/bikeNenpi/js/cropper.js"></script>


<!-- CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/cropper/1.0.0/cropper.min.css"
	rel="stylesheet" type="text/css" media="all" />

<!-- JS -->
<!-- <script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/cropper/1.0.0/cropper.min.js"></script>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.4.3/cropper.js"></script>


<%@ include file="../common/google.adsence.html"%>

</head>

<body>

	<!--ページの中央部分-->
	<%@ include file="../common/header.jsp"%>



	<%--         <%

	      Bean_UserInfo Bean_Input_User = new Bean_UserInfo();

        if((Bean_UserInfo)request.getAttribute("Bean_Input_User") != null){

    	Bean_Input_User=(Bean_UserInfo)request.getAttribute("Bean_Input_User");
        }

/*     @SuppressWarnings("unchecked") */

	System.out.println("case:44");
    ArrayList<String> birthday = new ArrayList<String>();


    if(Bean_Input_User.getMail_add() == null || Bean_Input_User.getPassword() == null||
    		Bean_Input_User.getMail_add() == "" || Bean_Input_User.getPassword() == ""
    		){
    Bean_Input_User.setMail_add("");
	Bean_Input_User.setUser_name("");
	Bean_Input_User.setPassword("");
    }

	if(Bean_Input_User.getBirthday() == null || Bean_Input_User.getBirthday() == ""){

		//誕生日がないときはここで初期値を指定
		birthday.add("0");
		birthday.add("選択");
		birthday.add("0");
		birthday.add("選択");
		birthday.add("0");
		birthday.add("選択");

	}else{

		//戻るボタンが押されたときにはここで値を再加工する。
	String[] birthdayList = Bean_Input_User.getBirthday().split("-", 0);

	birthday.add(birthdayList[0]);
	birthday.add(birthdayList[1]);
	birthday.add(birthdayList[2]);

	birthday.add(birthdayList[0]);
	birthday.add(birthdayList[1]);
	birthday.add(birthdayList[2]);
}



%> --%>
<%
Bean_BikeInfo bike = new Bean_BikeInfo();
bike=(Bean_BikeInfo)request.getAttribute("list");

%>



	<script>

	function sliceMaxLength(elem, maxLength) {

	    elem.value = elem.value.slice(0, maxLength);
	}

	//formのサブミット
	function submit() {
      //submit()でフォームの内容を送信
      /* document.fc_form.submit(); */
      $(".fc_regist_form").click();
    }

		$(document).ready(function() {

			var today = new Date();
			var year = today.getFullYear();
			var list ="";

			for(var i = year ; i > 1900 ; i--){
				list =list + '<option value="'+i+'">'+i+'年</option>';
			}
			list = '<select name="model_year" id="model_year"class="input-fc-num">'+list+'</select>';

			$("#year_select").append(list);




			var fcInputBtn = document.getElementById('input_change_btn');
			var fcInputVal = document.getElementById('input_change');
			$('#input_change_btn').on("click",function(){
				var val = $('#input_change').val();
				$("#fc").val("");
				if(val == 1){
					$('#input_change_btn').val("3桁入力に切替");
					$('#input_change').val(0);
					$("#fc").attr('placeholder','22.5');
				}else if(val == 0){
					$('#input_change_btn').val("2桁入力に切替");
					$('#input_change').val(1);
					$("#fc").attr('placeholder','122.5');
				}

			});

			$("#fc").on('input',function(){
				var fc = $("#fc").val();
				var check_fc = $("#fc").val().replace(".","");
				var match_num = check_fc.match(/[^0-9]/gi);
				var val = $("#input_change").val();

/* 				 if(match_num !== null){
					 $("#fc").val();
				 } */

				fc = fc.replace(".", "");
				 fc = fc.replace(/[^0-9]/gi,0);
				fc = "00000" + fc;

				if(val == 0){
					fc = fc.slice(-4);
					var fcF = fc.slice(0,2);
					var fcL = fc.slice(-2);

				}else{
					fc = fc.slice(-5);
					var fcF = fc.slice(0,3);
					var fcL = fc.slice(-2);

				}


				fc = fcF +"." +fcL;
			 $("#fc").val(fc);
			});







					//キャンバスを用いて画像を編集するメソッド
					var file = document.getElementById('Ubike_btn');
					var canvas = document.getElementById('canvas');

					var canvasWidth = 500;
					var canvasHeight = 500;
					var uploadImgSrc;
					var CropData;
					var BackUpData="";
					var GlobalCropper;
					var fileData;
					var orientation;
					var editImg;
					var canvasG;
					// Canvasの準備
					canvas.width = canvasWidth;
					canvas.height = canvasHeight;
					var ctx = canvas.getContext('2d');
					var ctx2 = canvas2.getContext('2d');
	    			$("#c_uphot").attr('src','\\bikeNenpi\\img\\NoPhot2.png');



					/*画像表示用の部分  */
					var file = document.getElementById('ufile');
					var orientation = 0;

				    $(function(){

				    	function cropper(){
				    		$('.p-crop-img').removeClass('is-hide');
				    		$(".cropper-container").remove();
				    		$("#noimg").remove();
				    		var canvas2 = document.getElementById('canvas2');
				    		//console.log("cropper");


				    		$.when()
				    		.then(function(){
				    			$('#img').attr('src',editImg);
				    			})
				    		.then(function(){
				    			var image = $("#img")[0];
				    			var options = {
				    					aspectRatio: 1 / 1,
				    					movable:true,
				    					zoomable:true,
				    			};
				    			var cropper = new Cropper(image, options);
				    			GlobalCropper = cropper;

				    		});





				    	}

						// ファイルが指定された時にloadLocalImage()を実行

				        // id="Ubike_btn"の変化でコールバック
				        	var position = $("#noimg").offset().top;
				        	position = position - 180;
						console.log(position);
						$("#Ubike_btn").click(function(){

							$("html,body").animate({
								scrollTop : position
								}, {
									queue : false
									});
							});

				        $("#Ubike_btn").change(function(e){
				        	//console.log("canvas:exif");

							fileData = e.target.files[0];
							var fileSize = fileData.size;

							  EXIF.getData(fileData,function(){
								  orientation = EXIF.getAllTags(this).Orientation;
								 // console.log(orientation);
							  });

				            // 選択ファイルの有無をチェック
				            if (!this.files.length) {
				                alert('ファイルが選択されていません');
				                return;
				            }
				            // Formからファイルを取得
				            var file = this.files[0];
				            // (1) HTMLのCanvas要素の取得
				            var canvas = $("#canvas2");
				            // (2) getContext()メソッドで描画機能を有効にする
				            var ctx = canvas[0].getContext('2d');
				            // 描画イメージインスタンス化
				            var img = new Image();
				            // File API FileReader Objectでローカルファイルにアクセス
				            var fr = new FileReader();
				            // ファイル読み込み読み込み完了後に実行 [非同期処理]
				            fr.onload = function(evt) {
				                // 画像がロードされた後にcanvasに描画を行う [非同期処理]
				                img.onload = function() {

				                    // (3) プレビュー(Cnavas)のサイズを指定


				                    var cnvsH = img.naturalHeight;
				                    var cnvsW = img.naturalWidth;

				                    //var cnvsH = 500;
				                    //var cnvsW = 500;
				                    // (4) Cnavasにサイズアトリビュートを設定する

				                    // (5) 描画
				                    var w = img.width;
				                    var h = img.height;

				                  //  console.log(orientation);

				                    switch (orientation) {
				                    case 3: //画像が１８０度回転している時
					                    var cnvsH = img.naturalHeight;
					                    var cnvsW = img.naturalWidth;
	 				                    canvas.attr('width', cnvsW);
					                    canvas.attr('height', cnvsH);
				                        //canvas.width = w;
				                        //canvas.height = h;
				                        ctx.rotate(Math.PI);
				                        ctx.drawImage(img, -w, -h);
				                        ctx.rotate(-Math.PI);

				                        break;
				                    case 6: //画像が時計回りに９０度回っている時
						                   var cnvsH = img.naturalWidth;
						                   var cnvsW = img.naturalHeight;

		 				                    canvas.attr('width', cnvsW);
						                    canvas.attr('height', cnvsH);
				                        //canvas.width = w;
				                        //canvas.height = h;
				                        ctx.rotate(Math.PI * 0.5);
				                        ctx.drawImage(img, 0, -h);
				                        ctx.rotate(-Math.PI * 0.5);

				                        //console.log("6");
				                        break;
				                    case 8: //画像が反時計回りに９０度回っている時
					                    var cnvsH = img.naturalHeight;
					                    var cnvsW = img.naturalWidth;
	 				                    canvas.attr('width', cnvsW);
					                    canvas.attr('height', cnvsH);
				                        //canvas.width = h;
				                        //canvas.height = w;
				                        ctx.rotate(-Math.PI * 0.5);
				                        ctx.drawImage(img, -w, 0);
				                        ctx.rotate(Math.PI * 0.5);

				                        //console.log("8");
				                        break;
				                    default:
					                var cnvsH = img.naturalHeight;
				                    var cnvsW = img.naturalWidth;
 				                    canvas.attr('width', cnvsW);
				                    canvas.attr('height', cnvsH);
				                       // canvas.width = w;
				                        //canvas.height = h;
				                        ctx.drawImage(img, 0, 0);

				                        }

				                     $.when()
				                     .then(function(){canvasG = document.getElementById('canvas2');})
				                     .then(function(){
				                    	 //console.log("todataURL");
				                    	 var quality = 0.7;


				                    	 var capacityRatio = 1;
								        if(2000000 <= fileSize) {
								            capacityRatio = 2000000 / fileSize;
								        }

				                    	 editImg = canvasG.toDataURL("image/jpeg", capacityRatio);
					                     uploadImgSrc  = editImg;

				                     })
				                     .then(function(){})
				                     .then(function(){cropper();});





				                }

				                // 読み込んだ画像をimageのソースに設定
				                img.src = evt.target.result;

				            }

				            // fileを読み込む データはBase64エンコードされる
				            fr.readAsDataURL(file);
				        })
				   })




					function loadLocalImage(e) {
						// ファイル情報を取得
					fileData = e.target.files[0];
						//console.log("loadLocalImg");
						// 画像ファイル以外は処理を止める
						if (!fileData.type.match('image.*')) {
							alert('画像を選択してください');
							return;
						}

						// FileReaderオブジェクトを使ってファイル読み込み
						var reader = new FileReader();
						// ファイル読み込みに成功したときの処理
						reader.onload = function() {


							// Canvas上に表示する
							uploadImgSrc = reader.result;
							canvasDraw();
						}
						// ファイル読み込みを実行
						reader.readAsDataURL(fileData);

					}

					// ファイルが指定された時にloadLocalImage()を実行
/* 					file.addEventListener('change', loadLocalImage, false); */

					// Canvas上に画像を表示する
					function canvasDraw(imgSrc) {

						// canvasを画像に変換//戻ったときのために元の画像を保持させる。
 					var result =  uploadImgSrc.indexOf(',')+1;
						 BackUpData =  uploadImgSrc.slice(result);


						$('#BackUp_Uphot_base64').val(BackUpData);


						// canvas内の要素をクリアする
						ctx.clearRect(0, 0, canvasWidth, canvasHeight);

						//画像の切り抜き
						ctx.beginPath();




						// Canvas上に画像を表示
						var img = new Image();
						img.src = uploadImgSrc;
						//console.log("width");
						//console.log(img.width);
						img.onload = function() {

							ctx.beginPath();
							var DefData = {
								x : 0,
								y : 0,
								width : 500,
								height : 500,
							}
							//切り取りデータがないときは初期値が入力される。
							CropData = CropData || DefData;


							ctx.drawImage(this, CropData.x, CropData.y,CropData.width, CropData.height, 0, 0, 500,500);
							  ctx2.drawImage(this, CropData.x, CropData.y,CropData.width, CropData.height, 0, 0, 500,500);
							$('#x').val(CropData.x);
							$('#y').val(CropData.y);
							$('#width').val(CropData.width);
							$('#height').val(CropData.height);





							// canvasを画像に変換
							var data = canvas.toDataURL("image/jpeg",1);


			    			$("#c_uphot").attr('src',data);
							//data.replace("data:image/png;base64,","test");
							var result = data.indexOf(',')+1;
							data = data.slice(result);
							$('#Uphot_base64').val(data);
						}
					}



					$("#ImgInput").on("change", function() {
						$('.p-crop-img').removeClass('is-hide');
						$(".cropper-container").remove();
						$("#noimg").remove();

					});



					$("#crop-img").on('click', function() {
						/* CropData = $('#img').GlobalCropper('getData'); */
						CropData = GlobalCropper.getData();

						canvasDraw();
						$('.crop-Uphot').addClass('is-hide');
						$('.pre-Uphot').removeClass('is-hide');
					});

					$("#re-crop-img").on('click', function() {
						$('.crop-Uphot').removeClass('is-hide');
						$('.pre-Uphot').addClass('is-hide');
					});
				});

		$(document).ready(function() {
			//noPhotの写真が押されてもクリックイベントを発火させる。
			$("#noimg").on('click', function() {
				document.getElementById("Ubike_btn").click();
			});

		});

		$(function() {
			var setFileInput = $('.imgInput');
			var selfImg;
			setFileInput.each(function() {
						var selfFile = $(this), selfInput = $(this).find('input[type=file]');
						selfInput.change(function() {
						  				selfFile.find('.imgView').remove();
									var file = $(this).prop('files')[0], fileRdr = new FileReader(),
									selfImg = selfFile.find('.imgView');
									//console.log(selfFile.find('.imgView'));
									if (!this.files.length) {
										if (0 < selfImg.size()) {
											selfImg.remove();
											return;
										}
									} else {
										if (file.type.match('image.*')) {
											if (0==0) {
												/* console.log(selfFile.find('imgView')); */
												selfFile.append('<img id="img" alt="" class="imgView" >');
												/* console.log(selfFile.find('imgView')); */
											}
											var prevElm = selfFile.find('.imgView');
											fileRdr.onload = function() {
					/* 							$('img').attr('src',fileRdr.result);
												console.log(fileRdr.result);
												console.log("result on img"); */
											}
											fileRdr.readAsDataURL(file);
										} else {

											alert("画像を選択して下さい。");
											return false;
											if (0 < selfImg.size()) {
												selfImg.remove();
												return;
											}
										}
									}
								});
					});
		});

		//レンジボタン(燃費割合)の値を取得するメソッド
		function getValRange() {

			var ratio = $('.fc-slider').val();
			var ratio2 = 100 - ratio;
			$('#city-ride').text(ratio2);
			$('#highway-ride').text(ratio);

			$('#city_ride').val(ratio2);
			$('#high_way_ride').val(ratio);

		}

		$(function() {
			getValRange();
			$('.fc-slider').on('input', function(event) {
				getValRange();
			});
		});




		/*登録確認⇔修正  */
		$(document).ready(function() {



		$('#check').on('click',function(){


			$("#user_id_fc_regist").val($("#user_id").val());
			$("#user_name_fc_regist").val($("#user_name").val());


			//scrollTo(0, 300);


			//燃費
			var fc = $("#fc").val();

			if(fc > 200){
				alert("ごめんなさい。燃費が良すぎます。");
				return false;
			}

			if(fc === "" || fc === "00.00"){
				alert("燃費の入力をお願いします。");
				return false;
			}

		    //油種選択
		    var fuel = $('input[name=fuel]:checked').val();
		   // console.log(fuel);
		    var fuel_name;
		    if(fuel==1){
		    	fuel_name = "ガソリン";
		    }else{
		    	fuel_name = "ハイオク";
		    }

		    //道割合
			var city = $('.fc-slider').val();
			var highway = 100 - city;

			//年式
			 var model_year = $("#model_year").val();

			//一言コメント
			var comment = $("#comment").val();

			//ユーザー
			var user_name = $("#user_name").val();
			var user_id = $("#user_id").val();

			//バイク名/バイクID
			var bike_name = $("#bike_name").val();
			var bike_id = $("#bike_id").val();


			$("#user_name2").html(user_name);

			$("#fc2").html(fc);

			$("#city_ride2").html(highway);

			$("#high_way_ride2").html(city);

			//console.log(fuel_name);
			$("#fuel2").html(fuel_name);

			$("#model_year2").html(model_year);

			$("#comment2").html(comment);



			$(".fc_input").addClass('is-hide');
			$(".fc_check").removeClass('is-hide');
			window.scrollBy(0,-1000);

		});

		$('#back').on('click',function(){
			$(".fc_check").addClass('is-hide');
			$(".fc_input").removeClass('is-hide');
			window.scrollBy(0,-1000);
		});
		});






	</script>




<form name="fc_form" method="post" class="fc_regist_form"action="/bikeNenpi/FC_Regist">
<input type="hidden" id="user_id_fc_regist" name="user_id2">
<input type="hidden" id="user_name_fc_regist" name="user_name2">
	<div class="fc_input" >
		<table class="input_table fc_table">
			<tr>
				<td class="input">
					<div class="input_name fc-input-title">
						<%=bike.getBike_name()%>の燃費入力
						<% %>
					</div>
				</td>
			</tr>

			<tr>
				<td class="input">
					<div class="input_name">平均燃費</div>
					<input type="button"  class="input_fc_change" value="3桁入力に切替" id="input_change_btn">
					<div class="input_fc_fc">
					<input type="hidden" value="0" id="input_change">
						<input type="tel" name="fc" class="input-fc-num" id="fc" max="10" placeholder="20.55" > Km/L
					</div>
				</td>
			</tr>
			<tr>
					<td class="input">
						<div class="input_name">
							油種<br />
							<div class="radio_input fuel_radio">
								<input type="radio" name="fuel" id="select1" value="1" checked="checked"><label class="gas" for="select1" >ガソリン</label>
								<input type="radio" name="fuel" id="select2" value="2" ><label class="gas" for="select2">ハイオク</label>
							</div>
						</div>
					</td>
				</tr>
				<tr>
				<td class="input">
					<div class="input_name">年式</div>
					<div class="input_fc" id="year_select">

					</div>
				</td>
			</tr>

			<tr>
				<td class="input"><div class="input_name">使用した道の割合</div>
					<div class="fc_input_block">
						<span class="city">街乗り</span><span class="high_way">高速道路</span>
						<div class="fc-slider-block">
							<strong class="fc-val"><span id="city-ride"></span>%</strong>
							<input type="range" value="50" min="0" max="100" step="1" class="fc-slider" /> <strong class="fc-val">
							<span id="highway-ride"></span>%</strong>
						</div>

					</div></td>
			</tr>

			<tr>
				<td class="input">
					<p class="input_fc">
					<p class="input_name">一言コメント</p> <textarea id="comment"
						name="comment" class="inputComment"
						placeholder="満タン法での燃費です。愛車は2010年式の隼です。 低回転で、素早くシフトアップすると燃費が改善しました！"></textarea>
				</td>
			</tr>

			<tr>
				<td class="phot_input">
					<div class="crop-Uphot">
						<div class="imgInput" id="ImgInput">
							<label class="Ubike_label" for="Ubike_btn"> <span
								class="ImgTitle">愛車の写真を選ぶ</span> <input type="file"
								id="Ubike_btn" name="Uphot">
							</label>
						</div>
						<img src="/bikeNenpi/img/NoPhot.png" id="noimg" alt="" class="" width="100%">


					<div class="p-crop-img is-hide" >
						<input type="button" id="crop-img" value="切り取る">
					</div>

					</div>

						<input type="text" class="is-hide" value="0" id='Uphot_base64' name='Uphot_base64' />

						<input type="text" class="is-hide" value="1" id='fc_regist_process_flg' name='fc_regist_process_flg' />
						<input type="text" class="is-hide" value="<%=bike.getBike_id() %>" id='bike_id' name='bike_id' />
						<input type="text" class="is-hide" value="<%=bike.getBike_name()%>" id='bike_name' name='bike_name' />

					<div class="pre-Uphot is-hide">
						<canvas id="canvas"></canvas>

						<input type="button" id="re-crop-img" class="ImgTitle"value="やり直す">
						<div id="result"></div>
					</div>
				</td>
			</tr>

			<tr>
				<td class="phot_input">
					<!-- 					<div class="imgInput" id="ImgInput">
						<label class="Ubike_label" for="Ubike_btn"> <span class="ImgTitle">愛車の写真を選ぶ</span>
						 <input type="file"id="Ubike_btn" name="Uphot">
						</label>
					</div> <img src="/bikeNenpi/img/NoPhot.png" id="noimg" alt="" class="imgView" width="300px">
					<div><input type="button" id="crop-img" value="切り取る"></div> --> <!-- 					 <div class="upload"><input type="file" name="file" id="file"></div> -->


				</td>
			</tr>
			<tr>
				<td colspan="2" class="btn_next input_check_btn">
					<p class="btn_index1">
						<input type="button" value="登録確認" class="btn_submit" id="check">
					</p>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="btn_next input_check_btn">
					<p class="btn_index1">
						<input type="submit" value="戻る" class="btn_submit" onclick="history.back()" id="regist"><br />
					</p>
				</td>
			</tr>
		</table>

</div>



	<div class="fc_check is-hide" >
<div class="space">

<!--     <input type="hidden" name="UserRegistFlg"   id='fc_regist_process_flg' class="input_text" value="1">


    <input type="hidden" name="user_id" class="input_text" id="user_id" value="">
    <input type="hidden" name="user_name" class="input_text" id="user_name1" value="">

    <input type="hidden" name="fc" class="input_text" id="fc1" value="50">
    <input type="hidden" name="high_way_ride" class="input_text" id="high_way_ride1" value="50">
    <input type="hidden" name="city_ride" class="input_text" id="city_ride1"  value="0">
    <input type="hidden" name="model_year" class="input_text" id="model_year1"  value="0">
    <input type="hidden" name="model_year" class="input_text" id="fuel1"  value="0">
    <input type="hidden" name="comment" class="input_text" id="comment1"  value="0">
 -->

    <input type="hidden" name="high_way_ride" class="input_text" id="high_way_ride" value="50">
    <input type="hidden" name="city_ride" class="input_text" id="city_ride"  value="0">

    <table class="input_table">

<%--     <input type="hedden" name="accept" value="<%=Bean_Input_User.getAccept() %>"> --%>

         <tr class="tr_table">
            <td colspan=3  class="title_table">
                <h2 class=PageTitle_login>-登録確認-</h2>
            </td>
        </tr>
        <tr>
				<td class="input">
					<div class="input_name fc-input-title">
						<%=bike.getBike_name()%>
						<% %>
					</div>
				</td>
			</tr>
         <tr>
             <th class="FC_Check_Show_td_th">
         	   <p class="const">投稿者</p>
         	   <p><span id="user_name2"></span>さん</p>
             </th>
             <th   colspan=2  class="FC_Check_Show_td_th">
                <p class="const">街乗り/高速</p>
                <p><span id="city_ride2"></span>%/<span id="high_way_ride2"></span>%</p>
            </th>
         </tr>

        <tr class="FC_All_Show_tr">
            <th class="FC_Check_Show_td_th">
                <p class="const">燃費</p>
                <p><span id="fc2"></span>Km/L</p>
            </th>
            <th class="FC_Check_Show_td_th">
                <p class="const">油種</p>
                <p><span id="fuel2"></span></p>
            </th>
            <th class="FC_Check_Show_td_th">
                <p class="const">年式</p>
                <p><span id="model_year2"></span>年</p>
            </th>
        </tr>
        <tr class="FC_All_Show_tr">
            <td colspan="4" class="FC_Check_Show_td_th" id="">
                <p class="const">一言コメント</p>
                <p><span id="comment2"></span></p>
            </td>
        </tr>
        <tr class="FC_All_Show_tr">
            <td colspan="4" class="" id="c_uphot_td">
            <img id="c_uphot" alt="" class="imgView" >
            </td>
        </tr>
        <tr class="btn_fc_ergist">
            <td colspan="2">
                <p class="btn_index4">
                <input type="button" value="登録する" class="btn_submit"  onClick="submit();" id="regist_fc">
                </p>
            </td>
        </tr>
        <tr  class="btn_fc_ergist">
            <td colspan="2" class="btn_fc_ergist_td">
                <p class="btn_index4">
                    <input type="button" value="修正する" class="btn_submit"  id="back"><br/>
                </p>
            </td>
        </tr>
    </table>

    </div>
	<div class="spacer"></div>
</div>
</form>










<canvas id="canvas2" class="UphotImg is-hide"></canvas>
	<%@ include file="../common/footer.jsp"%>



</body>
</html>