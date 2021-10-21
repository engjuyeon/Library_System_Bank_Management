<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="util.Util"%> 
<%@ include file="dbconn.jsp" %>

<%
	String filename = "";
	String realFolder = Util.getUploadPath(request); //웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
			new DefaultFileRenamePolicy());
	String productId = multi.getParameter("id");
	String name = multi.getParameter("name");
	String description = multi.getParameter("description");
	String publisher = multi.getParameter("publisher");
	String author = multi.getParameter("author");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");

	long stock;

	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);

	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);	

	
		String sql = "select * from product where b_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			if (fileName != null) {
				sql = "UPDATE product SET b_name=?, b_description=?, b_author=?, b_publisher=?, b_unitsInStock=?, b_condition=? , b_fileName=? WHERE b_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, description);
				pstmt.setString(3, author);
				pstmt.setString(4, publisher);
				pstmt.setLong(5, stock);
				pstmt.setString(6, condition);
				pstmt.setString(7, fileName);
				pstmt.setString(8, productId);
				pstmt.executeUpdate();
			} else {
				sql = "UPDATE product SET b_name=?, b_description=?, b_author=?, b_publisher=?, b_unitsInStock=?, b_condition=? WHERE b_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, description);
				pstmt.setString(3, author);
				pstmt.setString(4, publisher);
				pstmt.setLong(5, stock);
				pstmt.setString(6, condition);
				pstmt.setString(7, productId);
				pstmt.executeUpdate();
			}
		}
	if (rs != null)
		rs.close();
 	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();

	response.sendRedirect("editBook.jsp?edit=update");
%>

