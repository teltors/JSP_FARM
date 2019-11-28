<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId=(String) session.getAttribute("sessionId");
%>
<nav class="navbar navbar-expand  navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="./welcome.jsp">농산몰</a>
		</div>
		<div>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="./products.jsp">상품목록</a></li>
				
				<li class="nav-item"><a class="nav-link" href="<c:url value="/BoardListAction.do?pageNum=1"/>">게시판</a></li>
				
				<c:choose>
					<c:when test="${empty sessionId }">
						<li class="nav-item"><a class="nav-link" href="./loginMember.jsp">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="./addMember.jsp">회원가입</a></li>
					</c:when>
					<c:when test="${sessionId == 'test' }">
						<li class="nav-item"><a class="nav-link" href="./addProduct.jsp">[상품등록</a></li>
						<li class="nav-item"><a class="nav-link" href="./editProduct.jsp?edit=update">상품수정</a></li>
						<li class="nav-item"><a class="nav-link" href="./editProduct.jsp?edit=delete">상품삭제</a></li>
						<li class="nav-item"><a class="nav-link" href="#">주문관리]</a></li>
						<li class="nav-item"><a class="nav-link" href="./logoutMember.jsp">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link" href="./updateMember.jsp">회원수정</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link" href="./cart.jsp">장바구니</a></li>
						<li style="padding-top:7px; color:white">[<%=sessionId %>님]</li>
						<li class="nav-item"><a class="nav-link" href="./logoutMember.jsp">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link" href="./updateMember.jsp">회원수정</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>