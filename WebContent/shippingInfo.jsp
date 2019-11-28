<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>배송 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">배송 정보</h1>
		</div>
	</div>
	<div class="container">
		<form action="./processShippingInfo.jsp" class="form-horizontal"method="post">
			<input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>">
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control">
				</div>
			</div><div class="form-group row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input name="tel" type="text" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">받으실 날짜</label>
				<div class="col-sm-3">
					<input name="shippingDate" type="text" class="form-control">(yyyy/mm/dd)
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-10">
					<input name="addressName" type="text" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">요청사항</label>
				<div class="col-sm-10">
					<input name="requ" type="text" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<a href="./cart.jsp?cartId=<%=request.getParameter("cartId")%>" class="btn btn-secondary" role="button"> 이전 </a> 
					<input type="submit" class="btn btn-primary" value="등록" /> 
					<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button"> 취소 </a>
				</div>
			</div>

		</form>
	</div>
</body>
</html>
