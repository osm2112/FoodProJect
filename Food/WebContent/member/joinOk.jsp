<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>


<%
		String joinOk = (String)request.getAttribute("joinOk");

		if(("ok").equals(joinOk)){
%>
		
			<script language="javascript">
				alert("회원가입을 축하 합니다.");
				document.location.href="member/login.jsp";
			</script>
<%
		}else {
%>
			<script language="javascript">
				alert("회원가입에 실패했습니다.");
				document.location.href="member/userChoice.jsp";
			</script>
<%
		}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>	
</body>
</html>