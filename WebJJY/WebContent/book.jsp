<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<%@ page import="util.Util"%> 
<%@ page errorPage="exceptionNoBookId.jsp" %>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="./font.css">
<meta charset="UTF-8">
<title>상세 정보</title>
<script type="text/javascript">
	function addToCart(){
		if (confirm("이 도서를 대여 바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		} else{
			document.addForm.reset();
		}
	}
</script>
<style>


body {
	margin: 0;
	padding:0;
}

</style>

</head>
<body>
	<jsp:include page="menu.jsp"/>
	
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<div class="text-right">
					<h1 class="display-3">도서 정보</h1>
				</div>
			</div>
		</div>
	</div>
	<%
		String id = request.getParameter("id");
		BookRepository dao = BookRepository.getInstance();
		Book product = dao.getBookById(id);
	%>
	
	<div class="container">
		<div class="row" align="center">
			<div class="col-md-4">
				<img src="/uploads/jjy/<%=product.getFilename()%>" style="width: 100%; height: 400px">
			</div>
			<div class="col-md-4">
				<h3><%=product.getBname()%></h3>
				<p><%=product.getDescription()%>
				<p> <b>도서 코드 : </b><span class="badge badge-danger">
					<%=product.getBookId()%></span>
				<p> <b>출판사</b> : <%=product.getPublisher()%>
				<p> <b>저자명</b> : <%=product.getAuthor()%>
				<p> <b>재고 수</b> : <%=product.getUnitsInStock()%>
				<p> <form name="addForm" action="./addCart.jsp?id=<%=product.getBookId()%>" method="post">
				<a href="#" class="btn btn-outline-secondary" onclick="addToCart()">도서 대여 &raquo;</a>
				<a onClick="history.back()" class="btn btn-outline-dark">도서 목록 &raquo;</a>
				</form>
			</div>
		</div>
	</div>
	
			<hr>
	<jsp:include page="footer.jsp" />
</body>
</html>