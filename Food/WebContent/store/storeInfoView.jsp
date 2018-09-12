<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ page language="java" import="java.util.*"%>    
<%@ page import="food.store.ex.storeDTO"%>
<%@ page import="food.store.ex.regStoreDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"	crossorigin="anonymous">
<link rel="stylesheet"	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.rawgit.com/theus/chart.css/v1.0.0/dist/chart.css" />
<link rel="stylesheet" href="/Food/css/evalList.css">
<link rel="stylesheet" href="/Food/css/blogList.css">
<link rel="stylesheet" href="/Food/css/storeImgSlide.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
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
.modal {
        text-align: center;
}
 
@media screen and (min-width: 850px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}
 
.modal-dialog {
        display: inline-block;
        text-align:left;
        vertical-align: middle;
}
 .modal-dialog.modal-size{
	 
	width:1000px;
	height:80%;
  	margin-right:29%;
  	margin-top:3%;
  	padding: 0;

} 
.modal-content.modal-size {
	width:1000px;
  	height: auto;
  	min-height: 80%;
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
	<div id="map" style="width:100%;height:400px;"></div>

   <!-- services 라이브러리 불러오기 -->
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d7f85db1d159b0bf8afeee39b0295563&libraries=services"></script>
    <!-- 실제 지도를 그리는 Javascript API를 불러오기 -->
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d7f85db1d159b0bf8afeee39b0295563"></script>
   
   <script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${dto.storeaddr}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
	<div style="width: 100%; height: 120px; background-color: #FF6347;">
		<div class="centered" style="background-color: #FF6347; height: 50px;">&nbsp;&nbsp;
		<span style="font-size: 45px; color: white;" id="storeName">${dto.storename}</span> &nbsp;&nbsp;
		<span style="font-size: 23px; color: white;">${dto.category}</span>
			<div id="lineup">
				<button type="button" class="btn btn-light" data-toggle="modal" data-target="#reserve">예약하기</button> 
			</div>
		</div><hr>
		<div style="background-color: #FF6347; height: 50px;">
				<div class="centered"  style="text-align: right;">
					<div style="font-size: 15px;">
						<input type="hidden" value="${dto.storeid}" name="storeId" id="storeId">
						<img src="<%=request.getContextPath()%>/img/evaluation.png" width="40px" height="40px" id="lineup2">
						<input type="hidden" value="${user_state}" name="userState">
						<input type="hidden" value="${id}" name="id">
						<span style="color: white;" onclick=goEval() id="evalButton">평가하기</span>&nbsp;&nbsp;
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
				<br><span style="float: left; font-size: 17px; color: #A0A5AA;">&nbsp;위치</span><br><br>
				<span name="storeaddrnum">${dto.storeaddrnum}</span><br>
				<span name="storeaddr">${dto.storeaddr}</span>
				<span name="storeaddrdetail">${dto.storeaddrdetail}</span>
			</div><br>
			<div>
				<img src="<%=request.getContextPath()%>/img/phone.png" width="40px" height="40px" style="float: left;">
				<br><span style="float: left; font-size: 17px; color: #A0A5AA;">&nbsp;연락처</span><br><br>
				<span name="tel">${dto.storetel}</span>
			</div>
		</div>
		<div style="height: 210px; width: 450px; float: left;">
			<img src="<%=request.getContextPath()%>/img/foodmenu.png" width="40px" height="40px" style="float: left;">
			<br><span style="float: left; font-size: 17px; color: #A0A5AA;">&nbsp;메뉴 정보</span><br><br>
			<textarea cols="70" rows="8" name="rsmenu" readonly="readonly">${dto1.menu}</textarea>
		</div>
	</div>
<!-- 이미지슬라이드 이미지슬라이드 이미지슬라이드 이미지슬라이드 이미지슬라이드 이미지슬라이드 이미지슬라이드 이미지슬라이드 이미지슬라이드 이미지슬라이드 이미지슬라이드 이미지슬라이드 이미지슬라이드 이미지슬라이드 -->
	<div class="centered">
			<div>
			<!-- Container for the image gallery -->
			<div class="container">

			  <!-- Full-width images with number text -->
			  <div class="mySlides">
 			     <img src="${dto1.img_path}${dto1.filename1}" style="width:100%">
 			 </div>

 			 <div class="mySlides">
 			     <img src="${dto1.img_path}${dto1.filename2}" style="width:100%">
 			 </div>

 			 <div class="mySlides">
 			     <img src="${dto1.img_path}${dto1.filename3}" style="width:100%">
 			 </div>

 			 <div class="mySlides">
			    <img src="${dto1.img_path}${dto1.filename4}" style="width:100%">
 			 </div>

			  <div class="mySlides">
 			     <img src="${dto1.img_path}${dto1.filename5}" style="width:100%">
 			 </div>

 			 <!-- Next and previous buttons -->
 			 <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
 			 <a class="next" onclick="plusSlides(1)">&#10095;</a>

  			<!-- Image text -->
			<div class="caption-container"></div>
 
			  <!-- Thumbnail images -->
			  <div class="row" style="margin-left:0px;">
			    <div class="column">
			      <img class="demo cursor" src="${dto1.img_path}${dto1.filename1}" style="width:100%" onclick="currentSlide(1)">
 			   </div>
 			   <div class="column"> 
 			     <img class="demo cursor" src="${dto1.img_path}${dto1.filename2}" style="width:100%" onclick="currentSlide(2)">
  			  </div>
 			   <div class="column">
 			     <img class="demo cursor" src="${dto1.img_path}${dto1.filename3}" style="width:100%" onclick="currentSlide(3)">
 			   </div>
 			   <div class="column">
 			     <img class="demo cursor" src="${dto1.img_path}${dto1.filename4}" style="width:100%" onclick="currentSlide(4)">
 			   </div>
 			   <div class="column">
 			     <img class="demo cursor" src="${dto1.img_path}${dto1.filename5}" style="width:100%" onclick="currentSlide(5)">
 			   </div> 
  			   </div>
 			 </div>
			</div>		
	</div>

	</script>
	
	<!-- Slide Image -->
	<script>
	
	var slideIndex = 1;
	showSlides(slideIndex);

	// Next/previous controls
	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}

	// Thumbnail image controls
	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}

	function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("demo");
	  var captionText = document.getElementById("caption");
	  if (n > slides.length) {slideIndex = 1}
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	    slides[i].style.display = "none";
	  }
	  for (i = 0; i < dots.length; i++) {
	    dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block";
	  dots[slideIndex-1].className += " active";
	  captionText.innerHTML = dots[slideIndex-1].alt;
	}
	
	</script>

	</div>
	
	<!-- 평가 -->
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
	
	<!-- 평가  -->
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
	
	var store_id = $("#storeId").val();   
	
	function goEval(){
		var id = $("input[name=id]").val();
		var us = $("input[name=userState]").val();
		
		if(!id){
			if (confirm("로그인 후 이용가능합니다.로그인 하시겠습니까?")) {
				location.href = "/Food/member/login.jsp";
			}
		}
		else {
			if(us == "owner"){
				alert("일반 회원만 평가를 할 수 있습니다.^^*");
			}
			else{
				location.href="<%=request.getContextPath()%>/evalInputView.ev?storeid="+store_id;
			}
		}
	}
	function goEvalDel(edel) {
		
		if(confirm("정말 삭제하시겠습니까?")){
			var eval_id = $(edel).attr("id");
			console.log(eval_id);
			
			location.href="<%=request.getContextPath()%>/evalDelete.ev?eval_id="+ eval_id + "&store_id=" + store_id;	
		};
		
	};
	
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
	<div class="modal" id="reserve" role="dialog">
		<div class="modal-dialog modal-center modal-size">
			<div class="modal-content modal-center modal-size">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">예약하기</h4>
					<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
				</div>

				<!-- Modal body -->
				<div class="modal-body" style="">
				<script type="text/javascript" src="./js/ReservationForm.js"></script>	
					<div>
					<table border="1" class="table table-bordered table-sm">
						<tr>
							<td colspan="4" style="padding-left:15px">예약일시 / 인원</td>
						</tr>
						<tr style="height:290px">
							<td colspan="2">
								<table id="calendar" style="border:none;width:380px;text-align:center" >
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
								</table> 
								<script>
									buildCalendar();
								</script>
							</td>
							<td colspan="2"><div id="seatInfo"></div></td>
						</tr>
						<tr>
							<td colspan="4" style="padding-left:15px">예약 고객 정보</td>
						</tr>
						<tr>
							<td style="width:100px;text-align:center;padding-top:7px">이름</td>
							<td style="width:300px"><input type="text" id="reserveName" name="reserveName" style="width:280px"
								class="reserveName" /></td>
							<td style="width:100px;text-align:center;padding-top:7px">연락처</td>
							<td><select id="tel1" style="width:80px;height:30px">
									<option value="">::선택::</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="019">019</option>
							</select> - <input type="text" id="tel2" size="4" value="" maxlength="4" style="width:80px"/>
								- <input type="text" id="tel3" size="4" value="" maxlength="4" style="width:80px"/>
							</td>
						</tr>
						<tr>
							<td colspan="1" style="text-align:center;padding-top:7px">이메일</td>
							<td colspan="3"><input type="email" id="reserveEmail" style="width:280px"
								name="reserveEmail" class="reserveEmail" value="" /></td>
						</tr>
						<tr style="height:75px;">
							<td colspan="1" style="padding-top:30px;text-align:center;">요청사항</td>
							<td colspan="3" style="padding-bottom:-1px"><textarea id="reserveComment" cols="200" rows="3" style="resize:none;width:700px;height:75px"
									name="reserveComment" class="reserveComment"></textarea></td>
						</tr>
					</table>
					</div>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn btn-outline-secondary" onclick="ReserveSubmit();">예약하기</button>
					<button type="button" class="btn btn btn-outline-secondary"   data-dismiss="modal">취소</button>
				</div>

			</div>
		</div>
	</div>
</body>
</html>