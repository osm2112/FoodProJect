<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "food.member.ex.memberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>탈퇴확인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<script>
	function checkYesOrNo() {
		var check = confirm("정말 탈퇴 하시겠습니까?");
		if (check) {
			return true;
		}
		else{
			return false;}
	}
</script>
<style>
.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
	width: 550px;
	
}
.header {
	font: 30px bold oblique;
	font-weight:800;
	height:70px;
	text-align:center;
	padding:10px 0px 0px 0px;
}
.size {
	height: 30px;}

</style>
</head>
<body>
<% System.out.println("delete id:" + session.getAttribute("id")); %>
<div class="header">
			<a href="<%=request.getContextPath()%>/main.mb" style="border-bottom:3px solid;color:black;padding:10px">Tasty House:)
			</a>
</div>
<hr>
	<form method="POST" action="<%=request.getContextPath()%>/member/deleteMemberOk.jsp" onsubmit="return checkYesOrNo()">
		<div class="centered">
				<div class="size"></div>
				<h4 style="text-align:center;text-decoration:underline">회원 탈퇴</h4>
				<br>
				<div class="size"></div>
				<div>
					<div style="display: inline-block;">
						&nbsp;&nbsp;&nbsp; <input type="password" name="pwd" style="width: 350px">
					</div>
					&nbsp;&nbsp;
					<span>
					<input type="hidden" name="id" value="${id}">
					<input type="submit" class="btn btn-primary btn-xl btn-dark" value="확인">&nbsp;&nbsp;
					<input type="button" onclick="location.href='../memberInfo.mb?id=${id}'" class="btn btn-primary btn-xl btn-dark" value="취소"></span>
				</div>
				<div>
					<font color="black" font-size="3pt">&nbsp;&nbsp;&nbsp;회원 탈퇴를 하시려면 비밀번호를 입력하여 주세요.</font>
				</div>
			</div>
			
		</form>
	
	
</body>
</html>