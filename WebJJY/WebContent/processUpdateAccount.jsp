<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	request.setCharacterEncoding("UTF-8");

//String mid = request.getParameter("mid");
String acc_no = request.getParameter("acc_no");
String cus_no = request.getParameter("cus_no");
String bankname = request.getParameterValues("bankname")[0];
String bankbranch = request.getParameterValues("bankbranch")[0];
String name = request.getParameter("name");
//String micr = request.getParameter("micr");
String ifsc = request.getParameter("ifsc");
String micr = bankbranch + bankname + bankbranch;
String minum = request.getParameter("minum");
String balance = request.getParameter("balance");
String ramark = request.getParameter("ramark");

%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/jjydb?serverTimezone=UTC&characterEncoding=utf8"
	driver="com.mysql.cj.jdbc.Driver" user="jjy" password="0431"  />
<sql:update dataSource="${dataSource}" var="resultSet">
   UPDATE account SET acc_no=?, bank=?, branch=?, name=?, micr=?, ifsc=?, minum=?, balance=? WHERE cus_no=?
	<sql:param value="<%=acc_no%>" />
	<sql:param value="<%=bankname%>" />
	<sql:param value="<%=bankbranch%>" />
	<sql:param value="<%=name%>" />
	<sql:param value="<%=micr%>" />
	<sql:param value="<%=ifsc%>" />
	<sql:param value="<%=minum %>"/>
	<sql:param value="<%=balance %>"/>
	<sql:param value="<%=cus_no%>" />
</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="resultAccount.jsp?msg=0" />
</c:if>

