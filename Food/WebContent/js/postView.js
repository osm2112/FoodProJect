/**
 * 각 포스트의 뷰 페이지의 자바 스크립트 입니다.
 */
var post_id, id;
var w_id;
$(function() {

	post_id = $("#postId").text();
	console.log("postId:" + post_id);
	id = $("#id").text();

	if (id != "") {
		 w_id = id.substring(0, 3).concat("*****");
		 $("#writeId").text(w_id);
	} else {
		w_id = "";

	}

	$(".image")
			.click(
					function() {

						if (!id) {
							if (confirm("로그인 후 이용가능합니다.로그인 하시겠습니까?")) {
								location.href = "/Food/member/login.jsp";
							}
						}

						var lc = $(this).attr("id");
						console.log(lc);

						if (lc == "like") {
							$.ajax({
										url : "postLike.po?post_id="+post_id +"&write_id=" + id,
										success : function(result) {
											var datas = JSON.parse(result);
											console.log(datas);
											$("#likeCount").html(datas.like);
										}
									})
						} else {
							$.ajax({
										url : "postCommend.po?post_id="+post_id +"&write_id=" + id,
										success : function(result) {
											var datas = JSON.parse(result);
											console.log(datas);
											$("#comCount").html(datas.commend);
										}
									})

						}

					});

	$(".content p").children().css({
		'font-family' : ''
	});
	$(".content p").children("font").attr("face", "");

	

		var formData;

	$.ajax({

		url : "/Food/replyList.rp?post_id=" + post_id,
		success : callbackReply,
	});// end of ajax

	function callbackReply(result) {

		var datas = JSON.parse(result);
		console.log(datas);
		
		var t1,t2,t3,t4,t5,t6,t7,t8,count;
		if (datas.length > 0) {
			
			$("#replyCount").text(datas.length);
			$.each(datas,function(i, o) {

								t1 = "<div class='ReplyCentered2'></div>";
								t2 = "<div class='reply-wrapper'></div>";
								var rr = "<div id='rrList-wrapper' style='display:none'></div>";

								$("#rs-wrapper").append(t1, rr);
								$(".ReplyCentered2").eq(i).append(t2);

								t3 = "<div id='user'><img src='/Food/img/user-g.png' style='width:40px;height:40px;'></div>";
								t4 = "<div class='replyList'></div>";
								t8 = "<div style='float:right;margin-top:15px;margin-right:10px'><img src='/Food/img/menu2.png' style='width:20px;height:20px'></div>"

								$(".reply-wrapper").eq(i).append(t3, t4,
										t8);

								t5 = "<div id='write_id' style='padding:5px 0px'>"
										+ o.write_id
										+ "&nbsp;&nbsp;&nbsp;"
										+ o.re_date + "</div>";
								t6 = "<div style='padding:5px 0px'>"
										+ o.re_content + "</div>";
								
								if(o.re_count == 0){
									count = "";
								}
								else {
									count = o.re_count;
								}
								t7 = "<div style='padding:5px 0px'>"
										+ " <input type='hidden' name='reply_id' value='"
										+ o.reply_id
										+ "'>"
										+ "<button id='rrButton'>답글 <span id='cnt" + o.reply_id + "'>"+ count + "</span></button></div>";

								$(".replyList").eq(i).append(t5, t6,t7);

							});

						}
					}

	$(".replyButton").click(function() {
		formData = $("form[name=Reply]").serialize();

		$.ajax({
			type : "POST",
			url : "/Food/replyInput.rp",
			data : formData,
			success : callbackAdd,
		});
	});

	function callbackAdd(result) {
		
		
		var datas = JSON.parse(result);

		console.log(datas);
		var count = parseInt($("#replyCount").html());
		$("#replyCount").text(count+1);
		
		var text1 = "<div class='ReplyCentered2'></div>";
		var text2 = "<div class='reply-wrapper'></div>";
		var rr = "<div id='rrList-wrapper' style='display:none'></div>";

		$("#rs-wrapper").prepend(text1, rr);
		$(".ReplyCentered2").eq(0).append(text2);

		var text3 = "<div id='user'><img src='/Food/img/user-g.png' style='width:40px;height:40px;'></div>";
		var text4 = "<div class='replyList'></div>";
		var text8 = "<div style='float:right;margin-top:15px;margin-right:10px'><img src='/Food/img/menu2.png' style='width:20px;height:20px'></div>"

		$(".reply-wrapper").eq(0).append(text3, text4, text8);

		var text5 = "<div id='write_id' style='padding:5px 0px'>"
				+ datas.write_id + "&nbsp;&nbsp;&nbsp;" + datas.re_date
				+ "</div>";
		var text6 = "<div style='padding:5px 0px'>" + datas.re_content
				+ "</div>";
		
		var text7 = "<div style='padding:5px 0px'>"
				+ " <input type='hidden' name='reply_id' value='"
				+ datas.reply_id + "'>"
				+ "<button id='rrButton'>답글 <span id='cnt" + datas.reply_id + "'></span></button></div>";

		$(".replyList").eq(0).append(text5, text6, text7);

		$("form[name=Reply] #r_content").val("");

		}


});


