<%@page import="food.member.ex.memberDTO"%>
<%@page import="food.member.ex.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	System.out.println("loginOk:" + id);
	System.out.println("loginPwd:"+pwd);
	String useCookie = request.getParameter("cookie");

	memberDAO dao = new memberDAO();
	memberDTO dto = new memberDTO();

	dto = dao.idCheck(id);
	int checkNum = dao.userCheck(id, pwd);

	if (dto == null) {
%>
		<script language="javascript">
			alert("아이디가 존재하지 않습니다.");
			history.go(-1);
		</script>
<%
	} else {
		if (checkNum == 0) {
%>
		<script language="javascript">
			alert("비밀번호를 확인해주세요.");
			history.go(-1);
		</script>
<%
	} else if (checkNum == 1) {

			if (useCookie != null) { // 쿠키설정(로그인 상태 유지 체크했을 시 )
				Cookie uidCookie = new Cookie("userId", id);
				uidCookie.setMaxAge(60 * 60 * 24 * 1);
				response.addCookie(uidCookie);
				Cookie pwdCookie = new Cookie("pwd", pwd);
				pwdCookie.setMaxAge(60 * 60 * 24 * 1);
				response.addCookie(pwdCookie);
			}

			String name = dto.getName();
			String user_state = dto.getUserState();
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setAttribute("user_state", user_state);
			response.sendRedirect("../main.mb");
		}
%>
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