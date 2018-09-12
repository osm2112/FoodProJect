/**
 * 			임시로 평가하기와 블로그 후기 리스트를 가져오도록 만든 tempEval.jsp 페이지의 자바스크립트
 */


	$(function(){
		
			
		////////평가 리스트 ///////////
		
		var store_id = $("#storeId").val();
		console.log(store_id);
			
		$.ajax({		
				url : "/Food/evalList.ev?store_id="+store_id,
				async: true,
				success : function(result){ $("#evalTotal").html(result)},
				
			});// end of ajax
			
		
			var startView = 0;
			var perView = 5;
			var endView = startView + perView;
			
			function setView() {
				
				//평가하기 리스트가 더 이상 보여줄게 없을 떄 more1 버튼 사라짐
				var l = $("#evalCount").text();
				console.log(l);
				
				if(l <= endView)		 
				{$("#more1").hide();}
				
				startView = endView;
				endView = startView + perView;				
			};	
			
			$.ajax({
				
				 url : "/Food/evalListDO.ev?store_id="+store_id, 
				/*url : "/Food/evalListDO.ev?store_id=store0021",*/
				success : callbackEval,
					
			});// end of ajax
			
			function callbackEval(result){
				
				var datas = JSON.parse(result);
				
				var l = $("#evalCount").text();
				console.log(l);
				
				if(l <= endView)		 
				{$("#more1").hide();}
				
				if(datas.length>0){
					
					var $items = datas.slice(startView,endView);
					
					var text1,text2,text3,text4,text5,text6;
					$.each($items,function(i,o){
						
						i += startView;
				
						$("#evalView").append("<div class='eval-wrapper'></div>");
						$(".eval-wrapper").eq(i).append("<div class='evalList'></div>");
						text1 = "<div id='user'><img src='/Food/img/user.png' style='width:50px;height:50px'></div>";
						text2 = "<div class='eval'></div>";
						
						$(".evalList").eq(i).append(text1,text2);
						
					    text1 = "<div id='ex'>" + o.write_id + "&nbsp;&nbsp;"+o.eval_date+"</div>";
					    text2 = "<div id='ex' class='totalCount'></div>";
						text3 = "<div class='dt-wrapper'></div>";
						text4 = "<div class='ev_content'></div>";
						text5 = "<div style='height:130px' class='img-wrapper'>";
						$(".eval").eq(i).append(text1,text2,text3,text4,text5);
						
						text1 = "<span id='hidden'>"+o.total+"</span>";
						$(".totalCount").eq(i).append(text1);
						
						text1 = "<span style='display:inline-block;margin-right:-5px;color:grey;font-weight:800'>맛 </span>";
						text2 = "<span style='display:inline-block;margin-right:20px;' class='tastyCount'></span>";
						text3 = "<span style='display:inline-block;margin-right:-5px;color:grey;font-weight:800'>가격 </span>";
						text4 = "<span style='display:inline-block;margin-right:20px' class='priceCount' ></span>";
						text5 = "<span style='display:inline-block;margin-right:-5px;color:grey;font-weight:800'>서비스 </span>";
						text6 = "<span style='margin-right:20px' class='serviceCount'></span>";
						
						$(".dt-wrapper").eq(i).append(text1,text2,text3,text4,text5,text6);
						
						text1 = "<span id='hidden'>"+o.tasty+"</span>";
						$(".tastyCount").eq(i).append(text1);
						
						text1 = "<span id='hidden'>"+o.price+"</span>";
						$(".priceCount").eq(i).append(text1);
						
						text1 = "<span id='hidden'>"+o.service+"</span>";
						$(".serviceCount").eq(i).append(text1);
						
						for(var j=0;j<5;j++){
							
							var far = "<i class='far fa-star'><i>";
							
							$(".totalCount").eq(i).append(far);
							$(".tastyCount").eq(i).append(far);
							$(".priceCount").eq(i).append(far);
							$(".serviceCount").eq(i).append(far);
							
						}
						$(".evalContent").eq(i).append(o.eval_content);
						
						var img = o.filename1;
						if((img.charAt(img.length-1))!='#'){
						text1 = "<img src='"+o.filename1+"' style='width:150px;height:120px;' id='img1' onclick='imgbigView(this);return false'>";
						$(".img-wrapper").eq(i).append(text1);
						}
						
						img = o.filename2;
						if((img.charAt(img.length-1))!='#'){
						text2 = "<img src='"+o.filename2+"' style='width:150px;height:120px;' id='img2' onclick='imgbigView(this);return false'>";
						$(".img-wrapper").eq(i).append(text2);
						}
						
						img = o.filename3;
						if((img.charAt(img.length-1))!='#'){
						text3 = "<img src='"+o.filename3+"' style='width:150px;height:120px;' id='img3' onclick='imgbigView(this);return false'>";
						$(".img-wrapper").eq(i).append(text3);
						}
						
						text4 = "<div id='bigimg' style='display:none;'><img src='' width='800' style='border:1px solid black' onclick ='hide(this)'/></div>";
						$(".img-wrapper").eq(i).append(text4);
						
						var cnt = $("#evalCount").text();      
						 
						
						var to =  $(".totalCount").eq(i).children().eq(0).html();			//totalCount class i번째의 자식요소중 첫번째 요소의 html 
				   	 	var ta = $(".tastyCount").eq(i).children().eq(0).html();
						var pr = $(".priceCount").eq(i).children().eq(0).html();
						var se = $(".serviceCount").eq(i).children().eq(0).html();
							
						var quo = Math.floor(to);
						for(var j = 0; j<quo; j++){
							$(".totalCount").eq(i).children("i").eq(j).attr("class","fas fa-star");
						}
						quo = Math.floor(ta);
						for(var j = 0; j<quo; j++){
							$(".tastyCount").eq(i).children("i").eq(j).attr("class","fas fa-star");
						}
						quo = Math.floor(pr);
						for(var j = 0; j<quo; j++){
							$(".priceCount").eq(i).children("i").eq(j).attr("class","fas fa-star");
						}
						quo = Math.floor(se);
						for(var j = 0; j<quo; j++){
							$(".serviceCount").eq(i).children("i").eq(j).attr("class","fas fa-star");
						}
					 
						
					});
					
					
					setView(datas.length);
				   } 
				};
				
				$("#more1").click(function() {
					
					$.ajax({
						url : "/Food/evalListDO.ev?store_id="+store_id,
						success : callbackEval,
					});// end of more1

				});
				
			
			
			
			///////////블로그 리스트 ////////////////////
			
			$("#count").hide();
			
			var sn = $("#storeName").text();
			console.log(sn);
			
			$.ajax({
				
				url : "/Food/searchBlog.bo?keyword="+sn,
				success : callbackBlog,
			});// end of ajax
			
			function callbackBlog(result) {
		
				var datas = JSON.parse(result);
	
				for(var i = 0; i<datas.display; i++){
					
					var title = "<span class='btitle'>" +"<a href="+datas.items[i].bloggerlink+">"
								+datas.items[i].title + "</a></span>";
					var date = (datas.items[i].postdate); 
						
					var dateFormat = "<span class='date'>" + date.substring(0,4)+"-"+date.substring(4,6) +"-"+ date.substring(6,8) + "</span>";
					var des = "<span class='atitle'>" + datas.items[i].description.substring(50) + "</span>";
					var name = "<span  class='name'> by " + datas.items[i].bloggername + "</span>";
					
					$("#list").append( title,dateFormat,des,name);
				}
				$("#count").html(datas.start);
			};
			
			$("#more2").click(function() {
				
				var count = $("#count").html();
				
				$.ajax({
					
					url : "/Food/searchBlog.bo?keyword="+sn +"&start=" + count,
					success : callbackBlog,
				});// end of more2
			});
			
			
			
		});
		
	