<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>    
<%@ page import="com.oreilly.servlet.multipart.*" %> 
<%@ page import="java.util.*" %>   
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<%@ page import="util.Util"%> 
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>   
<%
 request.setCharacterEncoding("UTF-8");

  	String filename="";
  	String realFolder = Util.getUploadPath(request); 
  	int maxSize = 5 * 1024 * 1024;
  	String encType = "utf-8";
  	
  	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, 
  	encType, new DefaultFileRenamePolicy());
  	
  	String bookId = multi.getParameter("id");
  	String bname = multi.getParameter("name");
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

  	String sql = "insert into product values(?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, bookId);
	pstmt.setString(2, bname);
	pstmt.setString(3, description);
	pstmt.setString(4, author);
	pstmt.setString(5, publisher);
	pstmt.setLong(6, stock);
	pstmt.setString(7, condition);
	pstmt.setString(8, fileName);
	pstmt.executeUpdate();
	
	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();

  	
  	response.sendRedirect("books.jsp");
 %>