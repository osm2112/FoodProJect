<%@page import="food.member.ex.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	String id = (String)session.getAttribute("id");
	String pwd = (String)request.getParameter("pwd");  
	
		
	memberDAO dao = new memberDAO();
	
	int checkNum = dao.pwdCheck(id, pwd);
			

	if (checkNum == 0) {
%>
	<script language="javascript">
		alert("비밀번호가 틀렸습니다.");
		history.go(-1);
	</script>
<%} else {  
	int ri = dao.deleteMember(id);     
	if(ri == 1) {
%>
	<script language="javascript"> 
		alert("회원정보가 삭제 되었습니다.");
		document.location.href="<%=request.getContextPath()%>/member/logout.jsp";
	</script>
<%
	} else {
%>
	<script language="javascript">
		alert("회원탈퇴에 실패했습니다.");
		history.go(-1);
	</script>
<%
	}
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