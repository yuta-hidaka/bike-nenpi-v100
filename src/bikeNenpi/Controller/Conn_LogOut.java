/*     */ package bikeNenpi.Controller;
/*     */ import java.io.IOException;

/*     */ import javax.servlet.ServletException;
/*     */ import javax.servlet.annotation.WebServlet;
/*     */ import javax.servlet.http.HttpServlet;
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import javax.servlet.http.HttpServletResponse;
/*     */ import javax.servlet.http.HttpSession;
/*     */
/*     */
/*     */
/*     */
/*     */ @WebServlet({"/LogOut"})
/*     */ public class Conn_LogOut
/*     */   extends HttpServlet
/*     */ {
/*     */   protected void doPost(HttpServletRequest request, HttpServletResponse response)
/*     */     throws ServletException, IOException
/*     */   {
	System.out.println("LogOUT");
	HttpSession session = request.getSession();
	System.out.println("ここ");
	session.invalidate();
	response.sendRedirect("/bikeNenpi/index.jsp");
	}
}


/* Location:              C:\Users\yuta\Desktop\backup\bckup\WEB-INF\classes\!\bikeNenpi\Controller\Conn_User_Regist.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       0.7.1
 */