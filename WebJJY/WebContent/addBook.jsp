<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="accessNoPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="./font.css">

<script type="text/javascript" src="./resources/js/validation.js"></script>
<meta charset="UTF-8">
<title>도서 등록</title>

</head>
<body>
	<jsp:include page="menu.jsp" />
	
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<div class="text-right">
					<h1 class="display-3">도서 등록</h1>
					<div class="text-right">				
				<a href="./logout.jsp" class="btn btn-sm btn-outline-dark pull-right">Admin Logout</a><br><br>
			</div>
				</div>
			</div>
		</div>
	</div>
	<form name="newBook" action="./processAddBook.jsp" 
		class="form-horizontal" method="post" enctype="multipart/form-data" >
		<div class="container">
			<div class="form-group row">
				<label class="col-sm-2">도서 코드</label>
				<div class="col-sm-3">
					<input type="text" id="id" name="id" class="form-control" >
				</div>
			</div>
				<div class="form-group row">
				<label class="col-sm-2">도서명</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control" >
				</div>
			</div>
		<!-- <div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control" >
				</div>
			</div> -->
			<div class="form-group row">
				<label class="col-sm-2">상세 정보</label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2" class="form-control" ></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">출판사</label>
				<div class="col-sm-3">
					<input type="text" id="publisher" name="publisher" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">저자명</label>
				<div class="col-sm-3">
					<input type="text" id="author" name="author" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">재고 수</label>
				<div class="col-sm-3">
					<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상태</label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New">
					신규 제품
					<input type="radio" name="condition" value="Old">
					중고 제품
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-5">
					<input type="file" name="bookImage" class="form-control" >
				</div>
			</div>	
			<div class="text-right">
				<input type="submit" class="btn btn-outline-dark" value="등록">
			</div>
		</form>
		<hr>
		</div>
	<jsp:include page="footer.jsp" flush="false"/>	
</body>
</html>