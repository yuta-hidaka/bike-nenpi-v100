<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<! DOCTYPE html>
    <html>

    <head>
    <meta charset="UTF-8">

    <!--スマホで見やすいように準備します。↓-->
    <meta name="viewport" content="width=device-width , initial-scale=1">

    <title>バイク燃費.com-450SXの燃費-</title>
    <!--    googleFontのWebFontをimport-->
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+JP" rel="stylesheet">
    <meta name="description" content="バイク好きのための燃費登録サイトです！！このページは450SXの燃費一覧です。450SXを所有するユーザーから投稿された燃費一覧を確認できます！あなたもバイク燃費.comで愛車のバイクの燃費を登録しませんか？">
    <link rel="stylesheet" href="/bikeNenpi/css/layout2.css">
    <link rel="stylesheet" href="/bikeNenpi/css/headerBarCss.css">
    <script src="/bikeNenpi/js/jquery-3.3.1.min.js"></script>
    <%@ include file="../common/google.adsence.html"%>


</head>


<script>
    var like;

    $(document).ready(function() {

    });

    $(document).ready(function() {

        var bikeId = $("#bike_id").val() || 1;
        var findPoint = 0;
        var bikeName = "";
        var bikeId = $("#bike_id").val() || 1;
        var findPoint = 0;

        like = function(data) {

            console.log(this);

            var t = $("#fc" + data.fc_id);

            console.log(t);
            console.log(data.fc_good);
            var fcGood = data.fc_good + 1;
            t.val("イイ燃費 " + fcGood + " 🔥");
            t.attr('disabled', 'disabled');

            var request = {
                fc_id: data.fc_id,
                fc_good: fcGood,
                process_flg: 2
            };

            $.ajax({
                    type: "post",
                    url: "/bikeNenpi/FC_Find_A",
                    data: {
                        jsonTodo: JSON.stringify(request)
                    },
                    async: true,
                }).done(function() {

                })
                .fail(function() {})
                .always(function() {});
        }


        //リクエストJSON
        var request = {
            bike_id: bikeId,
            findPoint: findPoint,
            process_flg: 0
        };

        //ajaxでservletにリクエストを送信
        $.ajax({
            type: "post", //GET / POST
            url: "/bikeNenpi/FC_Find_A", //送信先のServlet URL
            data: {
                jsonTodo: JSON.stringify(request)
            }, //リクエストJSON
            async: true, //true:非同期(デフォルト), false:同期
            success: function(data) {
                bikeName = data.bike_name;

                //取得データをバインドしていきます。
                var split = data.ave_fc.toString().split(".")
                if (split[1] === null || split[1] === undefined) {
                    data.ave_fc = data.ave_fc + ".00";
                } else if (split[1].length === 1) {
                    data.ave_fc = data.ave_fc + "0";
                } else {}

                var split = data.max_fc.toString().split(".")
                if (split[1] === null || split[1] === undefined) {
                    data.max_fc = data.max_fc + ".00";
                } else if (split[1].length === 1) {
                    data.max_fc = data.max_fc + "0";
                } else {}




                $('#fc_ave').html(data.ave_fc);
                $('#fc_max').html(data.max_fc);
                $('#fc_max_user').html(data.user_name);


                $('#bike_name1').html(bikeName);
                $('#bike_name2').html(bikeName);
                $('#bId').val(data.bike_id);
                $('#bName').val(bikeName);


            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest + "リクエスト時になんらかのエラーが発生しました：" + textStatus + ":\n" + errorThrown);
            }
        }).always(function(jqXHR, textStatus) {

            getFc()

        });









        function getFc() {

            //console.log(findPoint);

            //リクエストJSON
            var request = {
                bike_id: bikeId,
                findPoint: findPoint,
                process_flg: 1
            };

            //ajaxでservletにリクエストを送信
            $.ajax({
                type: "post", //GET / POST
                url: "/bikeNenpi/FC_Find_A", //送信先のServlet URL
                data: {
                    jsonTodo: JSON.stringify(request)
                }, //リクエストJSON
                async: true, //true:非同期(デフォルト), false:同期
                success: function(data) {

                    if (data.length < 5) {
                        $(".more_fc").addClass("is-hide");
                    }
                    writeFc(data);
                    console.log(data);
                    findPoint = findPoint + 5;

                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest + "リクエスト時になんらかのエラーが発生しました：" + textStatus + ":\n" + errorThrown);
                }
            });

        }

        $("#more_fc_btn").on("click", function() {
            getFc();
        });


        function writeFc(data) {
            var fcTable = "";
            var cnt = 0;

            data.forEach(function(list) {
                cnt++;
                var fuel = "";
                if (list.fuel === 1) {
                    fuel = "ガソリン";
                } else {
                    fuel = "ハイオク";
                }


                var split = list.fc.toString().split(".")
                if (split[1] === null || split[1] === undefined) {
                    list.fc = list.fc + ".00";
                } else if (split[1].length === 1) {
                    list.fc = list.fc + "0";
                } else {}

                var arr = list.date_time.split(" ");
                list.date_time = arr[0] || list.date_time;

                //画像の有無を確かめる
                $.ajax({
                        type: "post", //GET / POST
                        url: list.ubikePhotPass, //送信先のServlet URL
                        async: true, //true:非同期(デフォルト), false:同期
                    }).done(function() {

                    })
                    .fail(function() {
                        list.ubikePhotPass = "/bikeNenpi/img/NoPhot2.png";
                    })
                    .always(function(jqXHR, textStatus) {
                        fcTable = '<table class="fc_show_table2 fst2">' +
                            '<tr>' +
                            '<th class="FC_Check_Show_td_th">' +
                            '<p class="const">投稿者</p>' +
                            '<p><span id="user_name2"></span>' + list.user_name + ' さん</p>' +
                            '</th>' +
                            '<th   colspan=2  class="FC_Check_Show_td_th">' +
                            '<p class="const">街乗り/高速</p>' +
                            '<p><span id="city_ride2"></span>' + list.city_ride + '%/<span id="high_way_ride2"></span>' + list.high_way_ride + '%</p>' +
                            '</th>' +
                            '</tr>' +
                            '<tr class="FC_All_Show_tr">' +
                            '<th class="FC_Check_Show_td_th">' +
                            '<p class="const">燃費</p>' +
                            '<p><span id="fc2"></span>' + list.fc + ' Km/L</p>' +
                            '</th>' +
                            '<th class="FC_Check_Show_td_th">' +
                            '<p class="const">油種</p>' +
                            '<p><span id="fuel2">' + fuel + '</span></p>' +
                            '</th>' +
                            '<th class="FC_Check_Show_td_th">' +
                            '<p class="const">年式</p>' +
                            '<p><span id="model_year2"></span>' + list.model_year + ' 年式</p>' +
                            '</th>' +
                            '</tr>' +
                            '<tr class="FC_All_Show_tr">' +
                            '<td colspan="4" class="FC_All_Show_td_th fc_show_comment"><input type="hidden" id="fc_good" val="' + list.fc_good + '">' +
                            '</span><input type="button" id="fc' + list.fc_id + '"value="イイ燃費 ' + list.fc_good + ' 🔥" class="fc_like" onclick="like({fc_id :' + list.fc_id + ' , fc_good : ' + list.fc_good + '});"><div class="coment_block" ><span class="const">一言コメント</span>' +
                            '<span class="comentDate">' + list.date_time + '</span>' +
                            '<p><span id="comment">' + list.fc_comment + '</span></p></div>' +
                            '</td>' +
                            '</tr>' +
                            '<tr class="FC_All_Show_img ">' +
                            '<td colspan="4" class="" id="c_uphot_td">' +
                            '<img id="c_uphot" alt="" src="' + list.ubikePhotPass + '" class="imgView" >' +
                            '</td>' +
                            '</tr>' +
                            '</table>';
                        //作成したテーブルを挿入。
                        $('#fc_block').before(fcTable);



                    });

            });

            if (cnt === 0) {
                $("#please_fc_regist").html(bikeName + " の初燃費を写真と一緒に投稿しませんか？");
            } else {
                $("#please_fc_regist").html(bikeName + " の燃費を写真と一緒に自慢しませんか？");
            }

        }

    });
