<%@ page contentType="text/html; charset=utf-8"%>
<!-- 파일 업로드 jar -->
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %> <!-- Enumeration 사용을 위해 -->
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");

	//파일 업로드 과정
	String filename = "";
	//학원경로 
	//String path = "C:\\JSP_FARM\\WebShop\\WebContent\\resources\\image\\upload"; //절대경로
	//집경로
	String path ="C:\\shop_project\\WebMarket\\WebContent\\resources\\image\\upload"; 
	
	int maxSize = 5 * 1024 * 1024; //5MB
	String encType = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, path, maxSize, encType, new DefaultFileRenamePolicy());

	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");

	Integer price; //dto에 없음 새로 변수 지정

	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);

	long stock; //dto에 없음 새로 변수 지정

	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName =multi.getFilesystemName(fname);

	//sql
	PreparedStatement pstmt = null;
	String sql = "INSERT INTO product values(?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	pstmt.setString(2, name);
	pstmt.setInt(3, price);
	pstmt.setString(4, description);
	pstmt.setString(5, manufacturer);
	pstmt.setString(6, category);
	pstmt.setLong(7, stock);
	pstmt.setString(8, condition);
	pstmt.setString(9, fileName);
	pstmt.executeUpdate();
	
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
	
	response.sendRedirect("products.jsp");
%>
