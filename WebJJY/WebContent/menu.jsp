<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<html>
<head>

<script type="text/javascript" src="./resources/js/validation.js?ver=01"></script>
<link rel="stylesheet" href="./font.css">
<style>
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

div.logo {
	display: flex;
	justify-content: center;
	text-align: center;	
    padding: 10px;
   
}
div.mid {
	display: flex;
	justify-content: center;
	text-align: center;	
    padding: 10px;
}
table.abc {
	width: 900px;
	border-collapse: collapse;
	text-align:center;
}


A:link {text-decoration:none; color:black;}
A:visited {text-decoration:none; color:black;}
A:hover {text-decoration:none; color:black;}

</style>


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
							<li><a href='<c:url value="/cart.jsp"/>' style="color: black"><img src="/uploads/jjy/cart.png" style="width: 15px; height: 15px">대여 바구니</a></li>
						</c:when>
						<c:otherwise>
							<li style="color: black; cursor:default">[<%=sessionId%>님]</li>
							<li><a href="<c:url value="/logoutMember.jsp"/>" style="color: black">로그아웃 </a></li>
							<li><a href='<c:url value="/updateMember.jsp"/>' style="color: black">회원 수정</a></li>
							<li><a href='<c:url value="/cart.jsp"/>' style="color: black"><img src="/uploads/jjy/cart.png" style="width: 15px; height: 15px">대여 바구니</a></li>
						</c:otherwise>
				</c:choose>
			</ul>
	</div>
		
	<div class="logo">
		<table class="abc">
		<tr><td>
		<a href="./index.jsp" ><img src="/uploads/jjy/logo.png"  /></a>
		</td>

		</tr>
	</table
	></div>
		<div class="container"><hr></div>
	<div class="mid">
		<table>
				<ul>
					<c:choose>
					<c:when test="${empty sessionId}">
			<td>
				<div class="dropdown"><button class="dropbtn">주연 도서 관리 사이트</button>
				<div class="dropdown-content">
					<a href="./introduction.jsp">소개</a>
					<!-- <a href="#">공지사항</a> -->
				</div></div>
			</td>
		
			<td>
				<div class="dropdown"><button class="dropbtn">도서목록</button>
				<div class="dropdown-content">
					<a href="./books.jsp">전체도서</a>
					<a href="./newBooks.jsp">신간도서</a>
					<a href="./oldBooks.jsp">중고도서</a>
				</div></div>
			</td>

			<td>
				<div class="dropdown"><button class="dropbtn">도서관리</button>
				<div class="dropdown-content">
					<a href="./addBook.jsp">도서등록</a>
					<a href="./editBook.jsp?edit=update">도서수정</a>
					<a href="./editBook.jsp?edit=delete">도서삭제</a>
				</div></div>
			</td>

 			<td>
				<div class="dropdown"><button class="dropbtn">커뮤니티</button>
				<div class="dropdown-content">
					<a href="<c:url value="/BoardListAction.do?pageNum=1" />">도서 추천</a>
				</div></div>
			</td>
			<td>
				<div class="dropdown"><button class="dropbtn">문의하기</button>
				<div class="dropdown-content">
					<a href="mailto:04ju30@sunmoon.ac.kr">MAIL문의</a>
				</div></div>
			</td> 
			</c:when>
				<c:otherwise>
					<td>
				<div class="dropdown"><button class="dropbtn">주연 도서 관리 사이트</button>
				<div class="dropdown-content">
					<a href="./introduction.jsp">소개</a>
					<!-- <a href="#">공지사항</a> -->
				</div></div>
			</td>
		
			<td>
				<div class="dropdown"><button class="dropbtn">도서목록</button>
				<div class="dropdown-content">
					<a href="./books.jsp">전체도서</a>
					<a href="./newBooks.jsp">신간도서</a>
					<a href="./oldBooks.jsp">중고도서</a>
				</div></div>
			</td>

			<td>
				<div class="dropdown"><button class="dropbtn">도서관리</button>
				<div class="dropdown-content">
					<a href="./addBook.jsp">도서등록</a>
					<a href="./editBook.jsp?edit=update">도서수정</a>
					<a href="./editBook.jsp?edit=delete">도서삭제</a>
				</div></div>
			</td>

 			<td>
				<div class="dropdown"><button class="dropbtn">커뮤니티</button>
				<div class="dropdown-content">
					<a href="<c:url value="/BoardListAction.do?pageNum=1" />">도서 추천</a>
				</div></div>
			</td>
			<td>
				<div class="dropdown"><button class="dropbtn">문의하기</button>
				<div class="dropdown-content">
					<a href="mailto:04ju30@sunmoon.ac.kr">MAIL문의</a>
				</div></div>
			</td> 
					<td>
						<div class="dropdown"><button class="dropbtn"><a href="./bankmain.jsp">은행</button></div>
					
					</td>
					</c:otherwise>
					</c:choose>
				</ul>
		</table>
	</div>
</body>
</html>