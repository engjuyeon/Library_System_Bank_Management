<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>도서 수정</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="container" style="text-align: right;">
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 수정</h1>
		</div>
	</div>
	</div>
	<%@ include file="dbconn.jsp"%>
	<%
		String bookId = request.getParameter("id");

		String sql = "select * from product where b_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bookId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="/uploads/jjy/<%=rs.getString("b_fileName")%>" alt="image"
					style="width: 100%; height: 400px" />
			</div>
			<div class="col-md-7">
				<form name="newProduct" action="./processUpdateBook.jsp"
					class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2">도서 코드</label>
							<div class="col-sm-3">
								<input type="text" id="id" name="id" class="form-control" 
								value='<%=rs.getString("b_id")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">도서명</label>
							<div class="col-sm-3">
								<input type="text" id="name" name="name" class="form-control"
								value="<%=rs.getString("b_name")%>">
						</div>
					</div>
		
					<div class="form-group row">
						<label class="col-sm-2">상세 설명</label>
						<div class="col-sm-5">
							<textarea name="description" cols="50" rows="2"
								class="form-control"><%=rs.getString("b_description")%></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">출판사</label>
						<div class="col-sm-3">
							<input type="text" name="publisher" class="form-control"
								value="<%=rs.getString("b_publisher")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">저자명</label>
						<div class="col-sm-3">
							<input type="text" name="author" class="form-control"
								value="<%=rs.getString("b_author")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">재고 수</label>
						<div class="col-sm-3">
							<input type="text" id="unitsInStock" name="unitsInStock"
								class="form-control" value="<%=rs.getLong("b_unitsInStock")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상태</label>
						<div class="col-sm-5">
							<input type="radio" name="condition" value="new "> 신규 제품 <input
								type="radio" name="condition" value="old"> 중고 제품 
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">이미지</label>
						<div class="col-sm-5">
							<input type="file" name="bookImage" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10 ">
							<input type="submit" class="btn btn-outline-dark" value="등록">
						</div>
					</div>
				</form>

			</div>
		</div>
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
 	<jsp:include page="footer.jsp" />
</body>
</html>
