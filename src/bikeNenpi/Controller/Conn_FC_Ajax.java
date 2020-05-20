/*    */ package bikeNenpi.Controller;
import java.io.File;
/*    */
/*    */ import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
/*    */ import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
/*    */ import javax.servlet.http.HttpServlet;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import bikeNenpi.BEANS.Bean_BikeInfo;
import bikeNenpi.BEANS.Bean_FCInfo;
import bikeNenpi.DB.DAO_FC_Get_MaxAve;
import bikeNenpi.DB.DAO_Get_BikeList;
import bikeNenpi.DB.DAO_Get_FcList;
/*    */
/*    */
			@WebServlet({"/FC_Find_A"})

/*    */ public class Conn_FC_Ajax
/*    */   extends HttpServlet
/*    */ {
/*    */   private static final long serialVersionUID = 1L;
/*    */
/*    */
/*    */   protected void doPost(HttpServletRequest request, HttpServletResponse response)
/*    */     throws ServletException, IOException
/*    */   {


	System.out.println(request.getParameter("jsonTodo"));

	String JsonData = request.getParameter("jsonTodo");
	ObjectMapper mapper = new ObjectMapper();

	 Bean_FCInfo info = new Bean_FCInfo();



		//取得したJSONデータをBean情報にマッピングしていBy＝JacSon
	 info = mapper.readValue(JsonData,Bean_FCInfo.class);


	 int processFlg = info.getProcess_flg();
	 int bike_id = info.getBike_id();
	 int findPoint = info.getFindPoint();
	 int fc_id = info.getFc_id();
	 int fc_good = info.getFc_good();
	 int user_id = info.getUser_id();
	 int model_year = info.getModel_year();
	 String date = info.getDate_time();
	 String photPass = info.getP_pass();
	 System.out.println("find");
	 Bean_FCInfo infoGot = new Bean_FCInfo();
	 Bean_FCInfo maxAve = new Bean_FCInfo();
     List<Bean_FCInfo> InfoList = new ArrayList<>();
     System.out.println("find");


     String json = "";



     switch(processFlg){



     case 0:
        maxAve = DAO_FC_Get_MaxAve.FC_Get_MaxAve(bike_id);
        json = mapper.writeValueAsString(maxAve);
    	 break;

     case 1:

    	 InfoList = DAO_Get_FcList.FcFind(bike_id, findPoint);
    	 json = mapper.writeValueAsString(InfoList);

    	 break;

     case 2:

    	 DAO_Get_FcList.updateFcGood(fc_id , fc_good);

    	 break;

     case 3:
    	 System.out.println("user_id:::"+user_id);
    	 System.out.println("FP:::"+findPoint);
    	 InfoList = DAO_Get_FcList.FcFindbyUserId(user_id, findPoint);
    	 json = mapper.writeValueAsString(InfoList);
    	 break;

     case 4:

    	 DAO_Get_FcList.deleteFc(fc_id);
    	 System.out.println("test");
    	 photPass = photPass.replaceFirst("/bikeNenpi/", "");

    	 ServletContext servletContext = getServletConfig().getServletContext();
    	 photPass = servletContext.getRealPath("/") + photPass;
    	 File file = new File(photPass);

    	 if (file.exists()){
        	 System.out.println("test");
    	     file.delete();
    	 }else{

    	 }

    	 json = mapper.writeValueAsString(InfoList);
    	 break;

     case 5:
    	 System.out.println("user_id:::"+user_id);
    	 System.out.println("FP:::"+findPoint);
    	 List<Bean_BikeInfo> bikeList = new ArrayList<>();
    	 bikeList = DAO_Get_BikeList. Get_BikeByUserId(user_id, findPoint);
    	 json = mapper.writeValueAsString(bikeList);
    	 break;


     case 6:
    	 System.out.println("user_id:::"+user_id);
    	 System.out.println("FP:::"+findPoint);
    	 List<Bean_FCInfo> fcList = new ArrayList<>();
    	 fcList = DAO_Get_FcList.FcFindDate( bike_id, user_id, date,model_year);
    	 json = mapper.writeValueAsString(fcList);
    	 break;
     }

  response.setContentType("application/json;charset=UTF-8");

 PrintWriter out = response.getWriter();



   out.print(json);


//	ObjectMapper mapper = new ObjectMapper();
//
//	 BufferedReader br = new BufferedReader( request.getReader() );
//
////	 String strJson = (String)request.getParameter("json");
//
//
//	 String jsonText = br.readLine();
//	 Bean_BikeInfo info = new Bean_BikeInfo();
//	 info = mapper.readValue(strJson,Bean_BikeInfo.class);
//
//	 System.out.println(br);
//	 System.out.println(jsonText.);


     //. JSON オブジェクトに変換
//     JSONParser parser = new JSONParser();
//     jsonObject jsonObj = ( jsonObject )parser.parse( jsonText );


//	System.out.println(request.getReader());
///* 49 */     String responseJson = "{\"responseMessage\" : \"サーブレットからの返信です\"}";
///* 50 */     response.setContentType("application/json;charset=UTF-8");
///* 51 */     PrintWriter out = response.getWriter();
///* 52 */     out.print(responseJson);
/*    */   }
/*    */ }


/* Location:              C:\Users\yuta\Desktop\backup\bckup\WEB-INF\classes\!\bikeNenpi\Controller\Test.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       0.7.1
 */