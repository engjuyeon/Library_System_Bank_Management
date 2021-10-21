<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	request.setCharacterEncoding("UTF-8");

String mid = request.getParameter("mid");
	String acc_no = request.getParameter("acc_no");
	String cus_no = request.getParameter("cus_no");
	String bankname = request.getParameterValues("bankname")[0];
	String bankbranch = request.getParameterValues("bankbranch")[0];
	String name = request.getParameter("name");
	String ifsc = request.getParameter("ifsc");
	String micr = bankbranch + bankname + bankbranch;
	String minum = request.getParameter("minum");
	String balance = request.getParameter("balance");
	String remark = request.getParameter("ramark");

	Date currentDatetime = new Date(System.currentTimeMillis());
	java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
	java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/jjydb?serverTimezone=UTC&characterEncoding=utf8"
	driver="com.mysql.cj.jdbc.Driver" user="jjy" password="0431"  />

<sql:update dataSource="${dataSource}" var="resultSet">
   INSERT INTO account VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
   <sql:param value="<%=mid%>" />
   <sql:param value="<%=acc_no%>" />
	<sql:param value="<%=cus_no%>" />
	<sql:param value="<%=bankname%>" />
	<sql:param value="<%=bankbranch%>" />
	<sql:param value="<%=name%>" />
	<sql:param value="<%=micr%>" />
	<sql:param value="<%=ifsc%>" />
	<sql:param value="<%=minum%>" />
	<sql:param value="<%=balance%>" />
	<sql:param value="<%=remark%>" />
</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="resultAccount.jsp?msg=1" />
</c:if>

