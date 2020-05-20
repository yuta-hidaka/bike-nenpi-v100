/*    */ package bikeNenpi.Controller;
import java.io.File;
/*    */
/*    */ import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
/*    */ import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
/*    */ import javax.servlet.http.HttpServlet;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import bikeNenpi.BEANS.Bean_UserInfo;
import bikeNenpi.DB.DAO_GetUserInfo;
import bikeNenpi.DB.DAO_GetUserInfoByMail;
import bikeNenpi.DB.DAO_User_Delete;
import bikeNenpi.DB.DAO_User_Update;
/*    */
/*    */
			@WebServlet({"/account"})

/*    */ public class Conn_Account_Ajax
/*    */   extends HttpServlet
/*    */ {
/*    */   private static final long serialVersionUID = 1L;
/*    */
/*    */
/*    */   protected void doPost(HttpServletRequest request, HttpServletResponse response)
/*    */     throws ServletException, IOException
/*    */   {

	 HttpSession session = request.getSession();
	 session.setMaxInactiveInterval(-1);
	String JsonData = request.getParameter("jsonTodo");
	System.out.println(JsonData);
	ObjectMapper mapper = new ObjectMapper();
	 Bean_UserInfo info = new Bean_UserInfo();
	 long defTime=0;
	 Date now = null;
	 //Date lastLogin;
     DateFormat format = new SimpleDateFormat("yyyy/MM/dd/HH:mm");
     String now_str = format.format(new Date());
     try {
		now =  format.parse(now_str);
	} catch (ParseException e) {
		e.printStackTrace();
	}

		//取得したJSONデータをBean情報にマッピングしていBy＝JacSon
	 info = mapper.readValue(JsonData,Bean_UserInfo.class);

	 System.out.println(info.getProcess_flg());
	 System.out.println(info.getPassword());
	 System.out.println(info.getMail_add());

	 int processFlg = info.getProcess_flg();
	 String InputMail =  info.getMail_add();
	 String InputPass = info.getPassword();
	 String InputBirthday = info.getBirthday();
	 int InputUserId = info.getUser_id();

	 Bean_UserInfo infoGot = new Bean_UserInfo();
	 Bean_UserInfo infoOut = new Bean_UserInfo();


     String json = "";
     System.out.println("logCheck");
     System.out.println("inputMainl:"+InputMail);
     System.out.println("inputPass:"+InputPass);
     System.out.println("inputBirthday:"+InputBirthday);
     System.out.println("flg:"+processFlg);


     switch(processFlg){
     case 0:
//メールとパスワードで検証
    	 infoGot = DAO_GetUserInfo.UserInfoGet(InputMail, InputPass);
//    	 System.out.println(infoGot.getMail_add());

    	 if(infoGot.getMail_add()==null){
    		 infoOut.setErrorCode(1);
    	 }else{

    		 if(infoGot.getLogin_date() == null){
    			 infoGot.setLogin_date(now_str);
    		 }

    		 try {
    			 defTime = (now.getTime() - format.parse(infoGot.getLogin_date()).getTime())/(1000*60);
    		 } catch (ParseException e) {
    			 e.printStackTrace();
//    			 System.out.println(e);
    		 }

    		 //時間が前回ログインから30分以上超えていたらフラグをリセット。
    		 if(defTime >= 30){
    			 infoGot.setLogin_flg(0);
    		 }

    			 if(infoGot.getLogin_flg() <= 5){
    				 if(InputPass.equals(infoGot.getPassword())){
    					 DAO_User_Update.LoginFlg(0, InputMail);
//    					 System.out.println("login succsess");
    					 infoOut = infoGot;
    					 session.setAttribute("LoginUserData", infoOut);
    				 }else{
    					 DAO_User_Update.LoginFlg((infoGot.getLogin_flg()+1), InputMail);;
    					 infoOut.setErrorCode(1);
    				 }
    			 }else{
    				 //System.out.println("所定の回数over");
    				 infoOut.setErrorCode(2);
    			 }
    	 }

    	 json = mapper.writeValueAsString(infoOut);



    	 break;

     case 1:

    	 infoGot = DAO_GetUserInfo.UserInfoGetByBirthday(InputMail, InputBirthday);
/*    	 System.out.println(infoGot.getMail_add());
    	 System.out.println(infoGot.getBirthday().equals(InputBirthday));
    	 System.out.println("gotB"+infoGot.getBirthday());
    	 System.out.println("IB"+InputBirthday);*/

    	//メールと誕生日が一致していたらパスワードを変更。
    	 infoGot = DAO_GetUserInfo.UserInfoGet(InputMail, InputPass);
    	 System.out.println(infoGot.getMail_add());

    	 if(infoGot.getMail_add()==null){
    		 infoGot.setErrorCode(1);
    	 }else{

    		 if(infoGot.getLogin_date() == null){
    			 infoGot.setLogin_date(now_str);
    		 }

        	 try {

        		 defTime = (now.getTime() - format.parse(infoGot.getLogin_date()).getTime())/(1000*60);

        	 } catch (ParseException e) {
        		 e.printStackTrace();
        		 System.out.println(e);
        	 }

        	 //時間が前回ログインから30分以上超えていたらフラグをリセット。
        	 if(defTime >= 30){
        		 infoGot.setLogin_flg(0);
        	 }


        	 if(infoGot.getLogin_flg() <= 5){
        		 if(infoGot.getBirthday().equals(InputBirthday)){
        			 //ログイン成功
//        			 System.out.println("ログイン成功");
        			 InputBirthday = InputBirthday.replaceAll("-", "");
        			 infoGot.setPassword(InputBirthday);
        			 DAO_User_Update.UserUpdate(infoGot);
        			 DAO_User_Update.LoginFlg(0, InputMail);

        		 }else{
//        			 System.out.println("メアドと生年月日が違う");
        			 DAO_User_Update.LoginFlg((infoGot.getLogin_flg()+1), InputMail);;
        			 infoOut.setErrorCode(1);
        		 }
        	 }else{
//        		 System.out.println("所定の回数over");
        		 infoOut.setErrorCode(2);
        	 }
    	 }

    	 json = mapper.writeValueAsString(infoOut);



    	 if(infoGot.getMail_add()!=null && infoGot.getBirthday().equals(InputBirthday)){
    	 }else{
    		 infoGot.setErrorCode(1);
    	 }

        json = mapper.writeValueAsString(infoOut);


    	 break;

     case 2:
    	 infoGot = DAO_GetUserInfo.UserInfoGetByUserId(InputUserId);
//    	 System.out.println("ユーザーネーム："+infoGot.getUser_name());
    	 infoOut = infoGot;

    	 json = mapper.writeValueAsString(infoOut);
    	 break;

     case 3:
    	 DAO_User_Update.UserUpdate(info);
    	 session.setAttribute("LoginUserData", info);
    	 json = mapper.writeValueAsString(infoOut);
    	 break;

     case 4:
    	 List<String> List = new ArrayList<>();
    	 DAO_User_Delete.UserDelete(InputUserId);
    	 List = DAO_User_Delete.GetPhotPass(InputUserId);

    	 for(String photPass : List){

    			if(photPass == "/bikeNenpi/img/NoPhot2.png"){
    				photPass  = "none";
    			}

        	 photPass = photPass.replaceFirst("/bikeNenpi/", "");
        	 ServletContext servletContext = getServletConfig().getServletContext();
        	 photPass = servletContext.getRealPath("/") + photPass;
        	 File file = new File(photPass);

        	 if (file.exists()){
        	     file.delete();
        	 }else{

        	 }

    	 }

    	 DAO_User_Delete.DeletePhotPass(InputUserId);
    	 infoOut.setProcess_flg(1);
    	 session.invalidate();
    	 json = mapper.writeValueAsString(infoOut);

    	 break;

     case 5:
    	 infoOut = DAO_GetUserInfoByMail.MailexistenceCheck(InputMail);

    	 if(infoOut.getMail_add() == null || infoOut.getMail_add() == "" || infoOut.getMail_add().isEmpty()){
    	 }else{
    		 infoOut.setErrorCode(1);
    	 }
    	 json = mapper.writeValueAsString(infoOut);
    	 break;

     }

     //取得したデータをJSONで返す
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