<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<%@ page import="util.Util"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet"
	href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="./font.css">

<meta charset="UTF-8">
<title>주연 도서 관리 사이트</title>
<style>

A:link {text-decoration:none; color:black;}
A:visited {text-decoration:none; color:black;}
A:hover {text-decoration:none; color:black;}

</style>

</head>
<body>
	
	<jsp:include page="menu.jsp" flush="false"/>
	
	<div class="container">
		<div class="jumbotron">
			<div class="container">
					<div class="text-right"><h1 class="display-3">어서오세요!<br>처음 방문하셨습니까?</h1><br></div>
						<div class="text-right">	
							<p> <a href="./introduction.jsp" class="btn btn-outline-dark" 
							role="button">주연 도서 관리 사이트 소개&raquo;</a></p>
						</div>
			</div>
		</div>
	</div>
	
		<%
		int count = 0;
		BookRepository dao = BookRepository.getInstance();
		ArrayList<Book> listOfBooks = dao.getAllBooks();
	%>
	
	
	<div class="container">
		<a href="./newBooks.jsp" target="blank"><h3>신간 도서</h3></a>
			<br>
			<div class="row" align="center">
					<%@include file="dbconn.jsp" %>
			<%
				String sql = "SELECT * FROM product WHERE b_condition = 'new'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
				%>
			<div class="col-md-4">
				<img src="/uploads/jjy/<%=rs.getString("b_fileName")%>" style="width: 100%; height: 400px">
				<h3><%=rs.getString("b_name")%></h3>
				<p><%=rs.getString("b_author") %><br><%=rs.getString("b_publisher") %></p>
				<p> <a href="./book.jsp?id=<%=rs.getString("b_id")%>"
				class="btn btn-outline-dark" rs="button">상세 정보 &raquo;</a>
			</div>
			
			<%
				}
				if (rs != null)
					rs.close();
	 			if (pstmt != null)
	 				pstmt.close();
	 			if (conn != null)
					conn.close();
			%>
			
		</div>
		<hr>
	</div>

	
	<jsp:include page="footer.jsp" flush="false"/>	

</body>
</html>