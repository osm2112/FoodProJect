<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약 내용 확인</title>
</head>
<body>
<div style="text-align:center;">
	<h3>예약 내용 확인 </h3>
</div>
<hr>
	<table border="1">
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
	<hr>
	<div style="text-align: center;">
		<h5>상기 내용으로 예약 되었습니다.</h5>
		<input type="button" value="확인">
	</div>
</body>
</html>