<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page  import="bikeNenpi.BEANS.Bean_UserInfo"%>

<! DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">

        <!--スマホで見やすいように準備します。↓-->
        <meta name="viewport" content="width=device-width , initial-scale=1">
        <title>バイク燃費.com</title>
        <!--    googleFontのWebFontをimport-->
        <link href="https://fonts.googleapis.com/css?family=Noto+Serif+JP" rel="stylesheet">
        <link rel="stylesheet" href="css/layout2.css">
        <link rel="stylesheet" href="css/headerBarCss.css">
        <script src="js/jquery-3.3.1.min.js"></script>
        <link rel="stylesheet" href="/bikeNenpi/css/iziModal.min.css">
        <link rel="stylesheet" href="/bikeNenpi/css/toastr.min.css">
        <link rel="stylesheet" href="/bikeNenpi/css/iziModal.min.css">
        <script src="/bikeNenpi/js/iziModal.min.js"></script>
<meta name="description" content='メーカー、バイクの種類を問わず、すべてのバイクの"燃費"だけを集めたウェブサイトです。ライダーの皆様で燃費を共有しょう！'>


        <!-- Global site tag (gtag.js) - Google Analytics -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-136344605-1"></script>
        <script src='//ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>

        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-136344605-1"></script>
        <script src="/bikeNenpi/js/iziModal.min.js"></script>
        <script src="/bikeNenpi/js/toastr.min.js"></script>

        <%@ include file="contents/common/mobile_icon.jsp" %>

        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
        <script>
            (adsbygoogle = window.adsbygoogle || []).push({
                google_ad_client: "ca-pub-8220669417943263",
                enable_page_level_ads: true,
                overlays: {
                    bottom: true
                }
            });

        </script>


    </head>

    <body>
        <!--ページの中央部分-->
        <!--ヘッダーのインクルード-->




        <script>
            window.dataLayer = window.dataLayer || [];

            function gtag() {
                dataLayer.push(arguments);
            }
            gtag('js', new Date());

            gtag('config', 'UA-136344605-1');

            $(document).ready(function() {



                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-center",
                    "preventDuplicates": false,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "1200",
                    "extendedTimeOut": "100",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }

                var session = false;
                var SessionId = $("#user_id").val();
                var loginFlg = 0;
                var btnPlace = 0;

                $("#regist_fc").on("click", function() {
                    btnPlace = 0;
                    loginCheck();
                });
                $("#regist_2fc").on("click", function() {
                    btnPlace = 1;
                    loginCheck();
                });

                function loginCheck() {

                    if ($("#user_id").val() == 0) {
                        $("#Message").removeClass("is-hide");
                        $("#Message").html("燃費の登録の前にログインをお願いします!");
                        loginFlg = 1;
                        $("#login").click();
                    } else {
                        window.location.href = "/bikeNenpi/contents/FcRegist/regist_top.jsp";
                    }
                }


                if (SessionId != 0) {
                    $("#logIn_li").addClass("is-hide");
                    $("#logOut_li").removeClass("is-hide");
                    $("#account_li").removeClass("is-hide");
                    $("#regist_user_li").addClass("is-hide");

                } else {
                    $("#logIn_li").removeClass("is-hide");
                    $("#logOut_li").addClass("is-hide");
                    $("#regist_user_li").removeClass("is-hide");
                    $("#account_li").addClass("is-hide");
                }

                $("#loginOut").on("click", function() {
                    $("#LogOut_submit").click();
                });

                //ログイン用のizi-modal設定
                $(".iziModal").iziModal({
                    headerColor: "rgba(5, 109, 21, 0.69)",
                    width: "400px",
                    height: "100%",
                    overlayColor: "rgba(0, 0, 0, 0.4)",
                    transitionIn: "fadeInUp",
                    transitionOut: "fadeOutDown",
                    onOpening: function() {
                        if (btnPlace === 0) {
                            $("#luxbar-hamburger").click();

                        }
                    },
                });

                /* 	  			$("#login").on("click",function(){
                 console.log("click");
                 $("#luxbar-hamburger").click();
                 }); */

                $("#login_btn").on("click", function() {
                    btnPlace = 0;
                    $("#eMessage").addClass("is-hide");
                    $("#Message").addClass("is-hide");
                    var mail = $("#mail_address").val();
                    var password = $("#password").val();

                    //リクエストJSON
                    var request = {
                        mail_add: mail,
                        password: password,
                        process_flg: 0
                    };

                    $.ajax({
                            type: "post",
                            url: "/bikeNenpi/account",
                            data: {
                                jsonTodo: JSON
                                    .stringify(request)
                            },
                            async: true,
                        })
                        .done(
                            function(data) {
                                if (data.errorCode === 1 || data.errorCode === 2) {
                                    $("#eMessage").removeClass("is-hide");

                                    switch (data.errorCode) {
                                        case 1:
                                            $("#eMessage").html("ログインできませんでした。<br/>メールアドレスまたはパスワードをもう一度ご確認ください。");
                                            break;
                                        case 2:
                                            $("#eMessage").html("所定のログイン回数をオーバーしました。<br>最終ログインから30分後に再度お試しください。");
                                            break;
                                    }


                                } else {
                                    if (loginFlg === 1) {
                                        location.href = '/bikeNenpi/contents/FcRegist/regist_top.jsp';
                                        location.click();
                                    }
                                    $("#logIn_li").addClass("is-hide");
                                    $("#logOut_li").removeClass("is-hide");
                                    $("#account_li").removeClass("is-hide");
                                    $("#regist_user_li").addClass("is-hide");
                                    $("#eMessage").addClass("is-hide");
                                    $("#loginName").html(data.user_name);
                                    $("#user_id").val(data.user_id);
                                    $("#user_name").val(data.user_name);
                                    $(".iziModal-button-close").click();
                                    SessionId = 1;
                                    session = true;

                                    var s = "おかえりなさい " + data.user_name + " さん！"
                                    //トースト表示
                                    Command: toastr["success"](s)


                                }

                            })
                        .fail(function() {

                        })
                        .always(
                            function(jqXHR,
                                textStatus) {
                                loginFlg === 0
                            });
                });

                $(".iziModal-button-close").on("click", function() {
                    console.log("test");
                    $("#eMessage").addClass("is-hide");
                    $("#Message").addClass("is-hide");
                });






            });

            function submit_logon(code) {
                //エンターキー押下なら
                if (13 === code) {
                    $("#login_btn").click();
                }
            }

        </script>


        <%
  //Sessionから受け取った戻り値の箱を作成します。
  	      Bean_UserInfo LoginUserData = new Bean_UserInfo();
        String LoginName;
        int LoginId = 0;

