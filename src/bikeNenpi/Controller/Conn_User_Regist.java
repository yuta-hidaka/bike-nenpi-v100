/*     */ package bikeNenpi.Controller;
/*     */ import java.io.IOException;

/*     */ import javax.servlet.RequestDispatcher;
/*     */ import javax.servlet.ServletException;
/*     */ import javax.servlet.annotation.WebServlet;
/*     */ import javax.servlet.http.HttpServlet;
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import javax.servlet.http.HttpServletResponse;
/*     */ import javax.servlet.http.HttpSession;

/*     */
/*     */ import bikeNenpi.BEANS.Bean_UserInfo;
import bikeNenpi.DB.DAO_GetUserInfo;
/*     */ import bikeNenpi.DB.DAO_GetUserInfoByMail;
/*     */ import bikeNenpi.DB.DAO_User_Resist;
/*     */
/*     */
/*     */
/*     */
/*     */ @WebServlet({"/UserRegist"})
/*     */ public class Conn_User_Regist
/*     */   extends HttpServlet
/*     */ {
/*     */   protected void doPost(HttpServletRequest request, HttpServletResponse response)
/*     */     throws ServletException, IOException
/*     */   {

/*  28 */     HttpSession session = request.getSession();
session.setMaxInactiveInterval(-1);
/*  29 */     Bean_UserInfo Bean_Input_User = new Bean_UserInfo();
/*  30 */     Bean_UserInfo Bean_Get_User = new Bean_UserInfo();
/*     */
/*     */
/*  33 */     Bean_Input_User.setMail_add(request.getParameter("mail_address"));
/*  34 */     Bean_Input_User.setPassword(request.getParameter("password"));
/*  35 */     Bean_Input_User.setUser_name(request.getParameter("nickname"));
/*     */

/*  39 */
/*     */
/*     */
/*  42 */     switch (Integer.parseInt(request.getParameter("regist_process_flg")))
/*     */     {
/*     */     case 0:
/*  45 */       System.out.println("case:0");
/*     */
/*  47 */       Bean_Get_User = DAO_GetUserInfoByMail.MailexistenceCheck(Bean_Input_User.getMail_add());
/*  48 */       System.out.println("受け取りUnamae" + Bean_Input_User.getUser_name());
/*     */
/*  50 */       if (Bean_Get_User.getMail_add() == null || Bean_Get_User.getMail_add().isEmpty())
/*     */       {
/*  52 */         request.setAttribute("Bean_Input_User", Bean_Input_User);
/*  53 */         RequestDispatcher dispatcher =
/*  54 */           request.getRequestDispatcher("/contents/regist/regist_input2.jsp");
/*  55 */         dispatcher.forward(request, response);
/*     */       }
/*     */       else {
/*  58 */         System.out.println("mailが重複しています");
/*  59 */         request.setAttribute("Bean_Input_User", Bean_Input_User);
/*  60 */         RequestDispatcher dispatcher =
/*  61 */           request.getRequestDispatcher("/contents/regist/regist_input1.jsp");
/*  62 */         dispatcher.forward(request, response);
/*     */       }
/*  64 */       break;
/*     */     case 1:
/*  66 */       System.out.println("case:1");
/*  67 */       request.setAttribute("Bean_Input_User", Bean_Input_User);
/*  68 */       RequestDispatcher dispatcher =
/*  69 */         request.getRequestDispatcher("/contents/regist/regist_input1.jsp");
/*  70 */       dispatcher.forward(request, response);
/*  71 */       break;
/*     */     case 2:
/*  73 */       System.out.println("case:2");
/*     */
/*     */
/*     */
/*  77        String Input_birthday_year = request.getParameter("birthday_year");
  78        String Input_birthday_month = request.getParameter("birthday_month");
  79        String Input_birthday_day = request.getParameter("birthday_day");*/
///*  80 */       Bean_Input_User.setBirthday(Input_birthday_year + "-" + Input_birthday_month + "-" + Input_birthday_day);
System.out.println(request.getParameter("birthday"));
/*  80 */       Bean_Input_User.setBirthday(request.getParameter("birthday"));
/*  81 */       Bean_Input_User.setGender(Integer.parseInt(request.getParameter("gender")));
/*  82 */       Bean_Input_User.setUbike1(request.getParameter("bike1"));
/*  83 */       Bean_Input_User.setUbike2(request.getParameter("bike2"));
/*  84 */       Bean_Input_User.setAccept(Integer.parseInt(request.getParameter("accept")));
/*     */ System.out.println("Accept" + request.getParameter("accept"));
/*  86 */       request.setAttribute("Bean_Input_User", Bean_Input_User);
/*  87 */       RequestDispatcher dispatcher1 =
/*  88 */         request.getRequestDispatcher("/contents/regist/regist_check.jsp");
/*  89 */       dispatcher1.forward(request, response);
/*  90 */       break;
/*     */     case 3:
/*  92 */       System.out.println("case:3");
/*     */
/*     */
/*  95 */       Bean_Input_User.setBirthday(request.getParameter("birthday"));
/*     */
/*     */
/*  98 */       Bean_Input_User.setGender(Integer.parseInt(request.getParameter("gender")));
/*  99 */       Bean_Input_User.setUbike1(request.getParameter("bike1"));
/* 100 */       Bean_Input_User.setUbike2(request.getParameter("bike2"));
/* 102 */       Bean_Input_User.setAccept(Integer.parseInt(request.getParameter("accept")));
System.out.println("Accept" + request.getParameter("accept"));
	/* 107 */         DAO_User_Resist.UserRegist(Bean_Input_User);
	Bean_Input_User = DAO_GetUserInfo.UserInfoGet(Bean_Input_User.getMail_add(), Bean_Input_User.getPassword());
	/*     */
/* 112 */       session.setAttribute("LoginUserData", Bean_Input_User);

/* 113 */       RequestDispatcher dispatcher2 =
/* 114 */         request.getRequestDispatcher("/contents/regist/regist_complete.jsp");
/* 115 */       dispatcher2.forward(request, response);
/* 116 */       break;
/*     */     case 4:
/* 118 */       System.out.println("case:4");
/*     */
/*     */
/*     */
/*     */
/*     */
/* 124 */       Bean_Input_User.setBirthday(request.getParameter("birthday"));
/*     */
/*     */
/* 127 */       System.out.println(Bean_Input_User.getBirthday());
/*     */
/* 129 */       Bean_Input_User.setGender(Integer.parseInt(request.getParameter("gender")));
/* 130 */       Bean_Input_User.setUbike1(request.getParameter("bike1"));
/* 131 */       Bean_Input_User.setUbike2(request.getParameter("bike2"));
/* 132 */       Bean_Input_User.setAccept(Integer.parseInt(request.getParameter("accept")));
/*     */
/*     */
/* 135 */       request.setAttribute("Bean_Input_User", Bean_Input_User);
/*     */
/* 137 */       RequestDispatcher dispatcher3 =
/* 138 */         request.getRequestDispatcher("/contents/regist/regist_input2.jsp");
/* 139 */       dispatcher3.forward(request, response);
/*     */     }
/*     */   }
/*     */ }


/* Location:              C:\Users\yuta\Desktop\backup\bckup\WEB-INF\classes\!\bikeNenpi\Controller\Conn_User_Regist.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       0.7.1
 */