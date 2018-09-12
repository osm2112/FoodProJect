<%@page import="food.reservation.dto.ReservationDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ReservationDTO dto = (ReservationDTO) request.getAttribute("ReservationDetail");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약 상세 내용 보기</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1ca096a7e2b482d5f485a1850a725e3a&libraries=services"></script>
<script>
	function GoBackList(){
		var page = document.getElementById("hiddenPageNum").value;
		location.href = "ReservationList.re?page="+page;
	};
	
	function CancelReservation(){
		let reservationId	= document.getElementById("hiddenReservationId").value;
		let page = document.getElementById("hiddenPageNum").value;
		let check = confirm('정말 예약을 취소 하시겠습니까? ');
		if ( check ){
			
        	let form = document.createElement("form");
        	let parm = new Array();
        	let input = new Array();
			let url = "";
				
		   	form.action = "ReservationDelete.re";
        	form.method = "get";
  	    	parm.push(['reservationId', reservationId]);
  	    	parm.push(['page', page]);
  	    	for (let i = 0; i < parm.length; i++) {
            	input[i] = document.createElement("input");
            	input[i].setAttribute("type", "hidden");
        	    input[i].setAttribute('name', parm[i][0]);
    	        input[i].setAttribute("value", parm[i][1]);
	            form.appendChild(input[i]);
        	} 	
        	document.body.appendChild(form);
        	form.submit(); 
		}
	};
</script>
</head>
<body>
<jsp:include page="../../header.jsp"></jsp:include>
	<table border="1">
		<tr>
			<td>예약번호</td>
			<td colspan="3"><%=dto.getReservationId() %></td>
		</tr>
		<tr>
			<td>예약자명</td>
			<td><%=dto.getReserveName() %></td>
			<td>예약인수</td>
			<td><%=dto.getReserveSeat() %></td>
		</tr>
		<tr>
			<td>예약일자</td>
			<td><%=dto.getReserveDate() %></td>
			<td>예약시간</td>
			<td><%=dto.getReserveTime() %></td>
		</tr>
		<tr>
			<td>가게명</td>
			<td><%=dto.getStoreName() %></td>
			<td>식당연락처</td>
			<td><%=dto.getStoreTel() %></td>
		</tr>
		<tr style="display:none;">
			<td><input id = "hiddenStoreAddr" type="hidden" value="<%= dto.getStoreAddr()%>"></td>
			<td><input id = "hiddenStoreName" type="hidden" value="<%= dto.getStoreName()%>"></td>
			<td><input id = "hiddenPageNum"   type="hidden" value="<%= request.getParameter("page")%>"></td>
			<td><input id = "hiddenReservationId"   type="hidden" value="<%= dto.getReservationId()%>"></td>
		</tr>
		<tr>
			<td>장소(지도)</td>
			<td colspan="3">
				<div id ="map" style="width:500px;height:350px;">
				</div> 
				<script>
					var storeAddr= document.getElementById("hiddenStoreAddr").value;
					var storeName= document.getElementById("hiddenStoreName").value;
					var mapContainer = document.getElementById('map'), 
						mapOption = {
							center : new daum.maps.LatLng(33.450701, 126.570667),
							level : 3 
						};
					var map = new daum.maps.Map(mapContainer, mapOption);
					var geocoder = new daum.maps.services.Geocoder();
					geocoder.addressSearch(storeAddr, function(result, status) {
						if (status === daum.maps.services.Status.OK) {
							var coords = new daum.maps.LatLng(result[0].y, result[0].x);
							var marker = new daum.maps.Marker({
								map : map,
								position : coords
							});
							var infowindow = new daum.maps.InfoWindow({
								content : '<div style="padding:5px;">' + storeName + ' <br><a href="http://map.daum.net/link/map/' 
								        + storeName + ',' +result[0].y + ','+result[0].x+'" style="color:blue" target="_blank">큰지도보기</a></div>'     
							});
							infowindow.open(map, marker);
							map.setCenter(coords);
						}
					});
				</script>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<input type="button" value="예약취소" onclick="CancelReservation()">
				<input type="button" value="목록으로" onclick="GoBackList();">
			</td>
		</tr>
	</table>
</body>
</html>