</script>

<body>
    <!--ページの中央部分-->
    <!--ヘッダーのインクルード-->


    <h1 class=PageTitle_login><br /><br />-450SX の燃費-</h1>
    <input type="hidden" id="bike_id" value="2171">
    <input type="hidden" id="find_point" value="0">

    <!--ヘッダーのインクルード-->
    <%@ include file="../common/header.jsp" %>



    <!--     <p class="bike_phot_top_Block">
            <img src="[バイクの写真]" alt="[タイトル]画像" class=bike_phot_top>
    </p> -->

    <div class="serch_fc">
        <table class="table_FC_show_block">
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
                                <p class="FC_show">平均燃費<p>
                                        <p class="FC_show"><span id="fc_ave"></span>km/L<p>
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
                                <p>👑<span id="fc_max_user">名無し</span>さん<p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p class="FC_show"><span id="fc_max"></span> km/L<p>
                            </td>
                        </tr>
                    </table>
        </table>

        <form method="POST" action="/bikeNenpi/FC_Regist">
            <div class="regist_fc_in_fc_show">
                <p id="please_fc_regist"></p>
                <input type="submit" id="fc_regist_btn" class="btn_submit" value="燃費を投稿する">
            </div>
            <input type="hidden" id="" name="fc_regist_process_flg" value="8">
            <input type="hidden" id="bId" name="bike_id" value="">
            <input type="hidden" id="bName" name="bike_name" value="">
        </form>

        <div id="fc_block">

        </div>

        <div class="more_fc">
            <input type="button" id="more_fc_btn" class="btn_submit" value="さらに読み込む">
        </div>
    </div>

    <small class="attention">*1:今月燃費が登録されていない場合、直近の燃費が表示されます。</small>

    <!--footerのインクルード-->
    <%@ include file="../common/footer.jsp" %>



</body></html>
