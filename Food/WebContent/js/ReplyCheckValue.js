/**
 * Reply 평가하기 작성 check
 */

	
	$(document).ready(function(){
		
		console.log("totalvalue:"+$("#total").val());
		
		$("i").click(function(){
			
			var star = $(this).attr("class");

			console.log(star.substr(0,3));
			if(star.substr(0,3)=="far"){
				$(this).attr("class","fas fa-star");
				$(this).prevAll().attr("class","fas fa-star");
			}
			else{
				$(this).nextAll().attr("class","far fa-star");
			}
			
			var starSpan = $(this).parent().attr("id");
			console.log(starSpan);
			var par = $(this).parent().children("i").index(this)+1;
			console.log(par);
			
			if(starSpan == "to"){
				$("#total").val(par);
			}else if(starSpan == "t"){
				$("#tasty").val(par);			
			}else if(starSpan == "p"){
				$("#price").val(par);
			}else{
				$("#service").val(par);
			}
		});
		
		$(document).on("click","#remove",function(){
			
			var divId = $(this).parent().attr("id");
			console.log(divId);
			
			if(divId == "imgDiv1"){
				console.log($("#img2").is(":visible"));
				
				// imgDiv2 여부 체크
				if($("#img2").is(":visible")){
					var src2 = $("#img2").attr("src");
					var file2 = $("#fileName2").val();
					
					$("#img1").attr("src",src2);
					$("#fileName1").attr("value",file2);
						
					// imgDiv3 여부 체크
						if($("#img3").is(":visible")){
						
							var src3 = $("#img3").attr("src");
							var file3 = $("#fileName3").val();
						
							$("#img2").attr("src",src3);
							$("#fileName2").attr("value",file3);
						
							$("#imgDiv3").remove();
					}else{
						$("#imgDiv2").remove();
					}
					
				}else{
					$("#imgDiv1").remove();
				}
				
				
			}
			else if(divId == "imgDiv2"){
				
				// imgDiv3 여부 체크
				if($("#img3").is(":visible")){
					
					var src3 = $("#img3").attr("src");
					var file3 = $("#fileName3").val();
					
					$("#img2").attr("src",src3);
					$("#fileName2").attr("value",file3);
					$("#imgDiv3").remove();
				}else{
					$("#imgDiv2").remove();
				}
			}else{
				$("#imgDiv3").remove();
			}
		
		})
	});

	function insertImg(fileName){
			
		var count = $(".img").length+1;
		console.log(count);
		
		var path = "http://localhost:8181/Food/upload/";
		
		var imgDiv = "<div id='imgDiv"+count+"'></div>";
			
		$("#photoupload").append(imgDiv);
			
		var img = "<img src='"+path+fileName+"' id='img"+count+"' class='img' style='width:80px;height:80px;'>";
			  
		var x = "<img src='/Food/img/remove.png' id='remove'>&nbsp";
		$("#imgDiv"+count).append(img,x);
			

		console.log(fileName);

		var input1 = "<input type='hidden' name='fileName" + (count)+"' value='"+fileName+"'>";	
		$("#imgDiv"+count).append(input1);
		
	};
	function file_open() {
		var count = $(".img").length+1;
		console.log(count);
		if(count<4){	
			window.open("/Food/eval/upload.jsp", "upload",
					"width=450 height=200 left=300 top=30");
			
		}else{
			alert("최대 3개 까지 첨부 가능합니다.");
			return;
		}
	};
	
	function checkValue()
    {
	  var to = $("#total").val();
	  console.log(document.replyInput.total.value);
	  if(!document.replyInput.total.value){
            alert("가게 전체적으로 평가해주세요.");
            return false;
        }
	  if(!document.replyInput.tasty.value){
          alert("맛에 대해 평가해주세요");
          return false;
      }
	  if(!document.replyInput.price.value){
          alert("가격에 대해 평가해주세요");
          return false;
      }
	  if(!document.replyInput.service.value){
          alert("서비스에 대해 평가해주세요");
          return false;
      }
	  if(!document.replyInput.content.value){
          alert("후기를 작성해주세요.");
          return false;
      }
    };


