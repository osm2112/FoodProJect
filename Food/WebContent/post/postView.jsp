<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="food.blog.ex.blogDTO"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
		$(document).ready(function() {
			
			var id = "${id}";
			
			$(".image").click(function() {
				
				if(!id){
					if(confirm("로그인 후 이용가능합니다.로그인 하시겠습니까?")){
						location.href="<%=request.getContextPath()%>/member/login.jsp";
					}
				}
				
				var lc = $(this).attr("id");
				console.log(lc);
				
				if(lc == "like"){
					$.ajax({
						url : "postLike.po?post_id=${dto.post_id}&write_id=${id}",
						success : function(result) {
							var datas = JSON.parse(result);
							console.log(datas);
							$("#likeCount").html(datas.like);
						}
					})	
				}
				else{
					$.ajax({
						url : "postCommend.po?post_id=${dto.post_id}&write_id=${id}",
						success : function(result) {
							var datas = JSON.parse(result);
							console.log(datas);
							$("#comCount").html(datas.commend);
						}
					})
					
				}
				
			});
			
			$(".content p").children().css({'font-family':''});
			$(".content p").children("font").attr("face","")
			
		});
</script>
<title>POST</title>
<style>
.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
	width: 900px;
	background-color:#FFFAFA;
}

.title {
	padding: 10px;
	text-align:center;
}

.font {
	font-size: 45px;
	padding-right: 30px;
	color:#4F5555;
	font-weight:800;
	float:center;
}
.font2 {
	font-size: 32px;
	padding-right: 10px;
	color:#4F5555;
	font-weight:800;
	float:center;
}

.size {
	height: 50px;
}


.content {
	padding-top: 20px;
	border-bottom: 1px lightgrey solid;

}

.heart {
	padding-top: 10px;
	text-align: right;
	margin-right: 10px;
}

.list {
	text-align: right;
	display: inline-block;
}

.sheart {
	display: inline-block;
	width: 200px;
	padding: 3px 5px 5px 8px;
	font-size: 20px;
	color: grey;
}

.button {
	float:right;
	padding-right: 0px;
	display: inline-block;
}
.clip {
  position: relative;
  height: 550px;
  width:1200px;
  margin-bottom:-110px;
  margin-top:-30px;
  margin-left: auto;
  margin-right: auto;
}
.clip img {
  position: absolute;
  clip: rect(100px 1200px 400px 0px);
  opacity:0.8;
} 
.image{
	cursor:pointer;
}
.image:hover {
	 animation: shake 0.5s;
  	 animation-iteration-count: infinite;
}
.image:active { 
	width:40px;
	height:35px;
	vertical-align:top;
} 
@keyframes shake {
  0% { transform: translate(1px, 1px) rotate(0deg); }
  10% { transform: translate(-1px, -2px) rotate(-1deg); }
  20% { transform: translate(-3px, 0px) rotate(1deg); }
  30% { transform: translate(3px, 2px) rotate(0deg); }
  40% { transform: translate(1px, -1px) rotate(1deg); }
  50% { transform: translate(-1px, 2px) rotate(-1deg); }
  60% { transform: translate(-3px, 1px) rotate(0deg); }
  70% { transform: translate(3px, 1px) rotate(-1deg); }
  80% { transform: translate(-1px, -1px) rotate(1deg); }
  90% { transform: translate(1px, 2px) rotate(0deg); }
  100% { transform: translate(1px, -2px) rotate(-1deg); }
}

</style>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:include page="postHeader.jsp" />
	
		<div class="size"></div>
		
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
				src="<%=request.getContextPath()%>/img/like.png" width="33px"
				height="27px" style=" padding-right: 5px"
				class="image" id="like"> <span id="likeCount" style="padding-right:5px">${dto.post_like}</span>
				 <img
				src="<%=request.getContextPath()%>/img/thumb.png" width="35px"
				height="30px" style="padding-right: 5px;vertical-align:top"
				class="image" id="commend"> <span id="comCount" style="padding-right:5px">${dto.post_commend}</span>
			</span> 
		</div>

		<div id="list"></div>
	</div>
	<jsp:include page="../footer.html" />

</body>
</html>