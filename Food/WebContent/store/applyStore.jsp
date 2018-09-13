<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="food.store.ex.storeDTO" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Gaegu|Rancho"
	rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>매장 등록 신청</title>
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
.size1 {
	width: 500px;
	height: 30px;
	
}
table {
	border-spacing: 0;
	border-collapse: collapse;
	margin-left: auto;
	margin-right: auto;
	width: 800px;
}

td {
	padding: 5px 5px 5px 5px;
	border: 1px solid lightgrey;
}

.td1 {
	width: 170px;
	text-align: center;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<br><br>
<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
%>
<div class="centered">
	<h4>매장 등록 신청</h4>
	<br>
		<form action="<%= request.getContextPath() %>/applyStore.sto" method="post" name="frm">
		<table>
			<tr>
				<td class="td1">ID</td>
				<td><input type="hidden" name="id" value="${id}">${id}</td>
			</tr>
			<tr>
				<td class="td1">이름</td>
				<td><input type="hidden" name="name" value="${name}">${name}</td>
			</tr>
			<tr>
				<td class="td1">상호명</td>
				<td>
					<div>
						<input type="text" name="storename" class="size" value="${storename}">
					</div>
				</td>
			</tr>
			<tr>
				<td class="td1">카테고리</td>
				<td>
					<div>
						<select style="width: 130px" name="category">
							<option>한식</option>
							<option>분식</option>
							<option>양식</option>
							<option>중식</option>
							<option>일식</option>
							<option>치킨</option>
							<option>카페</option>
							<option>패스트푸드</option>
							<option>뷔페</option>
							<option>간식</option>
							<option>퓨전요리</option>
							<option>아시아음식</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<td class="td1">주소</td>
				<td>
					<div style="padding:2px;">
						<input type="text" id="addrnum" name="storeaddrnum">&nbsp;&nbsp;
						<input type="button" onclick="SearchPostcode()" value="우편번호검색" class="btn btn-dark btn-sm"><br>
						<div id="layer" style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
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
						<input type="text" id="addr" name="storeaddr" class="size1">
					</div>
					<div style="padding:2px;">
						<input type="text" name="storeaddrdetail" class="size1">
					</div>
				</td>
			</tr>
			<tr>
				<td class="td1">매장 전화번호</td>
				<td>
					<div>
						<select style="width: 100px" name="storetel1">
							<option>02</option>
							<option>051</option>
							<option selected>053</option>
							<option>032</option>
							<option>062</option>
							<option>042</option>
							<option>052</option>
						</select>-
						 <input type="text" name="storetel2">-
						 <input type="text" name="storetel3">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div style="text-align: right">
						<input type="submit" value="등록신청" class="btn btn-dark btn-sm" >
						<input type="reset" value="다시작성" class="btn btn-dark btn-sm">
						<input type="button" value="취소 " onclick="location.href='javascript:history.go(-1)'"
																						class="btn btn-dark btn-sm">
					</div>
				</td>
			</tr>
		</table>
		</form>
	</div>
<jsp:include page="../footer.html"></jsp:include>
</body>
</html>