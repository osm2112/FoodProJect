<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약 내용 확인</title>
</head>
<style>
.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
	width: 800px;
}
.size {
	height: 20px;
}
</style>
<body>
<jsp:include page="../../header.jsp"></jsp:include>
<div class="size"></div>
<div class="centered">
<div class="size"></div>
	<h3>예약 내용 확인 </h3>
	<div class="size"></div>
	<table class="table" style="border-bottom:1px solid lightgrey">
		<tr>
			<td>예약자번호</td>
			<td>${param.reservationId }</td>
		</tr>
		<tr>
			<td>가게명</td>
			<td>${param.storeName }</td>
		</tr>
		<tr>
			<td>가게주소</td>
			<td>${param.storeAddr }</td>
		</tr>
		<tr>
			<td>예약자명</td>
			<td>${param.reserveName }</td>
		</tr>		
		<tr>
			<td>예약일자</td>
			<td>${param.reserveDate }</td>
		</tr>		
		<tr>
			<td>예약자시간</td>
			<td>${param.reserveTime }</td>
		</tr>		
		<tr>
			<td>예약인수</td>
			<td>${param.reserveSeat }</td>
		</tr>
		<tr>
			<td>연락처</td>
			<td>${param.reserveTel }</td>
		</tr>		
		<tr>
			<td>예약자이메일</td>
			<td>${param.reserveEmail }</td>
		</tr>
		<tr>
			<td>요청사항</td>
			<td>${param.reserveComment }</td>
		</tr>				
	</table>
	</div>
	<hr>
	<div style="text-align: center;">
		<h5>상기 내용으로 예약 되었습니다.</h5>
		<input type="button" class="btn btn-secondary" style="padding-top:5px" value="확인" />
	</div>
</body>
</html>