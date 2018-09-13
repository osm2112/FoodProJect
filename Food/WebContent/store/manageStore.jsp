<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="food.store.ex.storeDAO"%>
<%@ page import="food.store.ex.storeDTO"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매장 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
	width: 1000px;
}
</style>

<script>
$(document).ready(function() {

    var count = $("input").attr("id");
    console.log(count);
    
    var pr = $("p").attr("id");

    for (var i = 0; i < count+1; i++) {

       var permit = $("#" + i).parent().attr("id");
       console.log(permit);
       
       if (permit != 'P') {
           $("#" + i + "n").html("-");
           $("#" + i).hide();
           if(permit == 'R'){
              $("#pr"+i).html("승인 거부");
           } else {
              $("#pr"+i).html("승인 대기");
           }
        } else {
           $("#" + i + "n").hide();
           $("#pr" + i).html("승인");
        }
    }

$("input").click(function(){
    var storeid = $(this).parent().attr("class");
    console.log(storeid);
    location.href="<%=request.getContextPath()%>/updateStoreView.sto?id="+storeid;
})
    
});

</script>
 
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<br>
	<br>

	<%
		String pageNum = (String) request.getParameter("pageNum");
		String content = (String) request.getAttribute("content");
		System.out.println("pageNum : " + pageNum);

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
	<%
		String id = (String)session.getAttribute("id");
		String permit = (String)request.getAttribute("permit");
		String storeid = (String)request.getAttribute("storeid");
	%>

	<div class="centered">
		<h3>매장 관리</h3>
		<br>
		<table class="table table-hover">
		<thead>
			<tr>
				<th>NO</th>
				<th>STORE ID</th>
				<th>상호명</th>
				<th>상태</th>
				<th>관리</th>
			</tr>
		</thead>	
			<c:forEach items="${storeList}" var="dto">
				<tbody>
				<tr>
					<td><%=No%></td>
					<td>${dto.storeid}</td>
					<td>${dto.storename}</td>
					<td id="pr${dto.count}">
						${dto.permit}
					</td>
					<td id="${dto.permit}" class="${dto.storeid}">
						<input type="button" class="btn btn-secondary btn-sm" id="${dto.count}" value="수정" />
						<span id="${dto.count}n"></span>
					</td>
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
					<a class="page-link" href="/Food/manageStore.sto?id=<%=id%>&pageNum=<%=pre%>">
						<span aria-hidden="true">&laquo;</span>
                		<span class="sr-only">Previous</span>
					</a>
				</li>
				<%
					for (int i = 1; i <= pageCount; i++) {
				%>
				<li class="page-item">
					<a class="page-link" href="/Food/manageStore.sto?id=<%=id%>&pageNum=<%=i%>"><%=i%></a>
				</li>
				<%}%>
				<li class="page-item">
					<a class="page-link" href="/Food/manageStore.sto?id=<%=id%>&pageNum=<%=next%>">
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
	<jsp:include page="../footer.html"></jsp:include>

</body>
</html>