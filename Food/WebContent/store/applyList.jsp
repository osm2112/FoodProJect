<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="food.store.ex.storeDAO"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>매장등록 신청 목록</title>
<style>
.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
	width: 1000px;
}

.textcenter {
	text-align: center;
}
</style>
	<script>
			$(document).ready(function() {
				
				var ids = $("input").attr("id");
				
				console.log(ids);
				
				var cnt = $("#"+ids).next().next().val();
				console.log(cnt);
				
				for(var i =1; i<cnt+1; i++){
					
					p = $("#p"+i).html();
					console.log(p);
					if (p != "" ) {
						if (p == "P" ) {
							$("#permit"+i).html("승인");
							$("#btn" + i).hide();
						} else {
							$("#permit"+i).html("거부");
							$("#btn" + i).hide();
						}
					}
					else 
					{	$("#btn" + i+"p").show();
						$("#btn" + i+"r").show();}
				}
				
				
			
				var URL = null;
				
				$("input").click(function(){
					var btn = $(this).val();
					var count = null;
					var URL = null;
					if(btn == "승인"){
						
						count = $(this).next().next().val();
						console.log(count);
						$.ajax({
							url : "<%=request.getContextPath()%>/permission.sto?count=" + count + "&permit=P",
							success : function(result) {
								console.log(result);
							}
						});
						$("#permit"+count).html("승인");

							
						
					}else{
						count = $(this).next().val();
						console.log(count);
						$.ajax({
							url : "<%=request.getContextPath()%>/rejection.sto?count=" + count + "&permit=R",
							success : function(result) {
								console.log(result);
							}
						});
						$("#permit"+count).html("거부");
						
					}
					$("#p" + count).hide();
					
						$("#btn" + count+"p").show();
						$("#btn" + count+"r").show();
				});
				
			});
		</script>

</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<br>
	<br>

 <%
	String pageNum = (String)request.getParameter("pageNum");
 	String content = (String)request.getAttribute("content");
	System.out.println("pageNum : "+pageNum);
	int pageNo;
	if (pageNum == null) {
		pageNo = 1;
	} else {
		pageNo = Integer.parseInt(pageNum);
	}
	
	storeDAO dao = new storeDAO();
	String tc = (String) request.getAttribute("totalCount");
	String check = (String) request.getAttribute("check");
	
	int TotalCount = 0;
	if (tc != null) {
		TotalCount = Integer.parseInt(tc);
	}
	System.out.println("TotalCount : "+TotalCount);
	int No = TotalCount - (pageNo - 1) * 10;
	
	int pageCount,pre,next;
	
	if(pageNo > 1)
		pre = pageNo - 1;
	else
		pre = pageNo;
	
	if(TotalCount != pageNo*10)
		pageCount = TotalCount/10 + 1;
	else
		pageCount = TotalCount/10;
	
	if((pageNo+1)<=pageCount)
		next = pageNo + 1;
	else
		next = pageCount;
	
%>
	<div class="centered">
		<h3>매장 등록 신청 목록</h3>
		<br>
		
		<table cellpadding="0" cellspacing="0" border="1">
			<tr style="text-align: center;">
				<th>NO</th>
				<th>STORE ID</th>
				<th>ID</th>
				<th>이름</th>
				<th>상호명</th>
				<th>카테고리</th>
				<th>우편번호</th>
				<th>주소</th>
				<th>나머지 주소</th>
				<th>매장 전화번호</th>
				<th>승인/거부</th>
			</tr>
			<c:forEach items="${applyList}" var="dto">
				<tr>
					<td><%=No%></td>
					<td>${dto.storeid}</td>
					<td>${dto.id}</td>
					<td>${dto.name}</td>
					<td>${dto.storename}</td>
					<td>${dto.category}</td>
					<td>${dto.storeaddrnum}</td>
					<td>${dto.storeaddr}</td>
					<td>${dto.storeaddrdetail}</td>
					<td>${dto.storetel}</td>
					<td id="permit${dto.count}">
						<input type="button" id="btn${dto.count}p" value="승인">
						<input type="button" id="btn${dto.count}r" value="거부">
						<input type="hidden" value="${dto.count}">
						<span id="p${dto.count}">${dto.permit}</span></td>
					<%
						No = No - 1;
					%>
				</tr>
			</c:forEach>
			
		</table>
 	
		<%
			if (content == null) {
		%>
		<div>
			<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link"
					href="/Food/applyList.sto?pageNum=<%=pre%>">◀</a></li>
				<%
					for (int i = 1; i <= pageCount; i++) {
				%>
				<li class="page-item"><a class="page-link"
					href="/Food/applyList.sto?pageNum=<%=i%>">&nbsp;<%=i%>&nbsp;
				</a></li>
				<%
					}
				%>
				<li class="page-item"><a class="page-link"
					href="/Food/applyList.sto?pageNum=<%=next%>">▶</a></li>
			</ul>
			</nav>
		</div>
		<%
			}
		%>

	</div>
	<jsp:include page="../footer.html"></jsp:include>
</body>
</html>