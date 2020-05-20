/*    */ package bikeNenpi.Controller;
/*    */
/*    */ import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/*    */ import javax.servlet.ServletException;
/*    */ import javax.servlet.annotation.WebServlet;
/*    */ import javax.servlet.http.HttpServlet;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import bikeNenpi.BEANS.Bean_BikeInfo;
import bikeNenpi.DB.DAO_Get_BikeList;
/*    */
/*    */
/*    */
/*    */ @WebServlet({"/Bike_Find_A"})
/*    */ public class Conn_Bike_Ajax
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

	 Bean_BikeInfo info = new Bean_BikeInfo();

		//取得したJSONデータをBean情報にマッピングしていBy＝JacSon
	 info = mapper.readValue(JsonData,Bean_BikeInfo.class);

	 System.out.println(info.getProcess_flg());
	 System.out.println(info.getWord());


	 int processFlg = info.getProcess_flg();
	 String word = info.getWord();


     List<Bean_BikeInfo> InfoList = new ArrayList<>();
     String json = "";



     switch(processFlg){



     case 0:

    	 System.out.println(word);
    	 InfoList = DAO_Get_BikeList.Get_BikeByWord(word);
    	 System.out.println(InfoList.size());
         json = mapper.writeValueAsString(InfoList);

    	 break;

     case 1:

    	 break;

     case 2:

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