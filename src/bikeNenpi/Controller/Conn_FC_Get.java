/*    */ package bikeNenpi.Controller;
/*    */ import java.io.IOException;

/*    */ import javax.servlet.RequestDispatcher;
/*    */ import javax.servlet.ServletException;
/*    */ import javax.servlet.annotation.WebServlet;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;
/*    */ import javax.servlet.http.HttpSession;

/*    */
/*    */ import bikeNenpi.BEANS.Bean_UserInfo;
/*    */ import bikeNenpi.DB.DAO_GetUserInfo;
/*    */
/*    */
/*    */
/*    */
/*    */
/*    */
/*    */ @WebServlet({"/FC_Get"})
/*    */ public class Conn_FC_Get
/*    */ {
/*    */   protected void doPost(HttpServletRequest request, HttpServletResponse response)
/*    */     throws ServletException, IOException
/*    */   {
/* 25 */     HttpSession session = request.getSession();
/* 26 */     Bean_UserInfo Bean_User = new Bean_UserInfo();
/*    */
/* 28 */     String Input_mail_add = request.getParameter("mail_address");
/* 29 */     String Input_password = request.getParameter("password");
/*    */
/* 31 */     Bean_User = DAO_GetUserInfo.UserInfoGet(Input_mail_add, Input_password);
/*    */
/*    */
/* 34 */     if (Bean_User != null) {
/* 35 */       if ((Bean_User.getMail_add().equals(Input_mail_add)) && (Bean_User.getPassword().equals(Input_password))) {
/* 36 */         session.setAttribute("LoginUserData", Bean_User);
/* 37 */         System.out.println("ログイン成功です。");
/*    */       }
/*    */       else {
/* 40 */         System.out.println("ログイン失敗です。");
/* 41 */         RequestDispatcher dispatcher =
/* 42 */           request.getRequestDispatcher("/contents/Login/login_input.jsp");
/* 43 */         dispatcher.forward(request, response);
/*    */       }
/*    */     }
/*    */     else {
/* 47 */       System.out.println("ログイン失敗です。");
/* 48 */       RequestDispatcher dispatcher =
/* 49 */         request.getRequestDispatcher("/contents/Login/login_input.jsp");
/* 50 */       dispatcher.forward(request, response);
/*    */     }
/*    */   }
/*    */ }


/* Location:              C:\Users\yuta\Desktop\backup\bckup\WEB-INF\classes\!\bikeNenpi\Controller\Conn_FC_Get.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       0.7.1
 */