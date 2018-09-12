<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
<script src="/Food/js/LoginCheckValue.js"></script>

<title>login</title>
<style>
.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
	width: 380px;
}

.size {
	width: 370px;
	height: 30px;
	
}
.font {
	font-size: 20px;
}

.right {
	width:180px;
	text-align:right;
	display:inline-block;
}
.left {
	width:180px;
	text-align:left;
	display:inline-block;
	}

.footer {
position: absolute;
	bottom: 0;
	width: 100%;
	height: 60px;
	background: #EAEAEA;}

.join {
	margin:20px 0 100px 0; 
	padding:20px 0; 
	border:solid 1px lightgrey; 
	text-align:center;}
.yf { text-decoration:overline; }

</style>
</head>
<body>
<jsp:include page="memberHeader.jsp" />
<hr>
<div class="centered">
			<form method="POST" action="loginOk.jsp" onSubmit="return loginCheckValue()" name="inputForm">
				<div style="text-align:center;">
				<h5>로그인 및 회원가입</h5>
				<hr>
				
					<input class="size" type="text"  name = "id" placeholder="  아이디 입력" class="form-control" style="margin-bottom:7px;" autofocus/><br>
					<input class="size" type="password" name = "pwd" placeholder="  비밀번호 입력" class="form-control" />
				</div>
				<div style="padding:24px 0;">
						<label><input type="checkbox" value="Y" name="cookie" checked /><span class="left">&nbsp;&nbsp;로그인상태 유지</span></label>
					    <span class="right"><a href="">비밀번호 찾기</a></span>
				</div>
				
				<input type="submit" class="btn btn-primary btn-block btn-dark" value="로그인"/>
					<hr>
				<div class="join">
					<p style="margin-bottom:-2px">아직 회원이 아니시라면?</p>
					<button type="button" class="btn btn-outline-dark" style="margin-top:12px;" 
					onclick="location.href='./userChoice.jsp'">회원가입</button>
   				</div>
			</form>
		</div>

</body>
</html>