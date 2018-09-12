<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>



</head>
<body>
	<!-- Button to Open the Modal -->
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#myModal">Open modal</button>

	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Modal Heading</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<table border="1" style="width:80%; height:500px">
						<tr>
							<td colspan="4">예약일시 / 인원</td>
						</tr>
						<tr>
							<td colspan="2">
								<table id="calendar" border="3" align="center"
									style="border-color: black">
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
						<tr>
							<td colspan="4"><input type="button"
								onclick="ReserveSubmit();" value="예약하기" /> <input type="button"
								value="예약취소" /></td>
						</tr>
					</table>





				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>




</body>
</html>