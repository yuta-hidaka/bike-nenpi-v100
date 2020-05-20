package bikeNenpi.Filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bikeNenpi.BEANS.Bean_UserInfo;

public class LoginFilter
  implements Filter
{
  public void destroy() {}

  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
    throws IOException, ServletException
  {

	  System.out.println("Login_フィルター");
    request.setCharacterEncoding("UTF-8");

    response.setContentType("text/html;charset=UTF-8");

    System.out.println("ログインフィルターを動かします。");
    HttpSession session= (HttpSession)((HttpServletRequest)request).getSession();


    System.out.println();





if((Bean_UserInfo)session.getAttribute("LoginUserData") == null){

	  String url = "/bikeNenpi/index.jsp";
	  ((HttpServletResponse)response).sendRedirect(url);

}else{


}

    chain.doFilter(request, response);
  }

  public void init(FilterConfig fConfig)
    throws ServletException
  {}
}
