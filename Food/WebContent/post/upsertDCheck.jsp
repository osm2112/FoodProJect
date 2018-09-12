<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="food.blog.ex.blogDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	String id = (String)session.getAttribute("id");
	String check =(String)request.getAttribute("check");
	
	System.out.println(check);
	if(check != null){
		if("input".equals(check)){
		%>
			<script language="javascript">
			alert("정상적으로 등록되었습니다.");
			document.location.href="<%=request.getContextPath()%>/postList.po";  
			</script>
		<%}
		else if(("update").equals(check)){
		%>
			<script language="javascript">
			alert("정상적으로 수정되었습니다.");
			document.location.href="<%=request.getContextPath()%>/MyPostList.po?write_id=<%=id%>";  
			</script>
		<% }else if(("delete").equals(check)){
		%>
			<script language="javascript">
			alert("정상적으로 삭제 등록되었습니다.");
			document.location.href="<%=request.getContextPath()%>/MyPostList.po?write_id=<%=id%>";  
			</script>
	
		<% }
	}else {%>
			<script language="javascript">
			alert("오류가 발생했습니다.");
			history.go(-1);  
			</script>	
	<%}%>
		
		
</body>
</html>