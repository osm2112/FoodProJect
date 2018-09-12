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
<!-- <link href="https://fonts.googleapis.com/css?family=Libre Barcode 128 Text"
	rel="stylesheet"> -->
<link href="https://fonts.googleapis.com/css?family=Boogaloo"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
.size {
	height: 50px;
}

.header {
	background-color: white;
	height: 80px;
	text-align: left;
	padding: 10px 0px 0px 250px;
}

a.th {
	padding: 10px;
	font: 65px bold;
	font-weight: 800;
	color: #FF6347; 
	text-shadow: 1px 1px grey;
	font-family:Boogaloo;	
/*  	font-family:Oswald; */
/* 	font-family:'Playfair Display'; */
	/* font-family:'Baloo Tammudu'; */
}

a.th:hover {
	font-size: 68px;
	text-decoration: none;
}

ul, li {
	display: inline-block;
	font: 18px bold;
	font-weight: 750;
	padding-right: 10px;
}

.menus {
	float: right;
	margin: 50px 250px 0px 25px;
	color:grey;
	text-shadow: -1px 0 #D3D7D4, 0 1px #D3D7D4, 1px 0 #D3D7D4, 0 -1px #D3D7D4;
}

.menus li:hover {
	cursor: pointer;
	color:#FF6347;
}
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		System.out.println(session.getAttribute("id"));
	%>
	<div class="size"></div>
	<div class="size"></div>
	<div class="header">
		<a href="<%=request.getContextPath()%>/main.mb" class="th">TASTY
			HOUSE</a>
		<ul class="menus">
			<li onclick=goList()>LIST</li>
			<li onclick=goLikeList()>좋아요순</li>
			<li onclick=goCommendList()>추천순</li>
			<li onclick=goPage()>WRITE</li>
			<li id="myPost" onclick=goMyPost()>MY</li>
		</ul>
	</div>

	<script>
	
	var id = "${id}";
	
	$(document).ready(function(){
		if(id == ""||id == null){
			$("#myPost").hide();
		}
	});
	
	function goPage() {
			
			if(id == ""||id == null){
				
				if(confirm("로그인 후 이용가능합니다.로그인 하시겠습니까?")){
					location.href="<%=request.getContextPath()%>/member/login.jsp";	
				}
				
			}
			else{
				location.href="<%=request.getContextPath()%>/post/postInput.jsp";
			}
			
		}
	
	function goList() {
		
		location.href="<%=request.getContextPath()%>/postList.po";
	};
	function goMyPost() {
		
		location.href="<%=request.getContextPath()%>/MyPostList.po?write_id="+id;
	
	};
	
	function goLikeList() {
		
		location.href="<%=request.getContextPath()%>/postList.po?order=post_like";
		
	};
	
	function goCommendList(){
		location.href="<%=request.getContextPath()%>/postList.po?order=post_commend";
	}
	
	
	</script>
</body>
</html>