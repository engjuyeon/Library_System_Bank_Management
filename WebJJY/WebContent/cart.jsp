<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<%@ page errorPage="accessNoPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="./font.css">
<%
	String cartId = session.getId();
%>
<meta charset="UTF-8">
<style>

div. {
	display: flex;
	justify-content: center;
	text-align: center;	
    padding: 10px;
    border-bottom: 1px solid #D0D0D0;
}
</style>

<title>대여 바구니</title>
</head>
<body>
	<jsp:include page="menu.jsp" flush="false"/>
	
	<div class="container" style="text-align: right;">
		<div class="jumbotron">
			<div class="container">
				<div class="text-right">
					<h1 class="display-3">대여 바구니</h1>
					<div class="text-right">				
				<a href="./logout.jsp" class="btn btn-sm btn-outline-dark pull-right">User Logout</a><br><br>
			</div>
				</div>
			</div>
		</div>
	</div>		
	<div class="container">
		<div class="row">
		</div>
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>도서</th>
					<th>저자</th>
					<th>수량</th>
				 	<th>상태</th>
					<th>비고</th>
				</tr>
				<%
					int count = 0;
					ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
					if (cartList == null)
						cartList = new ArrayList<Book>();
					
					for (int i=0; i < cartList.size(); i++){
						Book book = cartList.get(i);
						count = book.getQuantity() + count;
				%>
				
				<tr>
					<td><%=book.getBookId() %> - <%=book.getBname() %></td>
					<td><%=book.getAuthor() %></td>
					<td><%=book.getQuantity() %> 권</td>
						<td><%=book.getCondition() %></td>	
					<td><a href="./removeCart.jsp?id=<%=book.getBookId() %>" class="badge badge-danger" style="color:white;">삭제</a></td>				
				</tr>
				<%
					}
				%>				
				<tr>
					<th></th>
					<th></th>
					<th>총 수량</th>
					<th><%=count %></th>
					<th></th>
				</tr>
			</table>
			
			
			<div class="container">
				<div class="d-flex justify-content-between">
					<div class="text-left">
						<a href="./books.jsp" class="btn btn-outline-dark"> &laquo; 도서 목록으로</a>
					</div>
				<div class="text-right">	
					 	<a href="./shippingInfo.jsp?cartId=<%=cartId %>" class="btn btn-dark" style="color:white;">대여하기</a></div> 
				</div>
				</div>
				<hr>
			</div>
		</div>
	<jsp:include page = "footer.jsp"/>
</body>
</html>