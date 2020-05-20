package bikeNenpi.Filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Access_filter
  implements Filter
{
  public void destroy() {}

  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
    throws IOException, ServletException
  {

	  System.out.println("Accessフィルター");
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
    chain.doFilter(request, response);
  }

  public void init(FilterConfig fConfig)
    throws ServletException
  {}
}
