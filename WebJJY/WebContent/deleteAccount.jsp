<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	String mid = (String) session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/jjydb?serverTimezone=UTC&characterEncoding=utf8"
	driver="com.mysql.cj.jdbc.Driver" user="jjy" password="0431"  />

<sql:update dataSource="${dataSource}" var="resultSet">
   DELETE FROM account WHERE mid = ?
   <sql:param value="<%=mid%>" />
</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="./resultAccount.jsp" />
</c:if>

