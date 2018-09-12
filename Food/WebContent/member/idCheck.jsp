<%@page import="java.sql.Timestamp"%>
<%@page import="food.member.ex.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>


<%
		System.out.println("idCheck");
		memberDAO dao = new memberDAO();
		String id = (String)request.getParameter("id");
		
		memberDTO dto = dao.idCheck(id);
		System.out.println(dto);%>	
<%		
		if(dto == null) {
%>
		<script language="javascript">
			alert("사용할 수 있는 아이디입니다.");
			history.go(-1);
			</script>
<%
		} else {
%>	
		<script language="javascript">
			alert("이미 존재하는 아이디입니다.");
			history.go(-1);
		</script>		
<% 		}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>	
</body>
</html>