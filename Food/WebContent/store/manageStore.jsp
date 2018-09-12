<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="food.store.ex.storeDAO"%>
<%@ page import="food.store.ex.storeDTO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매장 관리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
        
        var check = $(this).attr("id");
        
        if(check == 'view'){
        	
        	location.href="<%=request.getContextPath()%>/storeInfoView.sto?storeid="+storeid;
        }
        else {
        location.href="<%=request.getContextPath()%>/updateStoreView.sto?id="+storeid;
        }
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
		int No = TotalCount - (pageNo - 1) * 10;

		int pageCount, pre, next;

		if (pageNo > 1)
			pre = pageNo - 1;
		else
			pre = pageNo;

		if (TotalCount != pageNo * 10)
			pageCount = TotalCount / 10 + 1;
		else
			pageCount = TotalCount / 10;

		if ((pageNo + 1) <= pageCount)
			next = pageNo + 1;
		else
			next = pageCount;
	%>
	<%
		String id = (String) session.getAttribute("id");
		String permit = (String) request.getAttribute("permit");
		String storeid = (String)request.getAttribute("storeid");
	%>

	<div class="centered">
		<h3>매장 관리</h3>
		<br>
		<table cellpadding="0" cellspacing="0" border="1">
			<tr>
				<th>NO</th>
				<th>storeidE ID</th>
				<th>상호명</th>
				<th>상태</th>
				<th>관리</th>
			</tr>
			<c:forEach items="${storeList}" var="dto">
				<tr>
					<td><%=No%></td>
					<td>${dto.storeid}</td>
					<td>${dto.storename}</td>
					<td id="pr${dto.count}">
						${dto.permit}
					</td>
					<td id="${dto.permit}" class="${dto.storeid}">
						<input type="button" id="${dto.count}" value="수정" />
						<input type="button" id="view" value="VIEW" />
						<span id="${dto.count}n"></span>
					</td>
					<% No = No - 1; %>
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
					href="/Food/manageStore.jsp?pageNum=<%=pre%>">◀</a></li>
				<%
					for (int i = 1; i <= pageCount; i++) {
				%>
				<li class="page-item"><a class="page-link"
					href="/Food/manageStore.jsp?pageNum=<%=i%>">&nbsp;<%=i%>&nbsp;
				</a></li>
				<%
					}
				%>
				<li class="page-item"><a class="page-link"
					href="/Food/manageStore.jsp?pageNum=<%=next%>">▶</a></li>
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