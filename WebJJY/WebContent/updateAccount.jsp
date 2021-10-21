<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="./font.css">
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/jjydb?serverTimezone=UTC&characterEncoding=utf8"
	driver="com.mysql.cj.jdbc.Driver" user="jjy" password="0431"  />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM account WHERE mid=?
   <sql:param value="<%=sessionId%>" />
</sql:query>	
<title>계좌 수정</title>
</head>
<body>

<jsp:include page="./bankmenu.jsp" />
	<div class="container" style="text-align: right;">
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">계좌 수정</h1>
		</div>
	</div>
	</div>
<c:if test="${empty sessionId}">
		<div class="container" style="text-align: right;">
		<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인을 해주세요</h1>
		</div>
	</div>
	</div>
 </c:if> <!-- collection 객체가 비어 있을 경우 --> 
 	<!--<c:if test="${empty acc_no}">
		<div class="container" style="text-align: right;">
		<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">계좌를 생성해주세요</h1>
		</div>
	</div>
	</div>
	</c:if>-->
	<c:forEach var="row" items="${resultSet.rows}">
	
	<div class="container">
		<form name="newMember" class="form-horizontal"
			action="processUpdateAccount.jsp" method="post"
			onsubmit="return checkForm()">
			<!-- <div class="form-group  row">
				<label class="col-sm-2 ">아이디</label>
				<div class="col-sm-3">
					<input name="mid" type="text" class="form-control" value="<c:out value='${row.mid }'/>" >
				</div>
			</div>-->
				<div class="form-group  row">
				<label class="col-sm-2 ">계좌번호</label>
				<div class="col-sm-3">
					<input name="acc_no" type="text" class="form-control" placeholder="계좌번호" value="<c:out value='${row.acc_no }'/>" readonly>
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">고객번호</label><!-- 은행이랑 지점만 변경 가능하게 -->
				<div class="col-sm-3">
					<input name="cus_no" type="text" class="form-control" placeholder="고객번호" value="<c:out value='${row.cus_no }'/>" readonly>
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">은행</label>
				<div class="col-sm-3">
						<select name="bankname">
						<option value="<c:out value='${row.bank }'/>">은행</option>
						<option value="001">한국</option>
						<option value="002">산업</option>
						<option value="003">기업</option>
						<option value="004">국민</option>
						<option value="007">수협</option>
						<option value="008">수출입</option>
						<option value="011">농협</option>
						<option value="012">지역농.축협</option>
						<option value="020">우리</option>
						<option value="023">SC제일</option>
						<option value="027">한국씨티</option>
						<option value="031">대구</option>
						</select>
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">은행지점</label>
				<div class="col-sm-3">
					<select name="bankbranch">
						<option value="<c:out value='${row.bankbranch }'/>">은행지점</option>
						<option value="02">서울</option>
						<option value="031">경기도</option>
						<option value="033">강원도</option>
						<option value="043">충청북도</option>
						<option value="041">충청남도</option>
						<option value="063">전라북도</option>
						<option value="061">전라남도</option>
						<option value="054">경상북도</option>
						<option value="055">경상남도</option>
						<option value="064">제주도</option>
					</select>
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">이름</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" placeholder="이름" value="<c:out value='${row.name }'/>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">자기 잉크 문자 인식</label>
				<div class="col-sm-4  ">
					<input type="text" name="micr" maxlength="9" placeholder="9자" size="6"value="<c:out value='${row.micr }'/>" readonly> 
				</div>
			</div>
			<div class="form-group  row ">
				<label class="col-sm-2">인도 금융 시스템 코드</label>
				<div class="col-sm-10">
					<input type="text" name="ifsc" maxlength="11" value="<c:out value='${row.ifsc }'/>" readonly>
				</div>				
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">한도</label>
				<div class="col-sm-3">
					<input name="minum" type="text" class="form-control" placeholder="최저금액" value="<c:out value='${row.minum }'/>" >

				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2 ">금액</label>
				<div class="col-sm-5">
					<input name="balance" type="text" class="form-control" placeholder="금액" value="<c:out value='${row.balance }'/>"  >

				</div>
			</div>
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-outline-dark" value="계좌수정 "> 
					<a href="deleteAccount.jsp" class="btn btn-dark">계좌삭제</a>
				</div>
			</div>
		</form>	
	</div>
	</c:forEach>
	
	<jsp:include page="bankfooter.jsp" />
</body>
</html>