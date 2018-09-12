<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쿠키체크</title>
</head>
<body>
	<%
		String cid = "";
		String cpwd = "";
		try {
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (int i = 0; i < cookies.length; i++) {
					if (cookies[i].getName().equals("userId")) {
						cid = cookies[i].getValue();
						System.out.println("cookieCheck ID:" + cid);

					}
					if (cookies[i].getName().equals("pwd")) {
						cpwd = cookies[i].getValue();
						System.out.println("cookieCheck pwd:" + cpwd);
					}
				}
				if (cid.equals("")) {
					response.sendRedirect("../main.jsp?cc=c");
				} else {
					response.sendRedirect("loginOk.jsp?id=" + cid + "&pwd=" + cpwd);
				}

			}
		} catch (Exception e) {
		}
	%>
</body>
</html>