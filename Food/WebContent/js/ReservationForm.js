/**
 * 예약폼 
 */

let today = new Date();
let date = new Date();
function prevCalendar() {
	if (today.getFullYear() == date.getFullYear() && today.getMonth() == date.getMonth()) {

	} else {
		today = new Date(today.getFullYear(), today.getMonth() - 1, 1);
		buildCalendar();
		$("div[id^=day]").css("cursor","default");
	}
}

function nextCalendar() {
	today = new Date(today.getFullYear(), today.getMonth() + 1, 1);
	buildCalendar();
	$("div[id^=day]").css("cursor","default");
}

function buildCalendar() {
	let doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
	let lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
	let tbCalendar = document.getElementById("calendar");
	let tbCalendarYM = document.getElementById("tbCalendarYM");
	tbCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월";
	while (tbCalendar.rows.length > 2) {
		tbCalendar.deleteRow(tbCalendar.rows.length - 1);
	}
	let row = null;
	row = tbCalendar.insertRow();
	let cnt = 0;
	for (i = 0; i < doMonth.getDay(); i++) {
		cell = row.insertCell();
		cnt = cnt + 1;
	}
	for (i = 1; i <= lastDate.getDate(); i++) {
		cell = row.insertCell();
		cnt = cnt + 1;
		if (today.getFullYear() == date.getFullYear()
			&& today.getMonth() == date.getMonth()
			&& i < date.getDate()) {
			cell.bgColor = "lightgray";
			if (cnt % 7 == 1) {
				cell.innerHTML = "<div><font color=gray>" + i + "</font></div>";
			}
			if (cnt % 7 == 0) {
				cell.innerHTML = "<div><font color=gray>" + i + "</font></div>";
				row = calendar.insertRow();
			}
			cell.innerHTML = "<div><font color=gray>" + i + "</font></div>";

		} else {
			if (cnt % 7 == 1) {
				cell.innerHTML = "<div id='day" + i + "' onclick='SeatCheck(" + i + ")'><font color=red>" + i + "</font></div>";
			} else if (cnt % 7 == 0) {
				cell.innerHTML = "<div id='day" + i + "'  onclick='SeatCheck(" + i + ")'><font color=blue>" + i + "</font></div>";
				row = calendar.insertRow();
			} else {
				cell.innerHTML = "<div id='day" + i + "'  onclick='SeatCheck(" + i + ")'>" + i + "</div>";
			}
		}
		if (today.getFullYear() == date.getFullYear()
			&& today.getMonth() == date.getMonth()
			&& i == date.getDate()) {
			cell.bgColor = "#FAF58C";
		}
	}
}

function SeatCheck(i) {
	let year = today.getFullYear();
	let month = today.getMonth() + 1;
	let day = i;
	let reserveDate = year + '/' + month + '/' + day;
	let storeId = document.getElementById("storeId").value;
	let xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("seatInfo").innerHTML = this.responseText;
		}
	};
	xhttp.open("Post", "./ReservationSeatCheckProc.re?storeId=" + storeId + "&reserveDate=" + reserveDate, true);
	xhttp.send();

	let lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
	let index = lastDate.getDate();
	let toDayDate = 1;
	if (today.getFullYear() == date.getFullYear()
		&& today.getMonth() == date.getMonth()) {
		toDayDate = date.getDate();
	}
	for (let j = toDayDate; j <= index; j++) {
		if (today.getFullYear() == date.getFullYear()
			&& today.getMonth() == date.getMonth()
			&& j == date.getDate()) {
			document.getElementById("day" + j).style.background = "#FAF58C";
		} else {
			document.getElementById("day" + j).style.background = "white";
		}
	}
	document.getElementById("day" + i).style.background = "lightblue";
}

function ReserveSubmit() {
	let reserseStoreId = document.getElementById("storeId").value;
	let reserveName = document.getElementById("reserveName").value;
	let reserveDate;
	let reserveTime;
	let reserveSeat;
	if(document.querySelector('input[name="dateCheck"]:checked') !=null ){
		reserveDate = document.querySelector('input[name="dateCheck"]:checked').parentNode.parentNode.childNodes.item(11).childNodes.item(3).value;
		reserveTime = document.querySelector('input[name="dateCheck"]:checked').parentNode.parentNode.childNodes.item(11).childNodes.item(5).value;
		reserveSeat = document.querySelector('input[name="dateCheck"]:checked').parentNode.parentNode.childNodes.item(11).childNodes.item(1).value;
	} else {
		reserveDate = '';
		reserveTime = '';
		reserveSeat = '';
	}
	let reserveTel = document.getElementById("tel1").value + "-" + document.getElementById("tel2").value + "-" + document.getElementById("tel3").value;
	let reserveEmail = document.getElementById("reserveEmail").value;
	let reserveComment = document.getElementById("reserveComment").value;
	let form = document.createElement("form");
	let parm = new Array();
	let input = new Array();
	let url = "";
	let check = confirm('성명 : ' + reserveName + '\n' + '예약인원 : ' + reserveSeat + '\n' + '예약일자: ' + reserveDate + '\n'
		+ '예약시간 : ' + reserveTime + '\n' + '연락처 : ' + reserveTel + '\n' + '이메일: ' + reserveEmail + '\n'
		+ '요청사항 : ' + reserveComment + '\n' + '해당 내용으로 예약 하시겠습니까?');
	
	if( document.querySelector('input[name="dateCheck"]:checked') == null ){
		alert('에약 일시 및 인원 정보가 입력되지 않았습니다 ');
		return false;
	}
		
	if (check) {

		if (!document.getElementById("reserveName").value) {
			alert('예약자 명이 입력되지 않았습니다.');
			return false;
		}

		if (!document.getElementById("tel1").value || !document.getElementById("tel2").value || !document.getElementById("tel3").value) {
			alert('전화번호가 입력 되지 않았습니다.');
			return false;
		} else {
			var regexp = /^[0-9]*$/;
			if (!regexp.test(document.getElementById("tel1").value) || !regexp.test(document.getElementById("tel2").value) || !regexp.test(document.getElementById("tel3").value)) {
				alert('전화번호는 숫자이여야 합니다.');
				return false;
			}
		}

		if (!document.getElementById("reserveEmail").value) {
			alert('이메일이 입력되지 않았습니다.');
			return false;
		} else {
/*			var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
			if (!regexp.test(document.getElementById("email"))) {
				alert('이메일은 ooo@ooo.com 양식으로 입력하여야 합니다.');
				return false;
			}*/
		}
		form.action = "./ReservationInsert.re";
		form.method = "post";
		parm.push([ 'reserseStoreId', reserseStoreId ]);
		parm.push([ 'reserveName', reserveName ]);
		parm.push([ 'reserveDate', reserveDate ]);
		parm.push([ 'reserveTime', reserveTime ]);
		parm.push([ 'reserveSeat', reserveSeat ]);
		parm.push([ 'reserveTel', reserveTel ]);
		parm.push([ 'reserveEmail', reserveEmail ]);
		parm.push([ 'reserveComment', reserveComment ]);
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
	
}