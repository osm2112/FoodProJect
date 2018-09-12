<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="food.blog.ex.blogDTO"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<title>Insert title here</title>
<style>
.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
	width: 900px;
}

.size {
	height: 20px;
}

.btitle {
	text-align: left;
	display: inline-block;
	width: 650px;
	float: left;
	padding: 5px;
	color: black;
	font: 20px bold;
	font-weight: 800;
}

.atitle {
	text-align: left;
	display: inline-block;
	width: 600px;
	padding: 5px;
	font-size: 15px;
	float: left;
}

.title {
	border-bottom: 1px lightgrey dotted;
	margin-bottom:10px;
	padding-bottom:10px;
}

.sname {
	text-align: left;
	display: inline-block;
	width: 800px;
	padding: 5px;
}

.con {
	height: 100px;
	border-bottom: 1px dotted lightgrey;
	padding: 0px;
}

.name {
	display: inline-block;
	color: grey;
	float: right;
}

.date {
	float: right;
	color: grey;
	padding:5px;
}
.list {
	width:900px;
	height:auto;

}
.more {
	text-align:center;
	height:20px;
	cursor:pointer;
	padding-bottom:5px;
}
.more:hover {
	background-color:#f6f6f6;
}

</style>


</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
	%>
	<div class="centered">
			<div class="size"></div>
			<div class="title">
				<input type="hidden" name="store_id" value="1"> 
				<span class="sname">
				<input type="hidden" name="store_name">상호명
				</span> 
				<span style="text-align: right; display: inline-block; color: grey">블로그 후기</span>
			</div>
			<div id = "list" class="list">
				
			</div>
			
			
	</div>
	
	<div class="centered">
	<div id = "count"></div>
	<div class="size"></div>
	<div class="more" id = "more">more</div>
	</div>
	<script>
	$(document).ready(function(){
		
		$("#count").hide();
		
		$.ajax({
			
			url : "../searchBlog.bo",
			success : function(result) {
				console.log(result);
				var datas = JSON.parse(result);
				console.log(datas);
				var i;
				for( i = 0; i<datas.display; i++){
					var title = "<span class='btitle'>" + "<a href="+datas.items[i].bloggerlink+">"
								+ datas.items[i].title + "</a></span>";
					var date = (datas.items[i].postdate); 
						
					var dateFormat = "<span class='date'>" + date.substring(0,4)+"-"+date.substring(4,6) +"-"+ date.substring(6,8) + "</span>";
					var des = "<span class='atitle'>" + datas.items[i].description.substring(50) + "</span>";
					var name = "<span  class='name'> by " + datas.items[i].bloggername + "</span>";
					
					$("#list").append(title,dateFormat,des,name);
					
				}
				$("#count").html(datas.display);
				
			}
		});
		
		$("#more").click(function() {
			
			var count = $("#count").html();
			
			$.ajax({
				
				url : "../searchBlog.bo?start=" + count,
				success : function(result) {
					console.log(result);
					var datas = JSON.parse(result);
					console.log(datas);
					for(var i = 0; i<datas.display; i++){
						var title = "<span class='btitle'>" +"<a href="+datas.items[i].bloggerlink+">"
									+datas.items[i].title + "</a></span>";
						var date = (datas.items[i].postdate); 
							
						var dateFormat = "<span class='date'>" + date.substring(0,4)+"-"+date.substring(4,6) +"-"+ date.substring(6,8) + "</span>";
						var des = "<span class='atitle'>" + datas.items[i].description.substring(50) + "</span>";
						var name = "<span  class='name'> by " + datas.items[i].bloggername + "</span>";
						
						$("#list").append( title,dateFormat,des,name);
					}
					$("#count").html(datas.start);
					
				}
			});
		});
		
	
	 });

 
</script>
</body>
</html>