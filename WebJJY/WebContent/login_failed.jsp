<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="./font.css">
<meta charset="UTF-8">
<title>로그인 실패</title>
</head>
<body>
	<%
		response.sendRedirect("login.jsp?error=1");
	%>
</body>
</html>