<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="food.store.ex.storeDAO" %>
 
<%
	storeDAO dao = storeDAO.getInstance();

	String check = (String)request.getAttribute("permit");
	System.out.println("check:" + check);
	
	if(("P").equals(check)) {
%>
	<script language="javascript">
		alert("등록 승인되었습니다.");
		document.location.href="<%= request.getContextPath()%>/applyList.sto";
	</script>	
<%
	} else {
%>
	<script language="javascript">
		alert("승인x");
		history.go(-1);
	</script>
<%
	}
%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>