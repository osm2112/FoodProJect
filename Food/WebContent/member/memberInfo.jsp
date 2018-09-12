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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
<script type="text/javascript" src="/Food/js/JoinCheckValue.js"></script>
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

</style>

</head>
<body>
<% memberDTO dto = (memberDTO)request.getAttribute("dto"); %>
<jsp:include page="memberHeader.jsp" />
<hr>
		<div class="centered">
				<h4 style="text-align:center;text-decoration:underline">회원 정보</h4>
				<br>
		<table >
			<tr >
				<td class="td1">ID</td>
				<td class="td2"><div>
					<%=dto.getId()%>	
					</div>
				</td>
			</tr>
			<tr >
				<td class="td1" >이메일</td>
				<td class="td2"><div >
						<%=dto.getEmail()%>
					</div></td>
			</tr>
			<tr >
				<td class="td1">이름</td>
				<td class="td2"><div>
						<%=dto.getName()%>
					</div></td>
			</tr>
			<tr >
				<td class="td1">휴대폰 번호</td>
				<td class="td2"><div >
						<%=dto.getPhoneNum()%>  
					</div></td>
			</tr>
			<% System.out.println(dto.getUserState());
			if(("user").equals(dto.getUserState())) {%>
			<tr>
				<td class="td1" >생년월일</td>
				<td class="td2">
				<div>
					<%=dto.getBirthday()%>
					</div></td>
			</tr>
			<tr>
				<td class="td1">성별</td>
				<td class="td2">
					<div>
						<%=dto.getGender()%>
					</div>
				</td>
			</tr>
			<tr>
				<td class="td1">주소</td>
				<td class="td2">
					<div style="padding:2px;">
						(<%=dto.getAddrnum()%>)<br>
						<%=dto.getAddr()%><br>
						<%=dto.getAddrdetail()%>
					</div>
					
				</td>
			</tr>
			<%} %>
			<tr class="tr-button">
			<td colspan="2" class="td-button">
				<div class="div-button" style="text-align:right;padding:5px 10px 5px 0px;">
					<input type="button" class="btn btn-dark btn-sm" value="회원정보변경" onclick="location.href='./memberM.mb?id=<%=dto.getId()%>'">&nbsp;
					<input type="button" class="btn btn-dark btn-sm" value="사이트 탈퇴" onclick="location.href='member/deleteMember.jsp'">
				</div>
			</td>
		</tr>
		</table></div>
	</form>
	<br><br><br><br><br><br>
	
</body>
</html>