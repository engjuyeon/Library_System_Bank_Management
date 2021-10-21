<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="./font.css">

<meta charset="UTF-8">
<title>페이지 오류</title>
</head>
<body>
<jsp:include page="menu.jsp" flush="false"/>
	
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<div class="text-right">
					<h2 class="alert alert-danger">요청하신 페이지를 찾을 수 없습니다.</h2>
				</div>
			</div>
		</div>
		<div class="container">
			<p> <a href="./index.jsp" class="btn btn-outline-dark">메인화면&raquo;</a>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" flush="false"/>	

</body>
</html>