$(document).on("click","#rrButton",function(){
	
	id = $("#id").text();

	if (id != "") {
		 w_id = id.substring(0, 3).concat("*****");
		 $("#writeId").text(w_id);
	} else {
		w_id = "";

	}

	var reply_id = $(this).prev().val();
	var rw = $(this).parent().parent().parent().parent().next();
	
	if(rw.is(":visible")){
		rw.children().remove();
		rw.hide();
	}

	else{
	$.ajax({

		url : "/Food/rrList.rp?reply_id="+reply_id,
		success : callbackReRe,
	});// end of ajax 

	function callbackReRe(result) {

		rw.show();

		var datas = JSON.parse(result);
		console.log(datas);

		var t,t1,t2,t3,t4,t5,t6,t7;
		
		t = "<div id='rr" + reply_id +"'></div>";
		rw.prepend(t);
		if(datas.length>0){
		
		$.each(datas,function(i,o){
			
			
			t1 = "<div class='" + reply_id + "' id='rrCentered' style='background-color:#F5F5F5'></div>";
			t2 = "<div class='" + reply_id + "' id='rr-wrapper'></div>";
			t = "<div id='user'><img src='/Food/img/right-arrow.png' style='width:25px;height:25px'></div>";
			t3 = "<div id='user'><img src='/Food/img/user-g.png' style='width:40px;height:40px;'></div>";
			t4 = "<div class='" + reply_id + "' id='rrList'></div>";
			t5 = "<div style='float:right;margin-top:15px;margin-right:10px'>"
				+ "<img src='/Food/img/menu2.png' style='width:20px;height:20px'></div>";
			t6 = "<div id='write_id' style='padding:5px 0px'>"
				+ o.write_id + "&nbsp;&nbsp;&nbsp;" + o.re_date + "</div>";
			t7 = "<div style='padding:5px 0px'>" + o.re_content + "</div>";
		
			
			$("#rr"+reply_id).append(t1);
			$("#rrCentered[class*='"+reply_id +"']").eq(i).append(t2);
			$("#rr-wrapper[class*='"+reply_id +"']").eq(i).append(t,t3,t4,t5);
			$("#rrList[class*='"+reply_id +"']").eq(i).append(t6,t7);
		
			});
		}

		var inx = datas.length;
	
		rw.append("<div class='" + reply_id + "' id='rrCentered' style='background-color:#F5F5F5'></div>");
	
		t1 = "<div class='" + reply_id + "' id='rr-wrapper'></div>";
		t2 = "<div id='rr-close'>답글 닫기</div>";
		t3 = "<form name='ReRe' id='form" + reply_id + "'</form>";
		t4 = "<input type='hidden' name='write_id' value='" + id + "'>";
		t5 = "<input type='hidden' name='post_id'	value='" + post_id + "'>";
		t6 = "<fieldset id='replyReply" + reply_id + "' class='replyReply' style='padding-right:-2px;background-color:white;'></fieldset>";
		$("#rrCentered[class*='"+reply_id +"']").eq(inx).append(t1,t2);
		$("#rr-wrapper[class*='"+reply_id +"']").eq(inx).append(t3);
		$("#form"+reply_id).append(t4,t5,t6);
	
		t1 = "<div id='writeId' style='margin:10px 0px 5px 15px;height:25px;'>" + w_id + "</div>";
		t2 = "<textarea cols='100' rows='10' style='width:680px;'" 
			+ "placeholder='주제와 무관한 댓글,악플은 삭제 될 수 있습니다.' name='re_content' id='r_content'></textarea>";
		t3 = "<div style='border-top:1px solid lightgrey;margin-top:10px;height:45px;padding:5px'>"
		     + "<span style='float:right;margin-top:-5px;margin-right:-5.5px'>"
		     + "<input type='hidden' name='reply_id' value='" + reply_id + "'>"
		     + "<button id='rrSubmit' type='button'>등록</button></div>";
	
		$("#replyReply"+reply_id).append(t1,t2,t3);
		}
	
	}
})

