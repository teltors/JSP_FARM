<%@ page contentType="text/html; charset=utf-8"%>
<!-- 파일 업로드 jar -->
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %> <!-- Enumeration 사용을 위해 -->

<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

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

	ProductRepository dao = ProductRepository.getInstance(); //폼에서 입력된 데이터를 저장하도록 ProductRepository변수의 dao 를 생성하고

	Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	newProduct.setFilename(filename);

	dao.addProduct(newProduct); //dao의 addProduct메소드를 호출

	response.sendRedirect("products.jsp");
%>
