/**
 * 
 */

	var today = new Date();
	$(document).ready(function() {

		$('#calendar').fullCalendar({
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,agendaWeek,agendaDay,listWeek'
			},
			defaultDate : today,
			navLinks : true, // can click day/week names to navigate views
			editable : false,
			droppable : false,
			eventLimit : true, // allow "more" link when too many events
			locale : 'ko'
		});

		$(".fc-prev-button").on("click", function() {
			//alert("prev!!!");
			getViewDate();
		});
		$(".fc-next-button").on("click", function() {
			//alert("next!!!");
			getViewDate();
		});
		$(".fc-today-button").on("click", function() {
			//alert("today!!!");
			getViewDate();
		});
 		$(".fc-month-button").on("click", function() {
			//alert("today!!!");
			getViewDate();
		});
		$(".fc-agendaWeek-button").on("click", function() {
			//alert("today!!!");
			getViewDate();
		});
		$(".fc-agendaDay-button ").on("click", function() {
			//alert("today!!!");
			getViewDate();
		});
		$(".fc-listWeek-button").on("click", function() {
			//alert("today!!!");
			getViewDate();
		});
		
 		function calEvent(dayObj) {
			url = "ReservationCalendarProc.re";
			$.ajax({
				dataType : "json",
				data : dayObj,
				type : "POST",
				url : url,
				async : false,
				success : function(data) {
					for (var i = 0; i < data.length; i++) 
					{
						console.log(data[i].title)
						
						$('#calendar').fullCalendar('renderEvent', {
				              title: data[i].title,
				              start: data[i].start,
				              end:data[i].end
				            });
					}

				},
				error : function(request, status, error) {
					console.log("code:" + request.status + "\n" + "message:" +
						request.responseText + "\n" + "error:" +
						error);
				}
			});
		} 
		function getViewDate() {
			var date = $('#calendar').fullCalendar('getView');
			var start  = date.intervalStart.format('YYYY-MM-DD');
 			var end = date.intervalEnd.subtract(1, "days").format('YYYY-MM-DD');
 			var monthObj = {
				startDate : start,
				endDate : end
			};
			$('#calendar').fullCalendar('removeEvents');
			calEvent(monthObj, start, end);
		}
		getViewDate();
	}); 