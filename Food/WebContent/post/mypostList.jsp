<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>MY POST</title>
<style>
.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
	width: 1000px;
}
th,td {
	text-align:center;
}
.size {
	height: 20px;
}

a:hover {
	font-weight: 800;
	cursor:pointer;
}
</style>
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


</head>

<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String pageNum = (String) request.getParameter("pageNum");
		System.out.println("pageNum : " + pageNum);

		int pageNo;

		if (pageNum == null) {
			pageNo = 1;
		} else {
			pageNo = Integer.parseInt(pageNum);
		}

		String tc = (String) request.getAttribute("totalCount");
		String check = (String) request.getAttribute("check");

		int TotalCount = 0;
		if (tc != null) {
			TotalCount = Integer.parseInt(tc);
		}
		System.out.println("TotalCount : " + TotalCount);
		int No = TotalCount - (pageNo - 1) * 5;

		int pageCount, pre, next;

		if (pageNo > 1)
			pre = pageNo - 1;
		else
			pre = pageNo;

		if (TotalCount != pageNo * 5)
			pageCount = TotalCount / 5 + 1;
		else
			pageCount = TotalCount / 5;

		if ((pageNo + 1) <= pageCount)
			next = pageNo + 1;
		else
			next = pageCount;

	%>
	<jsp:include page="../header.jsp" />
	<div class="size"></div>
	<div class="centered">
		<div class="size"></div>
		<h3>나의 포스트 목록</h3>
		<div class="size"></div>
	
		<div  style="height:350px">
			<table class="table table-hover" style="border-bottom:1px solid lightgrey;">
				<thead>
					<tr>
						<th style="width:80px;">NO</th>
						<th>제목</th>
						<th style="width:150px;">날짜</th>
						<th style="width:80px;">수정</th>
						<th style="width:80px;">삭제</th>
					</tr>
				</thead>
				<c:forEach var="dto" items="${list}">
				<tbody>
					<tr>
						<td><%=No%></td>
						<td style="text-align:left"><a id="${dto.post_id}" onclick="goView(this)">${dto.post_title}</a></td>
						<td>${dto.post_date}</td>
						<td id="${dto.post_id}"><input type="button"
							class="btn btn-secondary btn-sm" id="edit" value="수정" /></td>
						<td id="${dto.post_id}"><input type="button"
							class="btn btn-secondary btn-sm" id="delete" value="삭제" /></td>
						<% No = No - 1; %>
					</tr>
				</tbody>
				</c:forEach>
			</table>
		</div>
	
		<div>
			<nav aria-label="pagination example">
				<ul class="pagination justify-content-center">
					<li class="page-item">
						<a class="page-link" href="/Food/MyPostList.po?write_id=${id}&pageNum=<%=pre%>">
							<span aria-hidden="true">&laquo;</span>
	                		<span class="sr-only">Previous</span>
						</a>
					</li>
					<%
						for (int i = 1; i <= pageCount; i++) {
					%>
					<li class="page-item">
						<a class="page-link" href="/Food/MyPostList.po?write_id=${id}&pageNum=<%=i%>"><%=i%></a>
					</li>
					<%}%>
					<li class="page-item">
						<a class="page-link" href="/Food/MyPostList.po?write_id=${id}&pageNum=<%=next%>">
						<span aria-hidden="true">&raquo;</span>
	                	<span class="sr-only">Next</span>
						</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>

</body>
</html>