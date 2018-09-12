<%@page import="food.member.ex.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dto" class="food.member.ex.memberDTO" scope="page" />
<jsp:setProperty name="dto" property="*" />

<%
	String id = (String) session.getAttribute("id");
	String oldPwd = (String)request.getParameter("oldpwd");

	memberDAO dao = new memberDAO();

	int check = dao.pwdCheck(id, oldPwd);
	
	int ri = dao.updateMember(dto);

	if (check == 0) {
%>
		<script language="javascript">
		alert("기존 비밀번호가 틀립니다.");
		history.go(-1);
		</script>

<%
	}else {
	if (ri == 1) {
%>
<script language="javascript">
		alert("회원정보가 수정 되었습니다.");
		document.location.href="<%=request.getContextPath()%>/memberInfo.mb?id=<%=id%>";
</script>
<%
	} else {
%>
<script language="javascript">
	alert("회원정보가 수정되지 않았습니다.");
	document.location.href="<%=request.getContextPath()%>/memberInfo.mb?id=<%=id%>";
</script>
<%
	}}
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