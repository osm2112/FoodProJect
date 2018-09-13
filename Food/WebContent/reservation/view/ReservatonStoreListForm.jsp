<%@page import="food.reservation.dao.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
	width: 1000px;
}
</style>
</head>
<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	<br>
	<br>

	<%
		String pageNum 	= (String) request.getParameter("pageNum");
		String content 	= (String) request.getAttribute("content");
		String id 		= (String) session.getAttribute("id");
		String storeid	= (String) request.getAttribute("storeid");
		String tc 		= (String) request.getAttribute("totalCount");
		String check 	= (String) request.getAttribute("check");
		int pageNo;
		int TotalCount = 0;

		if (pageNum == null) {
			pageNo = 1;
		} else {
			pageNo = Integer.parseInt(pageNum);
		}

		if (tc != null) {
			TotalCount = Integer.parseInt(tc);
		}
		
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
	<div class="centered">
		<h3>예약 관리</h3>
		<br>
		<table class="table table-hover">
		<thead>
			<tr>
				<th>NO</th>
				<th>STORE ID</th>
				<th>상호명</th>
			</tr>
		</thead>	
			<c:forEach items="${storeList}" var="dto">
				<tbody>
				<tr>
					<td>${dto.count}</td>
					<td>${dto.storeid}</td>
					<td><a href='./ReservationCalendar.re?storeId=${dto.storeid}'>${dto.storename}</a></td>
					<% No = No - 1; %>
				</tr>
				</tbody>
			</c:forEach>
		</table>
		<%
			if (content == null) {
		%>
		<div>
		<div style="text-align: center;">
			<nav aria-label="pagination example">
			<ul class="pagination pagination-lg">
				<li class="page-item">
					<a class="page-link" href="./ReservatonStoreList.re?pageNum=<%=pre%>">
						<span aria-hidden="true">&laquo;</span>
                		<span class="sr-only">Previous</span>
					</a>
				</li>
				<%
					for (int i = 1; i <= pageCount; i++) {
				%>
				<li class="page-item">
					<a class="page-link" href="./ReservatonStoreList.re?pageNum=<%=i%>"><%=i%></a>
				</li>
				<%}%>
				<li class="page-item">
					<a class="page-link" href="./ReservatonStoreList.re?pageNum=<%=next%>">
					<span aria-hidden="true">&raquo;</span>
                	<span class="sr-only">Next</span>
					</a>
				</li>
			</ul>
			</nav>
		</div>	
		</div>
		<%
			}
		%>
	</div>
	<jsp:include page="../../footer.html"></jsp:include>
</body>
</html>