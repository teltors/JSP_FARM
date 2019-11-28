<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>주문 완료</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String cartid = request.getParameter("cartid");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");
	String shipday = request.getParameter("shipday");
	String requ = request.getParameter("requ");
	String pro = request.getParameter("pro");
	String sum2 = request.getParameter("sum2");
	String confirm = request.getParameterValues("confirm")[0];

	Date currentDatetime = new Date(System.currentTimeMillis());
	java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
	java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/pepper"
	driver="com.mysql.jdbc.Driver" user="root" password="1111" />

<sql:update dataSource="${dataSource}" var="resultSet">
   INSERT INTO shipping VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
   <sql:param value="<%=id%>" />
	<sql:param value="<%=cartid%>" />
	<sql:param value="<%=name%>" />
	<sql:param value="<%=tel%>" />
	<sql:param value="<%=address%>" />
	<sql:param value="<%=timestamp%>" />
	<sql:param value="<%=shipday%>" />
	<sql:param value="<%=requ%>" />
	<sql:param value="<%=pro%>" />
	<sql:param value="<%=sum2%>" />
	<sql:param value="<%=confirm%>" />
</sql:update>


	<%
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
				if (n.equals("Shipping_shippingDate"))
					shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			}
		}
	%>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
		<p>주문은	<%	out.println(shipping_shippingDate);	%>까지 최대한 배송 할 예정입니다! !	
		<p>주문번호 :	<%	out.println(shipping_cartId);	%>
	</div>
	<div class="container">
		<p><a href="./products.jsp" class="btn btn-secondary"> &laquo; 상품 목록</a>
	</div>
</body>
</html>

