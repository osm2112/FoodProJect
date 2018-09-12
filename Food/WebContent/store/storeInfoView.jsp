<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.FileUpload"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileOutputStream"%>    
   
<%@ page language="java" import="java.util.*"%>    
<%@ page import="food.store.ex.storeDTO"%>
<%@ page import="food.store.ex.regStoreDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet"	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.rawgit.com/theus/chart.css/v1.0.0/dist/chart.css" />
<link rel="stylesheet" href="/Food/css/evalList.css">
<link rel="stylesheet" href="/Food/css/blogList.css">
<script type="text/javascript" src="/Food/js/EvalBlogList.js?ver=1"></script>	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tasty House '${dto.storename}'</title>
<style>
.centered {
	margin-left: auto;
	margin-right: auto;
	width: 900px;
}
.infobox {
	margin-left: 10px;
	margin-right: 10px;
	width: 900px;
}
hr {
	color: white;
	border-color: white;
	background-color: white;
}
.hr2 {
	color: #FF6347;
	border-color: #FF6347;
	background-color: #FF6347;
}
#lineup {
	float: right;
	margin-top:15px;
}
#lineup2 {
	display: inline-block;
}
#evalButton {
	cursor:pointer;
}
</style>


</head>
<body>
<%	
	storeDTO dto = (storeDTO)request.getAttribute("dto");
	System.out.println(dto);
	regStoreDTO dto1 = (regStoreDTO)request.getAttribute("dto1");
%>
	<jsp:include page="../header.jsp"></jsp:include>
	<div style="width: 100%; height: 400px;">지도api넣을곳</div>
	<div style="width: 100%; height: 120px; background-color: #FF6347;">
		<div class="centered" style="background-color: #FF6347; height: 50px;">&nbsp;&nbsp;
		<span style="font-size: 45px; color: white; font-family: 나눔바른펜;" id="storeName">${dto.storename}</span> &nbsp;&nbsp;
		<span style="font-size: 23px; color: white; font-family: 나눔바른펜;">${dto.category}</span>
			<div id="lineup">
				<button type="button" class="btn btn-light btn-lg" data-toggle="modal" data-target="#reserve">예약하기</button> 
			</div>
		</div><hr>
		<div style="background-color: #FF6347; height: 50px;">
				<div class="centered"  style="text-align: right;">
					<div style="font-size: 15px;">
						<input type="hidden" value="${dto.storeid}" name="storeId" id="storeId">
						<img src="<%=request.getContextPath()%>/img/evaluation.png" width="40px" height="40px" id="lineup2">
						<span style="color: white;" onclick="location.href='<%=request.getContextPath()%>/evalInputView.ev?storeid=${dto.storeid}'" id="evalButton">평가하기</span>&nbsp;&nbsp;
						<img src="<%=request.getContextPath()%>/img/like_w.png" width="40px" height="40px" id="lineup2">
						<span style="color: white;">좋아요</span>
					</div>
				</div>
		</div>
	</div>
	<div class="centered">
	<div class="centered" style="height: 250px;"><br>
		<div style="height: 210px; width: 450px; float:left;">
			<div>
				<img src="<%=request.getContextPath()%>/img/pin.png" width="40px" height="40px" style="float: left;">
				<br><span style="float: left; font-size: 17px; color: #A0A5AA; font-family: 나눔바른펜;">&nbsp;위치</span><br><br>
				<span name="storeaddrnum">${dto.storeaddrnum}</span><br>
				<span name="storeaddr">${dto.storeaddr}</span>
				<span name="storeaddrdetail">${dto.storeaddrdetail}</span>
			</div><br>
			<div>
				<img src="<%=request.getContextPath()%>/img/phone.png" width="40px" height="40px" style="float: left;">
				<br><span style="float: left; font-size: 17px; color: #A0A5AA; font-family: 나눔바른펜;">&nbsp;연락처</span><br><br>
				<span name="tel">${dto.storetel}</span>
			</div>
		</div>
		<div style="height: 210px; width: 450px; float: left;">
			<img src="<%=request.getContextPath()%>/img/foodmenu.png" width="40px" height="40px" style="float: left;">
			<br><span style="float: left; font-size: 17px; color: #A0A5AA; font-family: 나눔바른펜;">&nbsp;메뉴 정보</span><br><br>
			<textarea cols="70" rows="8" name="rsmenu" readonly="readonly">${dto1.menu}</textarea>
		</div>
	</div>
	<hr>
		<div class="centered">
			<div>
			이미지 불러올곳
			<img src="">
			
			</div>





		</div>
	</div>
	<div class="size"></div>
	<div id="evalTotal"></div>
	<div id="evalView"></div>
	<div class="centered3">
		<div class="more" id ="more1">more</div>
	</div>
	<div class="centered3">
			<div class="size"></div>
			<div class="title">
				<input type="hidden" name="store_id" value="1"> 
				<span class="sname">
				<input type="hidden" name="store_name">블로그 후기
				</span> 
			</div>
			<div id = "list" class="list">
				
			</div>
			
			
	</div>
	<div id = "count"></div>
	<div class="centered3">
		<div class="more" id = "more2">more</div>
	</div>
	
	<script>

	function imgbigView(img) {

		var big = $(img).parent().children().last()
		var bigImg = $(big).children("img");
		$(bigImg).attr("src",$(img).attr("src"));
		var display = $(big).css('display');
		
		if(display == 'block'){
			$(big).css('display','none');
		}else {
			$(big).css('display','block');
		}
		
	};

	function hide(big){
		$(big).parent().css('display','none');
	};
	</script>