$(document).on("click","#rr-close",function(){
	console.log("clickyyyy");
	$(this).parent().parent().css("display","none");
	$(this).parent().parent().children().remove();
	

}); 

$(document).on("click","#rrSubmit",function(){
	
	reply_id = $(this).prev().val();
	console.log(reply_id);

	formData = $("form[name=ReRe]").serialize();

	$.ajax({
		type : "POST",
		url : "/Food/rrInput.rp",
		data : formData,
		success : callbackReReAdd,
	});
	
	function callbackReReAdd(result) {
		
		var inx = $("#rrCentered[class*='"+reply_id +"']").length-1;
		var count ;
		
		console.log(inx);
		var datas = JSON.parse(result);
		console.log(datas);
		
		if(datas != ""){
		
		if($("#cnt"+reply_id).html() == ""){
			count = 1;
		}
		else {
			count = parseInt($("#cnt"+reply_id).html())+1 ;
		}
			
		$("#cnt"+reply_id).text(count);
		
		var t,t1,t2,t3,t4,t5,t6,t7;
			
			t1 = "<div class='" + reply_id + "' id='rrCentered' style='background-color:#F5F5F5'></div>";
			t2 = "<div class='" + reply_id + "' id='rr-wrapper'></div>";
			t = "<div id='user'><img src='/Food/img/right-arrow.png' style='width:25px;height:25px'></div>";
			t3 = "<div id='user'><img src='/Food/img/user-g.png' style='width:40px;height:40px;'></div>";
			t4 = "<div class='" + reply_id + "' id='rrList'></div>";
			t5 = "<div style='float:right;margin-top:15px;margin-right:10px'>"
				+ "<img src='/Food/img/menu.png' style='width:25px;height:25px'></div>";
			t6 = "<div id='write_id' style='padding:5px 0px'>"
				+ datas.write_id + "&nbsp;&nbsp;&nbsp;" + datas.re_date + "</div>";
			t7 = "<div style='padding:5px 0px'>" + datas.re_content + "</div>";
		
			
			$("#rr"+reply_id).append(t1);
			$("#rrCentered[class*='"+reply_id +"']").eq(inx).append(t2);
			$("#rr-wrapper[class*='"+reply_id +"']").eq(inx).append(t,t3,t4,t5);
			$("#rrList[class*='"+reply_id +"']").eq(inx).append(t6,t7);
			
			$("form[name=ReRe] #r_content").val("");
		}
	}
})
$(document).on("click","#r_content",function() {
		console.log("click");
			if (id == "") {
				if (confirm("로그인 후 이용 가능합니다. 로그인 하시겠습니까?")) {
					location.href = "/Food/member/login.jsp";
				};
			$(this).attr("readonly","readonly");
		}
})

