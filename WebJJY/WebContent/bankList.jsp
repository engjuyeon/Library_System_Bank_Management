<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BankDTO"%>
<%@ page import="java.sql.*" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	List bankList = (List) request.getAttribute("banklist");
	int total_record = ((Integer) request.getAttribute("total_record")).intValue();
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	int total_page = ((Integer) request.getAttribute("total_page")).intValue();
	//int num = ((Integer) request.getAttribute("num")).intValue();
	//int nowpage = ((Integer) request.getAttribute("page")).intValue();
%>
<html>
<head>
<link rel="stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="./font.css">
<title>Board</title>
 <script type="text/javascript">
	function checkForm() {	
		if (${sessionId==null}) {
			alert("로그인 해주세요.");
			return false;
		}

		location.href = "./BankWriteForm.jy?id=<%=sessionId%>"
	}
</script> 
</head>
<body>
	<jsp:include page="bankmenu.jsp" flush="false"/>
	<div class="container" style="text-align: right;">
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">입출금 내역</h1>
		</div>
	</div>
	</div>
	<div class="container">
		<form action='<c:url value="./BankListAction.jy"/>' method="post">
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<th>번호</th>
						<th>  </th>
						<th>계좌번호</th>
						<th>타입</th>
						<th>날짜</th>
						<th>메모</th>
						<th>금액</th>
						<th> </th>
					</tr>                                                                                                                      
				
					<%
						for (int j = 0; j < bankList.size(); j++) {
							BankDTO notice = (BankDTO) bankList.get(j);
					%>
					<tr>
						<td><%=notice.getNum()%></td>
						<td><a href="./BankViewAction.jy?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"></a></td>
						<td><%=notice.getAccount()%></td>
						<td><%=notice.getAcc_type()%></td>
						<td><%=notice.getAcc_date()%></td>
						<td><%=notice.getRamark()%></td>
						<td><%=notice.getBalance()%></td>
						
						<form name="newUpdate" action="BankUpdateForm.jy?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"class="form-horizontal" method="post">
						<c:set var="userId" value="<%=sessionId%>" />
							<c:if test="${sessionId==userId}">
							<p>
							<td><a	href="./BankDeleteAction.jy?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>""	class="btn btn-outline-dark"> 삭제</a> </td>
							</c:if>
						</form>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<!-- 	<div align="center">
			<c:set var="pageNum" value="<%=pageNum%>" />
				<c:forEach var="i" begin="1" end="<%=total_page%>">
					<a href="<c:url value="./BankListAction.jy?pageNum=${i}" /> ">
						<c:choose>
							<c:when test="${pageNum==i}">
								<font color='4C5317'><b> [${i}]</b></font>
							</c:when>
							<c:otherwise>
								<font color='4C5317'> [${i}]</font>

							</c:otherwise>
						</c:choose>
					</a>
				</c:forEach>
			</div> 
			<div align="left">
				<table>
					<tr>
						<td width="100%" align="left">&nbsp;&nbsp; 
						<select name="items" class="txt">
								<option value="account">계좌</option>
								<option value="type">type</option>
						</select> <input name="text" type="text" /> <input type="submit" id="btnAdd" class="btn btn-primary " value="검색 " />
						</td>
					</tr>
					
				</table>
			</div>-->
		</form>
		<hr>
	</div>
	<jsp:include page="bankfooter.jsp" flush="false"/>
</body>
</html>
