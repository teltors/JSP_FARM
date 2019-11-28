<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>Login</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
			<%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요");
					out.println("</div>");
				}
			%>
			<form class="form-signin" action="processLoginMember.jsp" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label> 
					<input type="text" class="form-control" placeholder="ID" name="id" required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label> 
					<input type="password" class="form-control" placeholder="Password" name="password" required>
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
				
				<!-- 네이버로 로그인 
				<%
				    String clientId = "MXQrQ_Hp6dc2gBEflb6D";//애플리케이션 클라이언트 아이디값";
				    String redirectURI = URLEncoder.encode("http://localhost:8080/WebShop/home", "UTF-8");
				    SecureRandom random = new SecureRandom();
				    String state = new BigInteger(130, random).toString();
				    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
				    apiURL += "&client_id=" + clientId;
				    apiURL += "&redirect_uri=" + redirectURI;
				    apiURL += "&state=" + state;
				    session.setAttribute("state", state);
				 %>
				  <a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG" style="margin:10px;"/></a>-->
				</div>
				
			</form>
		</div>
	</div>
</body>
</html>