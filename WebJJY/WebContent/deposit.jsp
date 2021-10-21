<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
    
 <%

 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
	String timestamp = formatter.format(new java.util.Date());
%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="./font.css">
<meta charset="UTF-8">
<title>입금</title>
</head>
<body>
<jsp:include page="bankmenu.jsp" />
		<div class="container" style="text-align: right;">
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">입금</h1>
		</div>
	</div>
	</div>
		<div class="container">
		<form name="newWrite" action="./BankWriteAction.jy"
			class="form-horizontal" method="post" onsubmit="return checkForm()">
			<input name="mid" type="hidden" class="form-control"
				value="${sessionId}">
			<div class="form-group row">
				<label class="col-sm-2 control-label" >계좌번호</label>
				<div class="col-sm-3">
					 <select name="acc" size="1">
    					 <option value="" selected></option>
						      <%@include file="./dbconn.jsp" %>
						     <%
						      // db에서 정보 얻어와 테이블에 출력하기
						      try {
						       String sql = "SELECT acc_no FROM account GROUP BY acc_no ORDER BY acc_no";
						       pstmt = conn.prepareStatement(sql);
						       rs = pstmt.executeQuery();
						       while (rs.next()) {
						        String acc_no = rs.getString("acc_no");
						     %>
						     <option value=<%=acc_no%>><%=acc_no%></option>
						     <%
						      }
						      } catch (SQLException se) {
						       System.out.println(se.getMessage());
						      } finally {
						       try {
						        if (rs != null)
						         rs.close();
						        if (pstmt != null)
						         pstmt.close();
						        if (conn != null)
						         conn.close();
						       } catch (SQLException se) {
						        System.out.println(se.getMessage());
						       }
						
						      }
						     %>
						 </select>
						 </div>
						 </div>
					<input name="type" value="deposit" type="hidden" class="form-control" readonly>	
			<div class="form-group row">
				<label class="col-sm-2 control-label" >금액</label>
				<div class="col-sm-8">
					<input name="balance" class="form-control"
						placeholder="금액">
				</div>
				</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >날짜</label>
				<div class="col-sm-8">
					<input name="date" class="form-control" placeholder="date" value="<%=timestamp%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >메모</label>
				<div class="col-sm-8">
					<textarea name="ramark" cols="50" rows="5" class="form-control"
						placeholder="메모"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
				 <input type="submit" class="btn btn btn-outline-dark " value="등록 ">				
					 <input type="reset" class="btn btn btn-dark " value="취소 ">
				</div>
			</div>
		</form>
		<hr>
	</div>
	<jsp:include page="bankfooter.jsp" />
</body>
</html>