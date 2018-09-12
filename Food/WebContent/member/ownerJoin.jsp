<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">	
<link href="https://fonts.googleapis.com/css?family=Gaegu|Rancho"
	rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/Food/js/JoinCheckValue.js"></script>


<title>회원가입</title>
<style>
.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
	width: 800px;
	
}
.size {
	width: 300px;
	height: 30px;
	
}
table {
  border-spacing: 0;
  border-collapse: collapse;
  margin-left: auto;
	margin-right: auto;
}
td {
  padding: 5px 0px 5px 20px;
  border: 1px solid lightgrey;
}

.td1 {
	width:200px;}

</style>
</head>
<body>
<jsp:include page="memberHeader.jsp" />
<hr>
	<form action="../memberJoin.mb" method="post" name="userInfo"
		onsubmit="return checkValue()">
		<div class="centered">
				<h4 style="text-align:center;text-decoration:underline">회원가입</h4>
		<table >
			<tr >
				<td class="td1">ID</td>
				<td><div>
						<input type="text" name="id" class="size" autofocus> &nbsp;&nbsp;
						<input type="button" value="ID 중복 체크"	class="btn btn-dark btn-sm" onclick="idCheck()">
					</div>
					<div >아이디는 영문으로 시작해서 5자 이상 20자까지 사용가능 합니다.</div></td>
			</tr>
			<tr >
				<td class="td1">
					<div style="padding:2px;">비밀번호</div>
					<div style="padding:2px;">비밀번호 확인</div>
				</td>
				<td>
					<div style="padding:2px;">
						<input type="password" name="pwd" class="size">
					</div>
					<div style="padding:2px;">
						<input type="password" name="pwdcheck" class="size">
					</div>
				</td>
			</tr>
			<tr >
				<td class="td1" >이메일</td>
				<td ><div >
						<input type="email" name="email" placeholder="ooo@ooo.com" class="size">
					</div></td>
			</tr>
			<tr >
				<td class="td1">이름</td>
				<td ><div>
						<input type="text" name="name" class="size">
					</div></td>
			</tr>
			
			<tr >
				<td class="td1">휴대폰 번호</td>
				<td ><div >
						<select style="width:100px" name="tel1">
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
							</select>-<input
							type="text" name="tel2" >-<input type="text"
							name="tel3" >
					</div></td>
			</tr>
			
			<tr>
				<td colspan="2" >
				<div style="text-align:right">
						<input type="hidden" value="owner" name="user" >
						<input type="submit" value="저  장" class="btn btn-dark btn-sm"
							>&nbsp;&nbsp;<input
							type="reset" value="다시작성" class="btn btn-dark btn-sm">
						&nbsp;&nbsp;<input type="button" value="취소 "
							onclick="location.href='./userChoice.jsp'" class="btn btn-dark btn-sm">
				</div></td>
			</tr>
		</table></div>
	</form>
	<br><br><br><br><br><br>
	
</body>
</html>