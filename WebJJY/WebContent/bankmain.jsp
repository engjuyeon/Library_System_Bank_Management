<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="./font.css">
<title>BANK</title>
</head>

<style>

A:link {text-decoration:none; color:black;}
A:visited {text-decoration:none; color:black;}
A:hover {text-decoration:none; color:black;}

</style>

</head>
<body>
	
	<jsp:include page="bankmenu.jsp" flush="false"/>
	
	<div class="container">
		<div class="jumbotron">
			<div class="container">
					<div class="text-right"><h1 class="display-3">은행 메인페이지입니다.</h1><br></div>
						<div class="text-right">
						</div>
			</div>
		</div>
	</div>
	<jsp:include page="bankfooter.jsp" flush="false"/>	
</body>
</html>


