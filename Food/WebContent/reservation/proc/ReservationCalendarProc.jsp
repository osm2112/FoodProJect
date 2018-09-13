
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="food.reservation.dto.ReservationCalendarDTO"%>
<%@page import="java.util.List"%>
<%@page import="food.reservation.dao.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String storeId 	 = request.getParameter("storeId");
	String startDate = request.getParameter("startDate");
	String endDate 	 = request.getParameter("endDate");
	
	System.out.println("dddd:"+storeId+startDate+endDate);

	ReservationDAO dao = new ReservationDAO();
	List<ReservationCalendarDTO> list = dao.GetCalendarEvent(storeId, startDate, endDate); 	
	
	JsonArray JsonArray = new JsonArray();
	for(int i = 0 ; i < list.size() ; i++){
		JsonObject JsonObject = new JsonObject();
		JsonObject.addProperty("title", list.get(i).getTitle());
		JsonObject.addProperty("start", list.get(i).getStart());
		JsonObject.addProperty("end", list.get(i).getEnd());
		JsonArray.add(JsonObject);		
	}
	String json =JsonArray.toString();
	out.print(json);
%>