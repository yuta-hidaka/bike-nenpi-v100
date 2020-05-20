<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bikeNenpi.BEANS.Bean_BikeInfo"%>
<%@page import="bikeNenpi.UTILs.Exchanger"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>


<! DOCTYPE html>
<html>
<head>



    <meta charset="UTF-8">

<!--スマホで見やすいように準備します。↓-->
    <meta name="viewport" content="width=device-width , initial-scale=1">

    <title>バイク燃費.com-メーカーから探す-</title>
<!--    googleFontのWebFontをimport-->
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+JP" rel="stylesheet">

<link rel="stylesheet" href="/bikeNenpi/css/layout2.css">
<link rel="stylesheet" href="/bikeNenpi/css/headerBarCss.css">
<script src="/bikeNenpi/js/jquery-3.3.1.min.js"></script>

<%@ include file="../common/google.adsence.html"%>
</head>

<body><!--ページの中央部分-->
<!--ヘッダーのインクルード-->
<%@ include file="../common/header.jsp" %>




<h2 class=PageTitle_login><br/><br/>-国から探す-</h2>
<!--

    <div class="regist_comp"><h2　class="regist_comp">ご登録ありがとうございます！
        <br/></h2></div>
-->


<div class="serch_fc">
    <table class="table_serch_maker">

       <!--------------------------------test---------------------------------->
        <tr>
            <td colspan="2">
                <p class="country_name">生産国を選択してください</p>
            </td>
        </tr>

        <%

		List<Bean_BikeInfo> list = new ArrayList<>();

    	list=(List<Bean_BikeInfo>)request.getAttribute("list");
 	    //System.out.println((list.size()));

 	   Bean_BikeInfo blank = new Bean_BikeInfo();

 	   list.add(blank);
    	double b = Math.ceil(list.size()/2);
    	int c = (int)b*2;
    	String cName = "";


    	for(int i=0 ; i < list.size()-1 ; i++){

    		if(cName.equals(list.get(i).getCountry_name())){
    			//System.out.println(i);
    			//System.out.println("test-equal");
        		if(cName.equals(list.get(i+1).getCountry_name())){
        			//System.out.println("next same");
        			%>
        	        <tr>
        	            <td class="search_maker_td">
        	                <form action="../../FC_Regist"method="post">
        	                <input type="hidden" name="maker_id" value="<%=list.get(i).getMaker_id() %>">
        	                <input type="submit" value="<%=list.get(i).getMaker_name_jp() %>" class="serch_maker">
        	                <input type="hidden"  name="fc_regist_process_flg" value="7" id="find">
        	                </form>
        	            </td>
        	            <td class="search_maker_td">
        	                <form action="../../FC_Regist"method="post">
        	                <input type="hidden" name="maker_id" value="<%=list.get(i+1).getMaker_id() %>">
        	                <input type="submit" value="<%=list.get(i+1).getMaker_name_jp() %>" class="serch_maker">
        	                <input type="hidden"  name="fc_regist_process_flg" value="7" id="find">
        	                </form>
        	            </td>
        	        </tr>
        	<%
        	i++;

        		}else{	//System.out.println("next not same first");
        	        %>


                 		<tr>
        	            <td class="search_maker_td">
        	                <form action="../../FC_Regist"method="post">
        	                <input type="hidden" name="maker_id" value="<%=list.get(i).getMaker_id() %>">
        	                <input type="submit" value="<%=list.get(i).getMaker_name_jp() %>" class="serch_maker">
        	                <input type="hidden"  name="fc_regist_process_flg" value="7" id="find">
        	                </form>
        	            </td>
        	            <td class="search_maker_td">
        	            </td>
        	        </tr>


        	<%

        		}


    		}else{
    			%>


    	<tr>
            <td colspan=2 class="search_maker_td">
                <form action="/bikeNenpi/FC_Regist"method="post">
                <input type="hidden" name="maker_id" value="<%=list.get(i).getCountry_id() %>">
                <input type="submit" value="<%=list.get(i).getCountry_name() %>" class="serch_maker">
                <input type="hidden"  name="fc_regist_process_flg" value="4" id="find">
                </form>
            </td>
            <td class="search_maker_td">
            </td>
        </tr>

        	<%
        		if(list.get(i).getCountry_name().equals(list.get(i+1).getCountry_name())){
        			//System.out.println("test");
        			%>

        	        <tr>
        	            <td class="search_maker_td">
        	                <form action="/bikeNenpi/FC_Regist"method="post">
        	                <input type="hidden" name="maker_id" value="<%=list.get(i).getMaker_id() %>">
        	                <input type="submit" value="<%=list.get(i).getMaker_name_jp() %>" class="serch_maker">
        	                <input type="hidden"  name="fc_regist_process_flg" value="7" id="find">
        	                </form>
        	            </td>
        	            <td class="search_maker_td">
        	                <form action="/bikeNenpi/FC_Regist"method="post">
        	                <input type="hidden" name="maker_id" value="<%=list.get(i+1).getMaker_id() %>">
        	                <input type="submit" value="<%=list.get(i+1).getMaker_name_jp() %>" class="serch_maker">
        	                <input type="hidden"  name="fc_regist_process_flg" value="7" id="find">
        	                </form>
        	            </td>
        	        </tr>
        	<%i++;
        	}else{	//System.out.println("next is not same con");
    	        %>


         		<tr>
	            <td class="search_maker_td">
	                <form action="/bikeNenpi/FC_Regist"method="post">
	                <input type="hidden" name="maker_id" value="<%=list.get(i).getMaker_id() %>">
	                <input type="hidden"  name="fc_regist_process_flg" value="7" id="">
	                <input type="submit" value="<%=list.get(i).getMaker_name_jp() %>" class="serch_maker">

	                </form>
	            </td>
	            <td class="search_maker_td">
	            </td>
	        </tr>



    			<%
        	}

    		}

    	       cName = list.get(i).getCountry_name();
    	}
%>

    </table>
</div>


    <!--footerのインクルード-->
<%@ include file="../common/footer.jsp" %>





    </body>
</html>