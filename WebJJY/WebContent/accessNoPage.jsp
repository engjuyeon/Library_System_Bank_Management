<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="./font.css">
<meta charset="UTF-8">
<title>권한 오류</title>
</head>
<body>
	<jsp:include page="menu.jsp" flush="false"/>
	
		<div class="container">
			<div class="jumbotron">
				<div class="container">
					<h2 class="alert alert-danger">권한이 거부되었습니다.</h2>
				</div>
			</div>
			
			<div class="container">
				<div class="d-flex justify-content-start">
						<p> <a href="./logout.jsp" class="btn btn-outline-dark">logout&raquo;</a>
					        <a href="./index.jsp" class="btn btn-outline-dark">메인화면&raquo;</a>	
				</div>
			</div>
			<hr>
		</div>
	<jsp:include page="footer.jsp" flush="false"/>	
</body>
</html>