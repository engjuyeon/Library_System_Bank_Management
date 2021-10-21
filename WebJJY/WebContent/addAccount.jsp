<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="./font.css">

<script type="text/javascript">
	function checkForm() {
		if (!document.newAccount.acc_no.value) {
			alert("계좌번호를 입력하세요.");
			return false;
		}

		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
</script>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/jjydb?serverTimezone=UTC&characterEncoding=utf8"
	driver="com.mysql.cj.jdbc.Driver" user="jjy" password="0431"  />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM member WHERE mid=?
   <sql:param value="<%=sessionId%>" />
</sql:query>	
<title>계좌 생성</title>
</head>
<body>
	<jsp:include page="bankmenu.jsp" />
		<div class="container" style="text-align: right;">
			<div class="jumbotron">
			<div class="container" >
				<h1 class="display-3">계좌 생성</h1>
			</div>
		</div>
	</div>

	<div class="container">
		<form name="newAccount" class="form-horizontal"  action="processAddAccount.jsp" method="post" onsubmit="return checkForm()">
			<div class="form-group  row">
				<label class="col-sm-2 ">아이디</label>
				<div class="col-sm-3">
					<input name="mid" type="text" class="form-control" value="<%=sessionId%>" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2 ">계좌번호</label>
				<div class="col-sm-3">
					<input name="acc_no" type="text" maxlength="13" class="form-control" placeholder="계좌번호" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">고객번호</label>
				<div class="col-sm-3">
					<input name="cus_no" type="text" class="form-control" maxlength="11" placeholder="고객번호" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">은행</label>
				<div class="col-sm-3">
						<select name="bankname">
						<option value="">은행</option>
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
						<option value="">은행지점</option>
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
					<input name="name" type="text" class="form-control" placeholder="이름" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">자기 잉크 문자 인식</label>
				<div class="col-sm-3">
					<input type="text" name="micr" placeholder="자동생성" readonly > 
				</div>
			</div>
			<div class="form-group  row ">
				<label class="col-sm-2">인도 금융 시스템 코드</label>
				<div class="col-sm-3">
					<input type="text" name="ifsc" maxlength="11">
				</div>				
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">한도</label>
				<div class="col-sm-3">
					<input name="minum" type="text" class="form-control" placeholder="한도" >

				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2 ">금액</label>
				<div class="col-sm-3">
					<input name="balance" type="text" class="form-control" placeholder="금액">

				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >메모</label>
				<div class="col-sm-8">
					<textarea name="ramark" cols="50" rows="5" class="form-control"
						placeholder="메모"></textarea>
				</div>
			</div>
			<div class="text-right">
				<input type="submit" class="btn btn-outline-dark" value="등록">
				<input type="reset" class="btn btn-dark " onclick="location='bankmain.jsp'" value="취소 ">
			</div>
		</form>
	</div>
	<jsp:include page="bankfooter.jsp"/>
</body>
</html>