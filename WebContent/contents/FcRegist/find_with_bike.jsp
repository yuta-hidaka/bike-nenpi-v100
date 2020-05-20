<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bikeNenpi.BEANS.Bean_BikeInfo"%>
<%@page import="bikeNenpi.UTILs.Exchanger"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>


<! DOCTYPE html>
<html>
<head>

<%@ include file="../common/google.adsence.html"%>

    <meta charset="UTF-8">

<!--スマホで見やすいように準備します。↓-->
    <meta name="viewport" content="width=device-width , initial-scale=1">

    <title>バイク燃費.com-バイク名検索-</title>
<!--    googleFontのWebFontをimport-->
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+JP" rel="stylesheet">

<link rel="stylesheet" href="/bikeNenpi/css/layout2.css">
<link rel="stylesheet" href="/bikeNenpi/css/headerBarCss.css">
<script src="/bikeNenpi/js/jquery-3.3.1.min.js"></script>
</head>

<body><!--ページの中央部分-->
<!--ヘッダーのインクルード-->
<%@ include file="../common/header.jsp" %>


<%		List<Bean_BikeInfo> list = new ArrayList<Bean_BikeInfo>();

list=(List<Bean_BikeInfo>)request.getAttribute("list"); %>

<h2 class=PageTitle_login><br/><br/>-<%=list.get(1).getMaker_name_jp() %>のバイク一覧-</h2>
<!--

    <div class="regist_comp"><h2　class="regist_comp">ご登録ありがとうございます！
        <br/></h2></div>
-->


<div class="serch_fc">
    <table class="table_serch_maker">

       <!--------------------------------test---------------------------------->
        <tr>
            <td colspan="2">
                <p class="country_name">バイクを選択してください</p>
            </td>
        </tr>

        <%


 	    //System.out.println((list.size()));

 	   Bean_BikeInfo blank = new Bean_BikeInfo();

 	   list.add(blank);
    	double b = Math.ceil(list.size()/2);
    	int c = (int)b*2;
    	String cName = "";


    	for(int i=0 ; i < list.size()-1 ; i++){

    		if(cName.equals(list.get(i).getEngine_displacement_area())){
    			//System.out.println(i);
    			//System.out.println("test-equal");
        		if(cName.equals(list.get(i+1).getEngine_displacement_area())){
        			//System.out.println("next same");
        			%>
        	        <tr>
        	            <td class="search_maker_td">
        	                <form action="/bikeNenpi/FC_Regist"method="post">
        	                <input type="hidden" name="bike_id" value="<%=list.get(i).getBike_id() %>">
        	                 <input type="hidden" name="bike_name" value="<%=list.get(i).getBike_name() %>">
        	                <input type="submit" value="<%=list.get(i).getBike_name() %>" class="serch_maker">
        	                <input type="hidden"  name="fc_regist_process_flg" value="8" id="find">
        	                </form>
        	            </td>
        	        <td class="search_maker_td">
        	                <form action="/bikeNenpi/FC_Regist"method="post">
        	                <input type="hidden" name="bike_id" value="<%=list.get(i+1).getBike_id() %>">
        	                <input type="hidden" name="bike_name" value="<%=list.get(i+1).getBike_name() %>">
        	                <input type="submit" value="<%=list.get(i+1).getBike_name() %>" class="serch_maker">
        	                <input type="hidden"  name="fc_regist_process_flg" value="8" id="find">
        	                </form>
        	            </td>
        	        </tr>
        	<%
        	i++;

        		}else{	//System.out.println("next not same first");
        	        %>


                 		<tr>
        	                <td class="search_maker_td">
        	                <form action="/bikeNenpi/FC_Regist"method="post">
        	                <input type="hidden" name="bike_id" value="<%=list.get(i).getBike_id() %>">
        	                <input type="hidden" name="bike_name" value="<%=list.get(i).getBike_name() %>">
        	                <input type="submit" value="<%=list.get(i).getBike_name() %>" class="serch_maker">
        	                <input type="hidden"  name="fc_regist_process_flg" value="8" id="find">
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
                <input type="hidden" name="eda_id" value="<%=list.get(i).getEngine_displacement_area_id() %>">
                 <input type="hidden" name="bike_name" value="<%=list.get(i).getBike_name() %>">
                <input type="submit" value="<%=list.get(i).getEngine_displacement_area() %>" class="serch_maker">
                <input type="hidden"  name="fc_regist_process_flg" value="4" id="find">
                </form>
            </td>
            <td class="search_maker_td">
            </td>
        </tr>

        	<%
        		if(list.get(i).getEngine_displacement_area().equals(list.get(i+1).getEngine_displacement_area())){
        			//System.out.println("test");
        			%>

     	        <tr>
        	            <td class="search_maker_td">
        	                <form action="/bikeNenpi/FC_Regist"method="post">
        	                <input type="hidden" name="bike_id" value="<%=list.get(i).getBike_id() %>">
        	                 <input type="hidden" name="bike_name" value="<%=list.get(i).getBike_name() %>">
        	                <input type="submit" value="<%=list.get(i).getBike_name() %>" class="serch_maker">
        	                <input type="hidden"  name="fc_regist_process_flg" value="8" id="find">
        	                </form>
        	            </td>
        	        <td class="search_maker_td">
        	                <form action="/bikeNenpi/FC_Regist"method="post">
        	                <input type="hidden" name="bike_id" value="<%=list.get(i+1).getBike_id() %>">
        	                <input type="hidden" name="bike_name" value="<%=list.get(i+1).getBike_name() %>">
        	                <input type="submit" value="<%=list.get(i+1).getBike_name() %>" class="serch_maker">
        	                <input type="hidden"  name="fc_regist_process_flg" value="8" id="find">
        	                </form>
        	            </td>
        	        </tr>
        	<%i++;
        	}else{
    	        %>


                 		<tr>
        	                <td class="search_maker_td">
        	                <form action="/bikeNenpi/FC_Regist"method="post">
        	                <input type="hidden" name="bike_id" value="<%=list.get(i).getBike_id() %>">
        	                <input type="submit" value="<%=list.get(i).getBike_name() %>" class="serch_maker">
        	                <input type="hidden"  name="fc_regist_process_flg" value="8" id="find">
        	                </form>
        	            </td>
        	            <td class="search_maker_td">
        	            </td>
        	        </tr>



    			<%
        	}

    		}

    	       cName = list.get(i).getEngine_displacement_area();
    	}
%>

    </table>
</div>


    <!--footerのインクルード-->
<%@ include file="../common/footer.jsp" %>





    </body>
</html>