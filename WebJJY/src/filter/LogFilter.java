package filter;

import javax.servlet.*;
import javax.servlet.http.*;
import util.Util;
import java.util.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.IOException;

public class LogFilter implements Filter {
	

	  public void init(FilterConfig filterConfig) throws ServletException {

	  System.out.println("JUYEON Books 초기화...");
	}

	  public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException 
	  {
		System.out.println(" 접속한 클라이언트 IP : " + request.getRemoteAddr());
		long start = System.currentTimeMillis();
		System.out.println(" 접근한 URL 경로 : " + getURLPath(request));
		System.out.println(" 요청 처리 시작 시각 : " + getCurrentTime());
		filterChain.doFilter(request, response);

		long end = System.currentTimeMillis();
		System.out.println(" 요청 처리 종료 시각 : " + getCurrentTime());
		System.out.println(" 요청 처리 소요 시각 : " + (end-start) + "ms ");
		System.out.println("=============================================================");
	  }

	  private String getURLPath(ServletRequest request) {
		// TODO Auto-generated method stub
		HttpServletRequest req;
		String currentPath="";
		String queryString="";
		if(request instanceof HttpServletRequest) {
			req = (HttpServletRequest)request;
			currentPath = req.getRequestURI();
			queryString = req.getQueryString();
			queryString = queryString == null ? "" : "?" + queryString;
		}
		return currentPath+queryString;
	}

	public void destroy( ) {
	  }

	  private String getCurrentTime() {
	    DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	    Calendar calendar = Calendar.getInstance();
	    calendar.setTimeInMillis(System.currentTimeMillis());
	    return formatter.format(calendar.getTime());
	  }

}
