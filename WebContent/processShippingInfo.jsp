<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLEncoder"%>
<%
	request.setCharacterEncoding("UTF-8");

	Cookie cartId = new Cookie("Shipping_cartId", URLEncoder.encode(request.getParameter("cartId"), "utf-8"));
	Cookie name = new Cookie("Shipping_name", URLEncoder.encode(request.getParameter("name"), "utf-8"));
	Cookie shippingDate = new Cookie("Shipping_shippingDate", URLEncoder.encode(request.getParameter("shippingDate"), "utf-8"));
	Cookie tel = new Cookie("Shipping_tel",	URLEncoder.encode(request.getParameter("tel"), "utf-8"));
	Cookie requ = new Cookie("Shipping_requ", URLEncoder.encode(request.getParameter("requ"), "utf-8"));
	Cookie addressName = new Cookie("Shipping_addressName", URLEncoder.encode(request.getParameter("addressName"), "utf-8"));

	cartId.setMaxAge(365 * 24 * 60 * 60);
	name.setMaxAge(365 * 24 * 60 * 60);
	tel.setMaxAge(365 * 24 * 60 * 60);
	requ.setMaxAge(365 * 24 * 60 * 60);
	addressName.setMaxAge(365 * 24 * 60 * 60);

	response.addCookie(cartId);
	response.addCookie(name);
	response.addCookie(tel);
	response.addCookie(shippingDate);
	response.addCookie(addressName);
	response.addCookie(requ);


	response.sendRedirect("orderConfirmation.jsp");
%>