<jsp:include page="../footer.html"></jsp:include>

	<!-- 에약을 위한 모달 창 -->
	<div class="modal" id="reserve">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">예약하기</h4>
					<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
				</div>

				<!-- Modal body -->
				<div class="modal-body" style="text-align:center;">
				<script type="text/javascript" src="./js/ReservationForm.js"></script>	
					<div>
					<table border="1" style="width: 80%;">
						<tr>
							<td colspan="4">예약일시 / 인원</td>
						</tr>
						<tr>
							<td colspan="2">
								<table id="calendar" border="3" align="center" style="border-color: black; width:150px" >
									<tr>
										<td><label onclick="prevCalendar()"> < </label></td>
										<td align="center" id="tbCalendarYM" colspan="5">yyyy년 m월</td>
										<td><label onclick="nextCalendar()"> > </label></td>
									</tr>
									<tr>
										<td align="center"><font color="red">일</font></td>
										<td align="center">월</td>
										<td align="center">화</td>
										<td align="center">수</td>
										<td align="center">목</td>
										<td align="center">금</td>
										<td align="center"><font color="blue">토</font></td>
									</tr>
								</table> <script>
									buildCalendar();
								</script>
							</td>
							<td colspan="2"><div id="seatInfo"></div></td>
						</tr>
						<tr>
							<td colspan="4">예약 고객 정보</td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" id="reserveName" name="reserveName"
								class="reserveName" /></td>
							<td>연락처</td>
							<td><select id="tel1">
									<option value="">::선택::</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="019">019</option>
							</select> <input type="text" id="tel2" size="4" value="" maxlength="4" />
								<input type="text" id="tel3" size="4" value="" maxlength="4" />
							</td>
						</tr>
						<tr>
							<td colspan="1">이메일</td>
							<td colspan="3"><input type="email" id="reserveEmail"
								name="reserveEmail" class="reserveEmail" value="" /></td>
						</tr>
						<tr>
							<td colspan="1">요청사항</td>
							<td colspan="3"><textarea id="reserveComment"
									name="reserveComment" class="reserveComment"></textarea></td>
						</tr>
					</table>
					</div>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" onclick="ReserveSubmit();">예약하기</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
				</div>

			</div>
		</div>
	</div>
</body>
</html>