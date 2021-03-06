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
				String CT = am_pm+ " " + hour + "??? " + minute + "???";
				out.print(" ?????? ?????? " + CT);
				%>
			</p>
			<ul>
				<c:choose>
						<c:when test="${empty sessionId}">
							<li><a href="<c:url value="/loginMember.jsp"/>" style="color: black">????????? </a></li>
							<li><a href='<c:url value="/addMember.jsp"/>' style="color: black">?????? ??????</a>
							<li><a href='<c:url value="/cart.jsp"/>' style="color: black"><img src="/uploads/jjy/cart.png" style="width: 15px; height: 15px">?????? ?????????</a></li>
						</c:when>
						<c:otherwise>
							<li style="color: black; cursor:default">[<%=sessionId%>???]</li>
							<li><a href="<c:url value="/logoutMember.jsp"/>" style="color: black">???????????? </a></li>
							<li><a href='<c:url value="/updateMember.jsp"/>' style="color: black">?????? ??????</a></li>
							<li><a href='<c:url value="/cart.jsp"/>' style="color: black"><img src="/uploads/jjy/cart.png" style="width: 15px; height: 15px">?????? ?????????</a></li>
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
				<div class="dropdown"><button class="dropbtn">?????? ?????? ?????? ?????????</button>
				<div class="dropdown-content">
					<a href="./introduction.jsp">??????</a>
					<!-- <a href="#">????????????</a> -->
				</div></div>
			</td>
		
			<td>
				<div class="dropdown"><button class="dropbtn">????????????</button>
				<div class="dropdown-content">
					<a href="./books.jsp">????????????</a>
					<a href="./newBooks.jsp">????????????</a>
					<a href="./oldBooks.jsp">????????????</a>
				</div></div>
			</td>

			<td>
				<div class="dropdown"><button class="dropbtn">????????????</button>
				<div class="dropdown-content">
					<a href="./addBook.jsp">????????????</a>
					<a href="./editBook.jsp?edit=update">????????????</a>
					<a href="./editBook.jsp?edit=delete">????????????</a>
				</div></div>
			</td>

 			<td>
				<div class="dropdown"><button class="dropbtn">????????????</button>
				<div class="dropdown-content">
					<a href="<c:url value="/BoardListAction.do?pageNum=1" />">?????? ??????</a>
				</div></div>
			</td>
			<td>
				<div class="dropdown"><button class="dropbtn">????????????</button>
				<div class="dropdown-content">
					<a href="mailto:04ju30@sunmoon.ac.kr">MAIL??????</a>
				</div></div>
			</td> 
			</c:when>
				<c:otherwise>
					<td>
				<div class="dropdown"><button class="dropbtn">?????? ?????? ?????? ?????????</button>
				<div class="dropdown-content">
					<a href="./introduction.jsp">??????</a>
					<!-- <a href="#">????????????</a> -->
				</div></div>
			</td>
		
			<td>
				<div class="dropdown"><button class="dropbtn">????????????</button>
				<div class="dropdown-content">
					<a href="./books.jsp">????????????</a>
					<a href="./newBooks.jsp">????????????</a>
					<a href="./oldBooks.jsp">????????????</a>
				</div></div>
			</td>

			<td>
				<div class="dropdown"><button class="dropbtn">????????????</button>
				<div class="dropdown-content">
					<a href="./addBook.jsp">????????????</a>
					<a href="./editBook.jsp?edit=update">????????????</a>
					<a href="./editBook.jsp?edit=delete">????????????</a>
				</div></div>
			</td>

 			<td>
				<div class="dropdown"><button class="dropbtn">????????????</button>
				<div class="dropdown-content">
					<a href="<c:url value="/BoardListAction.do?pageNum=1" />">?????? ??????</a>
				</div></div>
			</td>
			<td>
				<div class="dropdown"><button class="dropbtn">????????????</button>
				<div class="dropdown-content">
					<a href="mailto:04ju30@sunmoon.ac.kr">MAIL??????</a>
				</div></div>
			</td> 
					<td>
						<div class="dropdown"><button class="dropbtn"><a href="./bankmain.jsp">??????</button></div>
					
					</td>
					</c:otherwise>
					</c:choose>
				</ul>
		</table>
	</div>
</body>
</html>