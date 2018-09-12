<%@page import="food.reservation.dto.ReservationDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ReservationDTO> ReservationList = (List<ReservationDTO>) request.getAttribute("reservationList");
	int listcount = ((Integer) request.getAttribute("listcount")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer) request.getAttribute("startpage")).intValue();
	int endpage = ((Integer) request.getAttribute("endpage")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약 내역 조회</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>예약번호</td>
			<td>가게명</td>
			<td>예약일자</td>
			<td>예약시간</td>
		</tr>
		<%
        for(int i = 0 ; i < ReservationList.size() ; i++){
            ReservationDTO dto = (ReservationDTO) ReservationList.get(i);
		 %>
		<tr>
			<td><a href="ReservationDetail.re?reservationId=<%=dto.getReservationId()%>&page=<%=request.getParameter("page")%>"><%=dto.getReservationId()%></a></td>
			<td><%=dto.getStoreName() %></td>
			<td><%=dto.getReserveDate() %></td>
			<td><%=dto.getReserveTime() %></td>
		</tr>
		<%
		} 
		%>
	    <tr align=center height=20>
    	    <td colspan=5 style=font-family:Tahoma;font-size:10pt;>
        	    <%
            	if(nowpage<=1){ 
            	%>
            		[이전]&nbsp;
            	<%
            	}else{ 
            	%>
            		<a href="./ReservationList.re?page=<%=nowpage-1 %>">[이전]</a>&nbsp;
            	<%
            	} 
           		%>

            	<%
            	for(int a=startpage;a<=endpage;a++){
                	if(a==nowpage){
            	%>
            	    	[<%=a %>]
                <%
                	}else{ 
                %>
                		<a href="./ReservationList.re?page=<%=a %>">[<%=a %>]</a>&nbsp;
                <%
                	} 
                %>
            	<%
            	} 
            	%>

            	<%
            	if(nowpage>=maxpage){ 
            	%>
            		[다음]
            	<%
             	}else{ 
             	%>
            		<a href="./ReservationList.re?page=<%=nowpage+1 %>">[다음]</a>
            	<%
            	} 
            	%>
        	</td>
    	</tr>
<!--     	
		<tr>
			<td colspan="5">
				<div>
					 <input type="date" id="searchDate" name="searchDate">
					 <input type="text"> <input type="button" value="검색">
				</div>
			</td> 
		</tr>
-->
	</table>
</body>
</html>