/*     @SuppressWarnings("unchecked") */
    LoginUserData=(Bean_UserInfo)session.getAttribute("LoginUserData");

if(LoginUserData == null){
    LoginName = "ゲスト";
    LoginId = 0;

}else{
    LoginName = LoginUserData.getUser_name();
    LoginId = LoginUserData.getUser_id();
}


    %>



        <div id="login_modal" style="display:none;">
            <p></p>
        </div>

        <header id="luxbar" class="luxbar-fixed">
            <input type="checkbox" class="luxbar-checkbox" id="luxbar-checkbox" />
            <div class="luxbar-menu luxbar-menu-right luxbar-menu-material-cyan">
                <ul class="luxbar-navigation">
                    <li class="luxbar-header">
                        <h2 class="title-top">
                            <a href="/bikeNenpi/index.jsp" class="luxbar-brand">バイク燃費.com</a></h2>
                        <label class="luxbar-hamburger luxbar-hamburger-doublespin" id="luxbar-hamburger" for="luxbar-checkbox"> <span></span> </label>
                    </li>
                    <li class="luxbar-item"><a href="/bikeNenpi/contents/FcFind/find_top.jsp">燃費を探す</a></li>
                    <li class="luxbar-item"><a href="#" id="regist_fc">燃費登録</a></li>
                    <li class="luxbar-item" id="logOut_li"><a href="#" id="loginOut">ログアウト</a></li>
                    <li class="luxbar-item" id="logIn_li"><a href="#" id="login" data-iziModal-open=".iziModal">ログイン</a>


                        <div class="modal_con">
                            <div class="iziModal" data-izimodal-title="ログイン">

                                <form class="form_login" action="">
                                    <p id="eMessage" class="is-hide"></p>
                                    <p id="Message" class="is-hide"></p>
                                    <p class="input_text_p">メールアドレス</p>
                                    <div class="input_text_block">
                                        <input type="text" name="mail_address" id="mail_address" class="input_text" onkeypress="submit_logon(event.keyCode);">
                                    </div>

                                    <p class="input_text_p">パスワード</p>

                                    <div class="input_text_block">
                                        <input type="password" name="password" id="password" class="input_text" onkeypress="submit_logon(event.keyCode);">
                                    </div>
                                    <input type="button" value="ログイン" id="login_btn" class="btn_submit">

                                    <p class="input_text_p2">
                                        <a href="/bikeNenpi/contents/Login/reset_.jsp" class="">パスワードを忘れた</a>
                                    </p>

                                    <p class="input_text_p2">または</p>

                                    <p class="input_text_p2">
                                        <a href="/bikeNenpi/contents/regist/regist_input1.jsp" class="">新規登録</a>
                                    </p>
                                </form>
                            </div>

                        </div>
                    </li>


                    <li class="luxbar-item" id="regist_user_li"><a href="/bikeNenpi/contents/regist/regist_input1.jsp">新規登録</a></li>
                    <li class="luxbar-item is-hide" id="account_li"><a href="/bikeNenpi/contents/account/account_top.jsp">アカウント</a></li>

                    <li class="luxbar-item"><a href="mailto:support@bike-nenpi.com?subject=問い合わせ&amp;body=ご記入ください">Contact</a></li>
                </ul>
            </div>
        </header>
        <div class="user-info-bar">
            <p class="user-name">ようこそ<%-- <a href="/servlet_crud/UpdateLoginUser?empId=<%=eId %>"> --%><span id="loginName"><%=LoginName %></span><!-- </a> --> さん</p>
        </div>
        <input type="hidden" name="user_id" id="user_id" value="<%=LoginId %>">
        <input type="hidden" name="user_name" id="user_name" value="<%=LoginName %>">

        <form action="/bikeNenpi/LogOut" class="is-hide" method="POST">
            <input type="submit" id="LogOut_submit" class="is-hide">
        </form>

        <div class="adsence">
            <%@ include file="contents/common/google.adsence.html" %>
        </div>

        <h2 class=PageTitle1>燃費を追い求める</h2>
        <h2 class=PageTitle2>全てのライダーへ。</h2>



        <div class="catchcopyBlock">
            <p class=catchcopy>
                メーカー、バイクの種類を問わず、<br />
                すべてのバイクの<label class="Nenpi">"燃費"</label>だけ<br />
                を集めたウェブサイトです。<br />
                ライダーの皆様で燃費を共有しょう！
            </p>
        </div>



        <p class="logoImgBlock"><img src="img/HPimg/topimg.png" alt="bikeNenpi.com" class=logoImg></p>

        <!--
    <div class="btn_index_block">
        <p class="btn_index"> <a href="#">燃費を探す</a></p>
        <p class="btn_index"><a href="#">燃費を登録</a></p>

    </div>
-->


        <table class="table_btn_index">
            <tr>
                <td class="btn_index">
                    <a href="contents/FcFind/find_top.jsp">燃費を探す</a>
                </td>
                <td class="btn_index">
                    <a href="#" id="regist_2fc">燃費を登録</a>
                </td>
            </tr>
        </table>


        <div id="bike_n">

        </div>

        <!--footerのインクルード-->
        <%@ include file="contents/common/footer.jsp" %>

    </body>

    </html>
