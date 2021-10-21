<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import= "mvc.model.BankDTO"%>

<%
	BankDTO notice = (BankDTO) request.getAttribute("bank");
	int num = ((Integer) request.getAttribute("num")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	String sessionId = (String) session.getAttribute("sessionId");

%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="./font.css">
<title>Bank</title>
</head>
<body>
	<div class="container" style="text-align: right;">
 	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">입출금내역</h1>
		</div>
	</div>
	</div>

	<div class="container">
		<form name="newUpdate"
			action="BankUpdateAction.jy?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>"
			class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2 control-label" >계좌</label>
				<div class="col-sm-3">
					<input name="acc" class="form-control"	value=" <%=notice.getAccount()%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >type</label>
				<div class="col-sm-5">
					<input name="type" class="form-control"	value=" <%=notice.getAcc_type()%>" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >date</label>
				<div class="col-sm-8" style="word-break: break-all;">
					<input name="date" class="form-control" value="<%=notice.getAcc_date()%>"></input>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >메모</label>
				<div class="col-sm-8" style="word-break: break-all;">
					<textarea name="ramark" class="form-control"> <%=notice.getRamark()%></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >금액</label>
				<div class="col-sm-8" style="word-break: break-all;">
					<input name="balance" class="form-control"value="<%=notice.getBalance()%>"></input>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<c:set var="userId" value="<%=sessionId%>" />
					<c:if test="${sessionId==userId}">
						<p>
							<a	href="./BankDeleteAction.jy?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>"	class="btn btn-dark"> 삭제</a> 
							<input type="submit" class="btn btn-dark" value="수정 ">
					</c:if>
					<a href="./BankListAction.jy?pageNum=<%=nowpage%>"		class="btn-outline-dark"> 목록</a>
				</div>
			</div>
		</form>
		<hr>
	</div>
</body>
</html>


