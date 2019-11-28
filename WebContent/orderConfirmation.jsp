<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%
	request.setCharacterEncoding("UTF-8");

	String cartId = session.getId();

	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingDate = "";
	String shipping_tel = "";
	String shipping_requ = "";
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
			if (n.equals("Shipping_tel"))
				shipping_tel = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_requ"))
				shipping_requ = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_addressName"))
				shipping_addressName = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>주문 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 정보</h1>
		</div>
	</div>
	<div class="container col-8 alert alert-info">
		<div class="text-center ">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>배송 주소</strong> <br> 성명 : <% out.println(shipping_name); %><br> 
				전화번호 : <% 	out.println(shipping_tel);%><br> 
				주소 : <%	out.println(shipping_addressName);%><br>
				요청사항 : <%	out.println(shipping_requ);%> <br>
			</div>
			<div class="col-4" align="right">
				<p>	<em>받을실 날짜: <% out.println(shipping_shippingDate);	%></em>
			</div>
		</div>
		<div>
			<table class="table table-hover">			
			<tr>
				<th class="text-center">제품</th>
				<th class="text-center">개수</th>
				<th class="text-center">가격</th>
				<th class="text-center">소계</th>
			</tr>
			<%
				int sum = 0;
				ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
				if (cartList == null)
					cartList = new ArrayList<Product>();
				for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
					Product product = cartList.get(i);
					int total = product.getUnitPrice() * product.getQuantity();
					sum = sum + total;
			%>
			<tr>
				<td class="text-center"><em><%=product.getPname()%> </em></td>
				<td class="text-center"><%=product.getQuantity()%></td>
				<td class="text-center"><%=product.getUnitPrice()%>원</td>
				<td class="text-center"><%=total%>원</td>
			</tr>
			<%
				}
			%>
			<tr>
				<td> </td>
				<td> </td>
				<td class="text-right">	<strong>총액: </strong></td>
				<td class="text-center text-danger"><strong><%=sum%> 원</strong></td>
			</tr>
			</table>			
				
			<form action="./thankCustomer.jsp">
					<!-- DB로 보낼것 -->
				<%String sessionId=(String) session.getAttribute("sessionId"); %>
				<input type="hidden" name="id" value="<%= sessionId %>"/>
				<input type="hidden" name="cartid" value="<%=shipping_cartId%>"/>
				<input type="hidden" name="name" value="<% out.println(shipping_name); %>"/>
				<input type="hidden" name="tel" value="<% out.println(shipping_tel);%>"/>
				<input type="hidden" name="address" value="<% out.println(shipping_addressName);%>"/>
				<input type="hidden" name="shipday" value="<% out.println(shipping_shippingDate);%>"/>
				<input type="hidden" name="requ" value="<% out.println(shipping_requ);%>"/>
				<%
					int sum2 = 0;
					String num = "";
					String pro = "";
					ArrayList<Product> cartList2 = (ArrayList<Product>) session.getAttribute("cartlist");
					if (cartList2 == null)
						cartList2 = new ArrayList<Product>();
					for (int i = 0; i < cartList2.size(); i++) { // 상품리스트 하나씩 출력하기
						Product product = cartList2.get(i);
						pro = pro + num + product.getPname() + product.getQuantity() + ", ";					
						int total = product.getUnitPrice() * product.getQuantity();
						sum2 = sum2 + total;
				
					}
				%>
				<input type="hidden" name="pro" value="<%=pro%>"/>
				<input type="hidden" name="sum2" value="<%=sum2%>"/>
				<input type="hidden" name="confirm" value="0"/>
				<a href="./ShippingInfo.jsp?cartId=<%=shipping_cartId%>"class="btn btn-secondary" role="button"> 이전 </a>
					<input type="submit" class="btn btn-success" role="button" value="주문 완료"> 
					
				<a href="./checkOutCancelled.jsp" class="btn btn-secondary"	role="button"> 취소 </a>
			</form>
			
			
				
							
		</div>
	</div>	
	
			
			
</body>
</html>
