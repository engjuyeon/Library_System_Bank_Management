<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="./font.css">
<meta charset="UTF-8">
<title>권한 로그인</title>
</head>
<body>
	<jsp:include page="menu.jsp" flush="false"/>
	
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<div class="text-right">
					<h1 class="display-3">권한 로그인<br></h1>
				</div>
			</div>
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">권한이 필요합니다</h3>
			<%
				String error = request.getParameter("error");
				if(error != null){
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해주세요");
					out.println("</div>");
				}
			%>
			<form name="fr" class="form-signin" action="j_security_check" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">ID</label>
					<input type="text" class="form-control" placeholder="ID" id="id" name='j_username' required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="Password" name='j_password'required>
			</div>
			<button class="btn btn btn-lg btn-outline-dark btn-block" type="submit">로그인</button>
			</form>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>