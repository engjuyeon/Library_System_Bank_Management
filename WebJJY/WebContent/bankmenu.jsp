<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<html>
<head>

<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="./font.css">
<style>

div.topmenu {
	padding: 10px 10px 0 40px;
	height: 24px;
	text-align: left;
	font-size: 1em;
	color: white;
	background-color: rgb(255, 255, 255);
	margin: 0;
	padding: 10px 50px 0 40px;
}

ul{
	text-align:left;
	 position: absolute;
	 
}
li{list-style-type: none;
 	padding: 5px 0px 5px 5px;
    margin-bottom: 5px;
    border-bottom: 1px solid #efefef;
    font-size: 12px;}

.dropbtn {
	  background-color: white;
	  color: black;
	  padding: 16px;
	  font-size: 16px;
	  border: none;
	  text-align: center;	
}

.dropdown {
  position: relative;
  display: inline-block;
  text-align: center;	
}

.dropdown-content {
  display: none;
  text-align: center;	
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
  cursor: pointer;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: center;	
}

.dropdown-content a:hover {background-color: #cfcccd;}
.dropdown:hover .dropdown-content {display: block;}
.dropdown:hover .dropbtn {background-color: #ddd;}
	
div.mid {
	display: flex;
	justify-content: center;
	text-align: center;	
    padding: 10px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- Top Menu -->
	<div class="topmenu">
	
		<p style="color:black"> <%
				Date day = new java.util.Date();
				response.setIntHeader("Refresh",5);
				String am_pm;
				int hour=day.getHours(); 
				int minute=day.getMinutes(); 
				if(hour/12==0){
					am_pm="AM";
				}else{
					am_pm="PM";
					hour = hour-12;
				}
				String CT = am_pm+ " " + hour + "시 " + minute + "분";
				out.print(" 현재 시간 " + CT);
				%>
			</p>
			<ul>
				<c:choose>
						<c:when test="${empty sessionId}">
							<li><a href="<c:url value="/loginMember.jsp"/>" style="color: black">로그인 </a></li>
							<li><a href='<c:url value="/addMember.jsp"/>' style="color: black">회원 가입</a>
						</c:when>
						<c:otherwise>
							<li style="color: black; cursor:default" >[<%=sessionId%>님]</li>
							<li><a href="<c:url value="/logoutMember.jsp"/>" style="color: black">로그아웃 </a></li>
							<li><a href='<c:url value="/updateMember.jsp"/>' style="color: black">회원 수정</a></li>
							<li><a href='<c:url value="/index.jsp"/>' style="color: black">도서 관리 사이트로</a></li>
						</c:otherwise>
				</c:choose>
			</ul>
	</div>
<div class="container"><hr></div>
	<div class="mid">
		<table>
		
			<td>
				<div class="dropdown"><button class="dropbtn"><a href="./bankmain.jsp" style="color:black; text-decoration-line:none;">Main</button>
				</div>
			</td>
			
			<td>
				<div class="dropdown"><button class="dropbtn"><a href="./addAccount.jsp" style="color:black; text-decoration-line:none;">계좌 생성</button>
				</div>
			</td>
			
			<td>
				<div class="dropdown"><button class="dropbtn" style="color:black; text-decoration-line:none;">계좌 관리</button>
				<div class="dropdown-content">
					<a href="./updateAccount.jsp"> 계좌 수정</a>
					<a href="<c:url value="/BankListAction.jy?pageNum=1" />"> 입출금,이체 내역</a>

				</div></div>
			</td>
			<td>
				<div class="dropdown"><button class="dropbtn"><a href="./deposit.jsp" style="color:black; text-decoration-line:none;">입금</a></button>
			</div>
			</td>
			<td>
				<div class="dropdown"><button class="dropbtn"><a href="./withdraw.jsp" style="color:black; text-decoration-line:none;">출금</a></button>
			</div>
			</td>
			<td>
				<div class="dropdown"><button class="dropbtn"><a href="./transfer.jsp" style="color:black; text-decoration-line:none;">이체</a></button>
			</div>
			</td>
	
		</table>
	</div>
</body>
</html>