<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.util.*"%>
<%@ page import="food.member.ex.memberDTO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script language="JavaScript" src="/Food/js/ModCheckValue.js"></script>
<title>회원가입</title>
<style>
.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
	width: 800px;
	
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
.td2 {
	width:500px;}

.tel {
	width:100px;
}

.size1 {
	width: 300px;
	height: 30px;
	
}
.pass {
	padding-bottom:3px;
}

</style>
</head>
<body>
<% memberDTO dto = (memberDTO)request.getAttribute("dto");%>

<jsp:include page="memberHeader.jsp" />
<hr>
	<form action="<%=request.getContextPath()%>/member/updateMemberOk.jsp" method="post" name="userInfo"
			onsubmit= "return updateInfoConfirm()">
		<div class="centered">
				<h4 style="text-align:center;text-decoration:underline">회원 정보 수정</h4>
				<br>
		<table >
			<tr >
				<td class="td1">ID</td>
				<td class="td2"><div>
					<%=dto.getId()%>
					<input type="hidden" name="id" value="<%=dto.getId()%>">	
					</div>
				</td>
			</tr>
			<tr >
				<td class="td1">
					<div class="pass">기존비밀번호</div>
					<div class="pass">비밀번호</div>
					<div class="pass">비밀번호 확인</div>
				</td>
				<td class="td2">
					<div >
						<input type="password" name="oldpwd" style="margin-bottom:2px">
					</div>
					<div >
						<input type="password" name="pwd" style="margin-bottom:2px">
					</div>
					<div >
						<input type="password" name="pwdcheck" style="margin-bottom:2px">
					</div>
				</td>
			</tr>
			<tr >
				<td class="td1" >이메일</td>
				<td class="td2"><div >
						<input type="email" name="email" placeholder="ooo@ooo.com" class="size" value="<%=dto.getEmail()%>">
					</div></td>
			</tr>
			<tr >
				<td class="td1">이름</td>
				<td class="td2"><div>
						<%=dto.getName()%>
						<input type="hidden" name="name" value="<%=dto.getName()%>">
					</div></td>
			</tr>
			<tr >
				<td class="td1">휴대폰 번호</td>
				<td ><div>
						<%=dto.getPhoneNum().substring(0,3)%>
						<input type="hidden" name="tel1"value="<%=dto.getPhoneNum().substring(0,3)%>">-
						<input type="text" name="tel2" class="tel" value="<%=dto.getPhoneNum().substring(4,8)%>">-
						<input type="text" name="tel3" class="tel" value="<%=dto.getPhoneNum().substring(9,13)%>">
					</div></td>
			</tr>
			<%System.out.println(dto.getUserState());
			if(("user").equals(dto.getUserState())) {%>
			<tr>
				<td class="td1" >생년월일</td>
				<td><div>
						<input type="date" name="bday" class="size" value="<%=dto.getBirthday()%>">
					</div></td>
			</tr>
			<tr>
				<td class="td1">성별</td>
				<td class="td2">
					<div>
						<input type="radio" name="gender" id="man" value="man" checked="checked" >
						<label for="man">남성</label>&nbsp;&nbsp; 
						<input type="radio"	name="gender" id="woman" value="woman" checked="checked">
						<label for="woman">여성</label>
					</div>
				</td>
			</tr>
			<tr>
				<td class="td1">주소</td>
				<td>
					<div style="padding:2px;">
						<input type="text" id="addrnum" name="addrnum" value="<%=dto.getAddrnum()%>" required>&nbsp;&nbsp;<input
							type="button" onclick="SearchPostcode()" value="우편번호검색" class="btn btn-dark btn-sm"
							><br>
						<div id="layer"
							style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
							<img
								src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
								id="btnCloseLayer"
								style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
								onclick="closeDaumPostcode()" alt="닫기 버튼">
						</div>
						<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
						<script src="/Food/js/SearchAddr.js"></script>
					</div>
					<div style="padding:2px;">
						<input type="text" id="addr" name="addr" class="size1" value="<%=dto.getAddr()%>" required>
					</div>
					<div style="padding:2px;">
						<input type="text" name="addrdetail" class="size1" value="<%=dto.getAddrdetail()%>" required>
					</div>
				</td>
			</tr>
			<%} %>
			<tr class="tr-button">
			<td colspan="2" >
				<div style="text-align:right">
						<input type="submit" value="저  장" class="btn btn-dark btn-sm" 
							>&nbsp;&nbsp;<input type="button" value="취소 "
							onclick=back() class="btn btn-dark btn-sm">
				</div></td>
		</tr>
		</table></div>
	</form>
	<script>
	  
	  if(<%=dto.getGender()%>=="man")
		  document.userInfo.gender[0].checked == true;
	  else
		  document.userInfo.gender[1].checked == true;
	  
	</script>
	<br><br><br><br><br><br>
	
</body>
</html>