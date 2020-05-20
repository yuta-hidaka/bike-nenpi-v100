/*    */ package bikeNenpi.Controller;
/*    */ import java.io.IOException;

/*    */ import javax.servlet.RequestDispatcher;
/*    */ import javax.servlet.ServletException;
/*    */ import javax.servlet.annotation.WebServlet;
/*    */ import javax.servlet.http.HttpServlet;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;
/*    */ import javax.servlet.http.HttpSession;

/*    */
/*    */ import bikeNenpi.BEANS.Bean_UserInfo;
/*    */ import bikeNenpi.DB.DAO_GetUserInfo;
/*    */
/*    */
/*    */
/*    */ @WebServlet({"/LoginCheck"})
/*    */ public class Conn_LoginCheck
/*    */   extends HttpServlet
/*    */ {
/*    */   protected void doPost(HttpServletRequest request, HttpServletResponse response)
/*    */     throws ServletException, IOException
/*    */   {
/* 24 */     HttpSession session = request.getSession();
session.setMaxInactiveInterval(-1);
/* 25 */     Bean_UserInfo Bean_User = new Bean_UserInfo();
/*    */
/* 27 */     String Input_mail_add = request.getParameter("mail_address");
/* 28 */     String Input_password = request.getParameter("password");
/*    */
/* 30 */     Bean_User = DAO_GetUserInfo.UserInfoGet(Input_mail_add, Input_password);
/* 31 */     System.out.println(Bean_User.getPassword());
/*    */
/* 33 */     if (Bean_User != null) {
/* 34 */       if ((Bean_User.getMail_add().equals(Input_mail_add)) && (Bean_User.getPassword().equals(Input_password))) {
/* 35 */         session.setAttribute("LoginUserData", Bean_User);
/* 36 */         RequestDispatcher dispatcher =
/* 37 */           request.getRequestDispatcher("/index.jsp");
/* 38 */         dispatcher.forward(request, response);
/*    */       }
/*    */       else {
/* 41 */         RequestDispatcher dispatcher =
/* 42 */           request.getRequestDispatcher("/contents/Login/login_input.jsp");
/* 43 */         dispatcher.forward(request, response);
/*    */       }
/*    */     }
/*         else {
 47        RequestDispatcher dispatcher =
 48          request.getRequestDispatcher("/contents/Login/login_input.jsp");
 49        dispatcher.forward(request, response);
         }*/
/*    */   }
/*    */ }


/* Location:              C:\Users\yuta\Desktop\backup\bckup\WEB-INF\classes\!\bikeNenpi\Controller\Conn_LoginCheck.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       0.7.1
 */