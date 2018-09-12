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

<title>회원가입</title>
<style>
.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
	width: 400px;
}

.size {
	width: 400px;
	height: 100px;
	margin: 0px;
}

.size1 {
	width: 190px;
	height: 100px;
	padding: 25px;
	margin: 0px;
	text-align: center;
	display: inline-block;
	border: 2px solid lightgrey;  
	cursor:pointer;
}

.size3 {
	width: 400px;
	height: 50px;
	margin: 0px;
}

</style>
</head>
<body>
<jsp:include page="memberHeader.jsp" />
<hr>
	<div class="centered">
		<br>
		<h4 style="text-align: center; text-decoration: underline">회원가입</h4>
		<div class="size3"></div>
		<div class="size">
			<span class="size1" onmouseover="mOver(this)" onmouseout="mOut(this)" onclick="location.href='./ownerJoin.jsp'">
				점주<br>Owner
			</span></a> <span class="size1" onmouseover="mOver(this)"
				onmouseout="mOut(this)" onclick="location.href='./userJoin.jsp'"> 일반 회원<br>Member
			</span>
		</div>
		<div class="size3"></div>
		<div style="text-align:center">  
		<button type="submit" class="btn btn-primary btn-block btn-dark" 
				onclick="location.href='./login.jsp'" >취 소</button>
		</div>
	</div>
	<script>
		function mOver(obj) {
			obj.style.backgroundColor = "#F5F5F5";
			obj.style.color = "#FF6347";
			obj.style.borderColor = "lightgrey";
		}

		function mOut(obj) {
			obj.style.backgroundColor = "white";
			obj.style.color = "black";
			obj.style.borderColor = "lightgrey";
		}
	</script>
</body>
</html>