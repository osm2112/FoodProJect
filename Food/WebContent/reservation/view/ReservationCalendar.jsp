<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약 내역 확인</title>
<link href='./fullcalendar/fullcalendar.css' rel='stylesheet' />
<link href='./fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='./fullcalendar/lib/moment.min.js'></script>
<script src='./fullcalendar/lib/jquery.min.js'></script>
<script src='./fullcalendar/fullcalendar.js'></script>
<script src='./fullcalendar/locale-all.js'></script>
<script src='./js/ReservationCalendar.js'></script>
<script>


</script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	<div id='calendar'></div>
	<input type= "hidden" id ="storeId" value="<%= request.getParameter("storeId") %>" >
	
</body>
</html>

