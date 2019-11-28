<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
.display-3 {
	font-size: 110px;
	text-align: center;
	margin: 0;
	font-weight: 900;
	letter-spacing: 10px;
	background: url(./resources/image/page/HP.jpg) center;
	-webkit-text-fill-color: transparent;
	-webkit-background-clip: text;
	font-family: "Noto Sans CJK KR";
}
</style>

<title>실시간 농산물 가격</title>
</head>
<body onload="printClock()">
	<%@include file="menu.jsp"%>
	<%!String greeting = "실시간 농산물 가격";
	String tagline = "오시는 길";%>
	<div class="jumbotron">
		<div class="container">
			<h2 class="display-3">
				<%=greeting%>
			</h2>
		</div>
	</div>

	<!-- 현재 시간 -->
	<div style="text-align: center; margin: 200px 0px 300px 0px; ">
		<div
			style="width: 600px; display: inline-block; height: 250px; line-height: 250px; color: #666; font-size: 100px; text-align: center;"
			id="clock"></div>
	</div>
	<br>
	<div class="container">
		<div class="text-center">
			<h2 style="font-family: Noto Sans CJK KR;">
				<%=tagline%>
			</h2>
		</div>
		<hr>
	</div>

	<!--Google map-->
	<div style="text-align: center;">
		<iframe
			src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d815.165303511753!2d128.9884285292307!3d35.18999559876947!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3568ea9feaab57e3%3A0x42c11007344bd6bb!2z67aA7IKw6rSR7Jet7IucIOyCrOyDgeq1rCDrqqjrnbzrj5kgOTkxLTY!5e0!3m2!1sko!2skr!4v1572942698606!5m2!1sko!2skr"
			width="800" height="300" frameborder="0" style="border: 0;"></iframe>
	</div>
	<!--Buttons-->
	<div class="row text-center">
		<div class="col-md-4">
			<a class="btn-floating blue accent-1"><i
				class="fas fa-map-marker-alt"></i></a>
			<p>의성시</p>
			<p>의성읍</p>
		</div>

		<div class="col-md-4">
			<a class="btn-floating blue accent-1"><i class="fas fa-phone"></i></a>
			<p>010-2430-8184</p>
			<p>무휴</p>
		</div>

		<div class="col-md-4">
			<a class="btn-floating blue accent-1"><i class="fas fa-envelope"></i></a>
			<p>info@gmail.com</p>
			<p>sale@gmail.com</p>
		</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

		<div
			style="text-align: center; width: 100%; ">
			<%@include file="footer.jsp"%>
		</div>
</body>
</html>


<script type="text/javascript">
<!-- 현재시간 -->
	function printClock() {

		var clock = document.getElementById("clock"); // 출력할 장소 선택
		var currentDate = new Date(); // 현재시간
		var calendar = currentDate.getFullYear() + "-"
				+ (currentDate.getMonth() + 1) + "-" + currentDate.getDate() // 현재 날짜
		var amPm = 'AM'; // 초기값 AM
		var currentHours = addZeros(currentDate.getHours(), 2);
		var currentMinute = addZeros(currentDate.getMinutes(), 2);
		var currentSeconds = addZeros(currentDate.getSeconds(), 2);

		if (currentHours >= 12) { // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
			amPm = 'PM';
			currentHours = addZeros(currentHours - 12, 2);
		}

		if (currentSeconds >= 50) {// 50초 이상일 때 색을 변환해 준다.
			currentSeconds = '<span style="color:#de1951;">' + currentSeconds
					+ '</span>'
		}
		clock.innerHTML = currentHours + ":" + currentMinute + ":"
				+ currentSeconds + " <span style='font-size:50px;'>" + amPm
				+ "</span>"; //날짜를 출력해 줌

		setTimeout("printClock()", 1000); // 1초마다 printClock() 함수 호출
	}

	function addZeros(num, digit) { // 자릿수 맞춰주기
		var zero = '';
		num = num.toString();
		if (num.length < digit) {
			for (i = 0; i < digit - num.length; i++) {
				zero += '0';
			}
		}
		return zero + num;
	}
</script>