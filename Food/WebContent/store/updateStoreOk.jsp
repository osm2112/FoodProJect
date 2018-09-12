<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>   
<%@ page import="food.store.ex.storeDAO" %> 

<%
	String storeid = (String)request.getAttribute("storeid");
	String check = (String)request.getAttribute("check");
	String check2 = (String)request.getAttribute("check2");
	

	if(("ok").equals(check) && ("ok").equals(check2)) {
%>
	<script language="javascript">
		alert("매장 정보가 수정 되었습니다.");
		document.location.href="<%=request.getContextPath()%>/storeInfoView.sto?storeid=<%=storeid%>";
	</script>
<%
	} else {
%>
	<script language="javascript">
		alert("이거뜨면 안됨");
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