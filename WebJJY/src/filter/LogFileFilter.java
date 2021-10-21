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

public class LogFileFilter implements Filter{
	
	 
	
	PrintWriter writer;

	public void init(FilterConfig filterConfig) throws ServletException {
		  

	    // 이부분을 수정해주세요.
	    // String filename = filterConfig.getInitParameter("filename");    // web.xml에서 정의된 파라미터
		  String filename;
		  boolean isWindows = System.getProperty("os.name").toLowerCase().startsWith("windows");
		  if(isWindows) filename = "c://uploads/monitor.log";                           // 윈도우일경우
		  else filename = "/var/lib/tomcat9/webapps/uploads/jjy/monitor.log";    // 우분투 일경

		  if(filename==null) throw new ServletException("로그 파일의 이름을 찾을 수 없습니다.");
	      try {
	            writer = new PrintWriter(new FileWriter(filename, true), true);
	      } catch (IOException e) {
	    	  	throw new ServletException("로그 파일을 열 수 없습니다.");
	      }
	}
	  	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException 
	{
		  writer.printf("현재일시 : %s %n",  getCurrentTime());
		  writer.println(" 접속한 클라이언트 IP : " + request.getRemoteAddr());
		  long start = System.currentTimeMillis();
		  writer.println(" 접근한 URL 경로 : " + getURLPath(request));
		  writer.println(" 요청 처리 시작 시각 : " + getCurrentTime());
		
		  filterChain.doFilter(request, response);

		  long end = System.currentTimeMillis();
		  String contentType = response.getContentType();
		  writer.printf("문서의 콘텐츠 유형 : %s %n", contentType);
		  writer.println(" 요청 처리 종료 시각 : " + getCurrentTime());
		  writer.println(" 요청 처리 소요 시각 : " + (end-start) + "ms ");
		  writer.println("=============================================================");
	    
	}


	public void destroy( ) {
		  writer.close();
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
	private String getCurrentTime() {
		  DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		  Calendar calendar = Calendar.getInstance();
		  calendar.setTimeInMillis(System.currentTimeMillis());
		  return formatter.format(calendar.getTime());
	}
}
