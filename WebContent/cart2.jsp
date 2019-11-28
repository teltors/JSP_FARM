<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>장바구니</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<h2><%=session.getAttribute("sessionId") %>님이 선택한 상품 목록</h2>
<%
	ArrayList list = (ArrayList)session.getAttribute("cartlist");
	if(list==null) out.println("선택한 상품이 없습니다.");
	else{
		for(Object product : list)
			out.println(product + "<br>");
	}
%>
</body>
</html>
