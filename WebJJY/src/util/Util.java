package util;

import javax.servlet.http.HttpServletRequest;

public class Util {

	  public static boolean isWindows = System.getProperty("os.name").toLowerCase().startsWith("windows");

	  // 프로젝트 폴더
	  public static String getProjectPath(HttpServletRequest request) {
	       return request.getSession().getServletContext().getRealPath("/");
	  }

	  // 서버IP:8080/프로젝트명/upload 폴더
	  public static String getUploadPath(HttpServletRequest request) {
	    if (isWindows)
	       return "c://uploads/"; //localhost
	    else
	       return "/var/lib/tomcat9/webapps/uploads/jjy/"; //ubontu server
	}
}