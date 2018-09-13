<%@page import="java.util.List"%>
<%@page import="food.reservation.dto.ReservationDTO"%>
<%@page import="food.reservation.dao.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ReservationDAO dao = new ReservationDAO();
	ReservationDTO dto = new ReservationDTO();
	String storeId = request.getParameter("storeId");
	System.out.println("시발 왜애러나는거야 병신아 왜 니가 21이나옴"+storeId);
	String reserveDate = request.getParameter("reserveDate");
	System.out.println(reserveDate);
	List<ReservationDTO> list = dao.SelectCheckSeat(storeId, reserveDate); 
if(list.size() ==0){ 
%>
<h2>예약 정보가 없습니다.</h2>
<%
} 
else
{ 
%>
<table border="1" style="text-align: center;">
	<tr>
		<td>선택</td>
		<td>일자</td>
		<td>시간</td>
		<td>예약된 좌석수</td>
		<td>총좌석수</td>
		<td>인수</td>
	</tr>
	<%for(int i= 0 ; i < list.size();i++){ %>
	
	<tr id="checkSeat<%=i%>">
		<td><input type="radio" name="dateCheck"></td>
		<td><%= list.get(i).getReserveDate()%></td>
		<td><%= list.get(i).getReserveTime()%></td>
		<td><%= list.get(i).getReserveSeat()%></td>
		<td><%= list.get(i).getReservePermitSeat()%></td>
		<td>
			<input type="number" id="reserveNum" name="reserveNum" class="reserveNum" style="width:50px" value="" />
			<input type="hidden" id="hiddenDate" value="<%=reserveDate %>" value=""/>
			<input type="hidden" id="hiddenTime" value="<%= list.get(i).getReserveTime()%>" value="" />
		</td>
	</tr>
	<%}%>
</table>
<%
}
%>
