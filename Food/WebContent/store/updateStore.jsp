<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.util.*"%>
<%@ page import="food.store.ex.storeDTO"%>
<%@ page import="food.store.ex.regStoreDTO"%>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/Food/js/storeDetailImgCheck.js"></script>
<link rel="stylesheet" href="/Food/css/storeImg.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매장 정보 등록/수정</title>

<script>

	function file_open() {
	window.open("/Food/store/stoImgUpload.jsp", "upload",
			"width=450 height=200 left=300 top=30");
	}
	
</script>
</head>
<body>
<%	
	storeDTO dto = (storeDTO)request.getAttribute("dto");
	regStoreDTO dto1 = (regStoreDTO)request.getAttribute("dto1");

	String storeid = (String)request.getAttribute("storeid");
	String rsstoreid = (String)request.getAttribute("storeid");
%>
	<jsp:include page="../header.jsp"></jsp:include>
	<br>
	<br>
<form action="<%=request.getContextPath()%>/updateStore.sto?id=${dto.storeid}" method="post" name="storeInfo">	
<div class="centered">
		<h3>매장 정보 수정</h3>
		<br>
		<input type="hidden" name="storeid" value="${dto.storeid}">
		<input type="hidden" name="rsstoreid" value="${dto1.rsstoreid}">
		<table cellpadding="0" cellspacing="0" border="1">
			<tr>
				<td style="height: 35px;">상호명</td>
				<td><input type="text" name="storename" class="size" value="${dto.storename}"></td>
			</tr>
			<tr>
				<td style="height: 35px;">카테고리</td>
				<td>
					<select style="width: 130px" name="category" value="${dto.category}">
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
				</td>
			</tr>
			<tr>
				<td class="td1">매장 주소</td>
				<td>
					<div style="padding: 2px;">
						<input type="text" id="addrnum" name="storeaddrnum" value="${dto.storeaddrnum}" style="height: 30px;">&nbsp;&nbsp;
						<input type="button" onclick="SearchPostcode()" value="우편번호검색"
							class="btn btn-dark btn-sm"><br>
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
					<div style="padding: 2px;">
						<input type="text" id="addr" name="storeaddr" class="size1" value="${dto.storeaddr}">
					</div>
					<div style="padding: 2px;">
						<input type="text" name="storeaddrdetail" class="size1" value="${dto.storeaddrdetail}">
					</div>
				</td>
			</tr>
			<tr>
				<td style="height: 35px;">매장 번호</td>
				<td>
					<div>
						<select style="width: 100px" name="storetel1" value="${dto.storetel1}">
							<option>02</option>
							<option>051</option>
							<option>053</option>
							<option>032</option>
							<option>062</option>
							<option>042</option>
							<option>052</option>
						</select>&nbsp;-
						 <input type="text" style="height: 30px;" name="storetel2" value="${dto.storetel2}">&nbsp;-
						 <input type="text" style="height: 30px;" name="storetel3" value="${dto.storetel3}">
					</div>
				</td>
			</tr>
			<tr>
				<td>메뉴</td>
				<td>
				<div><textarea cols="70" rows="7" name="menu">${dto1.menu}</textarea></div>
				</td>
			</tr>
			<tr>
				<td style="height: 35px;">미리보기 사진</td>
				<td>
					<div class="form-control" style="height:35px">
							<input type="text" name="thumbnailimg" class="ThumbnailImg" placeholder="매장 미리보기 사진을 올려주세요." />&nbsp;
							<input type="button" style="background-color: white; border: 1px solid lightgrey; font-size: 15px;" value=" 파일첨부 "
								onclick="file_open()">
					</div>
				</td>
			</tr>
			<tr>
				<td>상세 사진</td>
				<td>
					<div style="padding:5px 5px 5px 5px;">
					음식 또는 매장 등의 사진을 올려주세요.
						<input type="button" id="photoButton" style="background-color: white; border: 1px solid lightgrey; font-size: 15px;" value=" 파일첨부 " onclick="file_open2()">
					</div>
					<div id="photoupload"></div>
				</td>
			</tr>
			
		</table>
		<div style="text-align: right">
					<input type="submit" value="수정" class="btn btn-dark btn-sm" >
					<input type="reset" value="다시작성" class="btn btn-dark btn-sm">
					<input type="button" value="취소 " onclick="location.href='javascript:history.go(-1)'"
																					class="btn btn-dark btn-sm">
		</div>
</div>
</form>
<jsp:include page="../footer.html"></jsp:include>
</body>
</html>