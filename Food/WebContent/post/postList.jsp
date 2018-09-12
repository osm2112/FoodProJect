<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>POST</title>
	<script>
	
	$(document).ready(function(){
		
			var listSize = $("#listSize").html();
			console.log(listSize);
			$("#listSize").hide();
			
			for(var cnt = 0; cnt<listSize; cnt++) {
				
				if(cnt % 2 != 0){
					
					$("#img"+cnt).css('float', 'right');
					$("#align"+cnt).css('float','left');
				}
				else {
					$("#img"+cnt).css('float','left');
					$("#align"+cnt).css('float','right');
				}
			}
			$(".content li").css('cursor','pointer');
	});
	
	
	
	
</script>
<style>
.size {
	height:50px;
}

.img {
	width:460px;
	height:300px;
	margin:20px 20px 0px 20px;
}

.content {
	width:650px;
	height:300px;
	padding:80px 10px 80px 10px;
	margin:20px;
	color:black;
}

.imgDiv {
	width:1200px;
	display:table;
	margin-right:auto;
	margin-left:auto;
}

#title:hover {
	font-size:32px;
	color:#FF6347;
}
#title {
	font-size:30px;
}
.img:hover {
	opacity:0.7;
	cursor:pointer;
}
#id {
	display:none;
}
ul li,ul span{
	margin-bottom:5px;
}
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:include page="postHeader.jsp" />  
	<div class="size"></div> 
	<div class="size"></div>  
	<!-- 포스트 목록 -->
	<div id="listSize">${list.size()}</div>
	<c:if test="${list.size()>0}">
		<c:forEach var="i" begin="0" end="${list.size()-1}">
			<div class="imgDiv">
				<img src="${list[i].getImg_path()}" class="img" id="img${i}"
					onclick=goView2(this)>
				<ul class="content" id="align${i}">
					<li id="title" onclick=goView(this)>${list[i].getPost_title()}</li>
					<li onclick=goView(this)>${list[i].getPost_sub()}</li>
					<li style="color:grey;margin-right:30px">
					<span>${list[i].getPost_date()}</span>
					<span style="padding-left:20px">by ${list[i].getWrite_name()}</span>
					</li>
					<li id="id">${list[i].getPost_id()}</li>
				</ul>
			</div><hr>
		</c:forEach>
	</c:if>
	<div class="size"></div>  
	<jsp:include page="../footer.html"/>
<script>

function goView(ob) {
	
	var id = $(ob).parent().children("#id").text();

	location.href = "<%=request.getContextPath()%>/postView.po?post_id=" + id;
};

function goView2(ob) {

	var id = $(ob).next().children("#id").text();

	location.href = "<%=request.getContextPath()%>/postView.po?post_id=" + id;
};
</script>
</body>
</html>