<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<%@ page import="util.Util"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고도서</title>

<link rel="stylesheet"
	href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="./font.css">
</head>
<body>
	<jsp:include page="menu.jsp"/>
	
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<div class="text-right">
					<h1 class="display-3">중고도서</h1>
						<p>중고도서는 서고에 들어온지 일주일이 지난 도서입니다</p>
				</div>
			</div>
		</div>
	</div>
	<%
	BookRepository dao = BookRepository.getInstance();
		ArrayList<Book> listOfBooks = dao.getAllBooks();
	%>
	<div class="container">
		<div class="row" align="center">
		<%@include file="dbconn.jsp" %>
			<%
				String sql = "SELECT * FROM product WHERE b_condition = 'old'";
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
	<jsp:include page="footer.jsp"/>
</body>
</html>