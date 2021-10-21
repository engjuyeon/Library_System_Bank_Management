<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>

<%
	request.setCharacterEncoding("UTF-8");

	String cartId = session.getId();

	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingDate = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";
	
	Cookie[] cookies = request.getCookies();

	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if (n.equals("Shipping_cartId"))
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_name"))
				shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_shippingDate"))
				shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_country"))
				shipping_country = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_zipCode"))
				shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_addressName"))
				shipping_addressName = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
%>
<html>
<head>
<link rel="stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="./font.css">
<title>대여 신청 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="container" style="text-align: right;">
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">대여 신청 정보</h1>
		</div>
	</div>
</div>
	<div class="container col-8 alert alert-info">
		<div class="text-center ">
			<h1>확인증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>대여인 정보</strong> <br> 성명 : <% out.println(shipping_name); %>	<br> 
				전화번호 : <% 	out.println(shipping_zipCode);%><br> 
				주소 : <%	out.println(shipping_addressName);%>(<%	out.println(shipping_country);%>) <br>
			</div>
			<div class="col-4" align="right">
				<p>	<em>대여일: <% out.println(shipping_shippingDate);%></em>
			</div>
		</div>
		<div>
			<table class="table table-hover">			
			<tr>
				<th class="text-center">도서명</th>
				<th class="text-center">출판사 명</th>
				<th class="text-center">저자명</th>
			</tr>
			<%
				int count = 0;
				ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
				if (cartList == null)
					cartList = new ArrayList<Book>();
				for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
					Book book = cartList.get(i);
					int total = book.getQuantity();
					count = count + total;
			%>
			<tr>
				<td class="text-center"><%=book.getBname()%></td>
				<td class="text-center"><%=book.getPublisher()%></td>
				<td class="text-center"><%=book.getAuthor()%></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td> </td>
				<td> </td>
				<td class="text-right">	<strong>총 대여 권수: </strong></td>
				<td class="text-center text-danger"><strong><%=count%> 권</strong></td>
			</tr>
			</table>
			
				<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId%>"class="btn btn btn-outline-dark" role="button"> 이전 </a>
				<a href="./thankCustomer.jsp"  class="btn btn btn-outline-dark" role="button"> 신청 완료 </a>
				<a href="./checkOutCancelled.jsp" class="btn btn btn-outline-dark"	role="button"> 취소 </a>			
		</div>
	</div>	
	
	<jsp:include page="footer.jsp" />
</body>
</html>
