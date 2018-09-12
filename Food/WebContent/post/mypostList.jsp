<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>	
		$(document).ready(function(){
			
			$("input").click(function(){
				
				var ed = $(this).attr("id");
				
				if(ed == "edit"){
					var p_id = $(this).parent().attr("id");
					
					location.href="<%=request.getContextPath()%>/postUpdateView.po?post_id=" + p_id;
				}
				else {
					var check = confirm("정말 삭제 하시겠습니까?");
					
					if (check) {
						var p_id = $(this).parent().attr("id");
						
						location.href="<%=request.getContextPath()%>/postDelete.po?post_id=" + p_id;
					}
					
				}
				
			})
			
		});
		function goView(t) {
			
			var id = $(t).attr("id");
			console.log(id);
			location.href="<%=request.getContextPath()%>/postView.po?post_id=" + id;
		} ;
		
	</script>
<title>POST</title>
<style>
.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
	width: 800px;
}

.size {
	height: 50px;
}

th, td {
	width: 50px;
	height: 20px;
	font-size: 15px;
}

a:hover {
	font-weight: 800;
}
</style>



</head>

<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String write_id = (String) request.getParameter("write_id");
	%>
	<jsp:include page="../header.jsp" />
	<div class="centered">
		<div class="size"></div>
		<h3>나의 포스트 목록</h3>
		<div class="size"></div>

		<table border="1">
			<tr>
				<th style="width: 30px">NO</th>
				<th>title</th>
				<th>DATE</th>
				<th>EDIT</th>
				<th>DELETE</th>

			</tr>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td></td>
					<td><a id="${dto.post_id}" onclick=goView(this)>${dto.post_title}</a></td>
					<td>${dto.post_date}</td>
					<td id="${dto.post_id}"><input type="button"
						class="btn btn-light" id="edit" value="수정" /></td>
					<td id="${dto.post_id}"><input type="button"
						class="btn btn-light" id="delete" value="삭제" /></td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>