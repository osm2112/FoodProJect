<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="food.blog.ex.blogDTO"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" href="/Food/css/postView.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/Food/js/postView.js"></script>
<script>

	
</script>
<title>POST</title>
<style>

</style>

</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:include page="postHeader.jsp" />
	
		<div class="size"></div>
		<div style="display:none" id="postId">${dto.post_id}</div>
		<div style="display:none" id="id">${id}</div>
		<div class="clip">
			<img src="${dto.img_path}" class="clip" >
		</div>
	<div class="centered">	
		<div class="title">
			<span class="font">${dto.post_title}</span>
		</div>
		
		<hr>
		<div class="title">
			<span class="font2">${dto.post_sub}</span>
		</div>
		<div class="content">${dto.post_content}</div>
		<div class="heart">
			<span class="sheart"> <img
				src="/Food/img/like.png" width="33px"
				height="27px" style=" padding-right: 5px" title="좋아요"
				class="image" id="like"> <span id="likeCount" style="padding-right:5px">${dto.post_like}</span>
				 <img
				src="/Food/img/thumb.png" width="35px"
				height="30px" style="padding-right: 5px;vertical-align:top" title="추천"
				class="image" id="commend"> <span id="comCount" style="padding-right:5px">${dto.post_commend}</span>
			</span> 
		</div>
	</div>
	<div class="size"></div>
	<hr>
	<!-- ///////////////////////////여기서부터 답글 /////////////////////////////////-->
	<div class="size"></div>
	<div class="ReplyCentered">
		<div style="margin:10px 10px 10px 0px;font-size:20px;font-weight:800">댓글 0</div>
		<div>
			<form method="post" action="" name="Reply">
			<input type="hidden" name="write_id" value="${id}">
			<input type="hidden" name="post_id"	value="${dto.post_id}">
			<fieldset class="postReply" style="padding-right:-1px">
				<div id="writeId" style="margin:10px 0px 5px 15px;height:25px;">${id}</div>
				<textarea cols="100" rows="10" 
				placeholder="주제와 무관한 댓글,악플은 삭제 될 수 있습니다." name="re_content" id="r_content" ></textarea>
				<div style="border-top:1px solid lightgrey;margin-top:10px;height:45px;padding:5px">
				<span style="float:right;margin-top:-5px;margin-right:-5px">
					<button class="replyButton" type="button">등록</button>
				</span>
				</div>  
			</fieldset>
			</form>
		</div>
	</div>
	
	
	<div class="ReplyCentered">
		<div class="size"></div>
		<span style="font-size:16px;padding-bottom:20px">전체 댓글</span>
		<div style="height:20px"></div>
	</div>
	
	<!-- 답글 리스트 -->
	<div id="rs-wrapper">
	</div>
	
	<script>

	
	</script>
	
	<jsp:include page="../footer.html" />
	
</body>
</html>