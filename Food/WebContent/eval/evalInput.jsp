<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="food.store.ex.storeDTO" %>	
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Lobster"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="/Food/js/ReplyCheckValue.js"></script>
<link rel="stylesheet" href="/Food/css/EvalInput.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>평가하기</title>
</head>
<body>
	<jsp:include page="evalHeader.jsp" />
	<hr>
	<div class="size"></div>
	<div class="centered">
		<div class="storeInfo">
			<div class="storename">
				'${dto.storename}' 평가
			</div>
			<div class="image">
				<img src="${dto.thumbnailimg}" class="imageSize">
				<span style="padding:10px;font-size:15px;font-weight:800;display:inline-block">${dto.category}</span>
			</div>
			<ul class="addr">
				<li style="list-style-type: none">${dto.storeaddr}</li>
				<li style="list-style-type: none">${dto.storeaddrdetail}</li>
				<li style="list-style-type: none">${dto.storetel}</li>
			</ul>
		</div>
		<!-- 평점 form -->
		<form method="post" action="<%=request.getContextPath()%>/evalInput.ev" name="replyInput" onsubmit="return checkValue()">
		<input type="hidden" name="store_id" value="${dto.storeid}">
		<input type="hidden" name="write_id" value="${id}">
		<div class="evalue">
			<div class="total">
				<input type="hidden" name="total" value="" id="total">
				* 전체평점 
				<span style="width: 150px; height: 30px; display: inline-block; float: right" id="to">
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
				</span>
				<hr>
			</div>
			<div id="detail">
				* 항목별 평점
				<hr>
			</div>
			<div class="detail">
				<input type="hidden" name="tasty" value="" id="tasty">
				맛 
				<span style="width: 150px; height: 30px; display: inline-block; float: right" id="t">
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
				</span>
			</div>
			<div class="detail">
				<input type="hidden" name="price" value="" id="price">
				가격 
				<span style="width: 150px; height: 30px; display: inline-block; float: right" id="p">
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
				</span>
			</div>
			<div class="detail">
				<input type="hidden" name="service" value="" id="service">
				서비스 
				<span style="width: 150px; height: 30px; display: inline-block; float: right" id="s">
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
				</span>
			</div>
			<div id="reply">
				<hr>
				* 방문 후기 
			</div>
			<div class="reply">
				<textarea name="content" style="width:100%;height:120px;resize:none;" placeholder=" 방문 후기를 작성해주세요."></textarea>
				<hr>
			</div>
			<!-- 사진 -->
			<div style="padding:10px 25px 10px 25px;">
				* 사진 첨부
				<input type="button" id="photoButton" value="파일첨부" onclick="file_open()">
			</div>
			<div id="photoupload">
				 
			
			</div>
			<div style="padding:10px 25px 5px 25px;">
				<hr>
				<span style="float:left"> 후기를 작성해주셔서 정말 감사합니다.</span><br>
				<span style="float:right">
				<input type="submit" class="btn btn-light"  id="savebutton" value="저장">
				<input type="button" class="btn btn-light" onclick="location.href='javascript:history.go(-1)'" value="취소">
				</span>
			</div>
			
			
		</div>
		
		</form>
		
	</div>
	
	<jsp:include page="../footer.html"/>
</body>
</html>