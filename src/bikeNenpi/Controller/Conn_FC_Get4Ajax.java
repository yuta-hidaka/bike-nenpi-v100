/*    */ package bikeNenpi.Controller;
/*    */
/*    */ import java.io.IOException;

/*    */ import javax.servlet.ServletException;
/*    */ import javax.servlet.annotation.WebServlet;
/*    */ import javax.servlet.http.HttpServlet;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import bikeNenpi.BEANS.Bean_FCInfo;
/*    */
/*    */
/*    */
/*    */ @WebServlet({"/FC_show"})
/*    */ public class Conn_FC_Get4Ajax
/*    */   extends HttpServlet
/*    */ {
/*    */   private static final long serialVersionUID = 1L;
/*    */
///*    */   protected void doGet(HttpServletRequest request, HttpServletResponse response)
///*    */     throws ServletException, IOException
///*    */   {
///* 37 */     response.getWriter().append("Served at: ").append(request.getContextPath());
///*    */   }
/*    */
/*    */
/*    */
/*    */
/*    */
/*    */
/*    */
/*    */   protected void doPost(HttpServletRequest request, HttpServletResponse response)
/*    */     throws ServletException, IOException
/*    */   {


	System.out.println(request.getParameter("jsonTodo"));

	String JsonData = request.getParameter("jsonTodo");
	System.err.println("1");
	ObjectMapper mapper = new ObjectMapper();

	System.err.println("2");
	 Bean_FCInfo info = new Bean_FCInfo();

		System.err.println("3");
	 info = mapper.readValue(JsonData,Bean_FCInfo.class);

	 System.out.println(info.getBike_id());
	 System.out.println(info.getFindPoint());



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