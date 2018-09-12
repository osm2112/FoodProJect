/**
 * 
 */
$(function(){
	for(var i = 0; i<5;i++){
		
		var count = $(".charts div").eq(i).html().substring(0,1);
		
		$(".charts div").eq(i).css({'color':'white','font-size':'12px','text-align':'center','padding-top':'3px',
									'border-radius':'30px'});

		var percent = (count/5).toFixed(2)*100;
		
		if(percent==0){
			$(".charts div").eq(i).addClass("chart--p2");
			$(".charts div").eq(i).html("0");
		}
		
		else{
			$(".charts div").eq(i).addClass("chart--p"+percent);
			
		}
	}
	

	to = $("#total").html();
	ta = $("#tasty span").eq(0).html();			//id가 tasty인 요소의 자식요소중 첫번째 요소의 html
	pr = $("#price span").eq(0).html();
	se = $("#service span").eq(0).html();
	
	quo = Math.floor(to);					//평균 점수의 몫을 구해서 몫 까지만 채운 별표로 바꿔줌/ 이하 반복 
	
	$("#totalFas i").eq(quo-1).attr("class","fas fa-star").prevAll().attr("class","fas fa-star");
	
	var mod = to%quo;						// 나머지를 구해서 나머지에 10을 곱한 값이 4 이상이면 반 채워진 별표로 바꿔줌/ 이하 반복
	if((mod.toFixed(1)*10)>=4){
		$("#totalFas i").eq(quo).attr("class","fas fa-star-half-alt");
	}
	
	 quo = Math.floor(ta);
	$("#tasty i").eq(quo-1).attr("class","fas fa-star").prevUntil("#tasty span").attr("class","fas fa-star");
	
	mod = ta%quo;
	
	if((mod.toFixed(1)*10)>4){
		$("#tasty i").eq(quo).attr("class","fas fa-star-half-alt");
	}
	
	quo = Math.floor(pr);
	$("#price i").eq(quo-1).attr("class","fas fa-star").prevUntil("#price span").attr("class","fas fa-star");
	
	mod = pr%quo*10;
	
	if((mod.toFixed(1)*10)>4){
		$("#price i").eq(quo).attr("class","fas fa-star-half-alt");
	}
	
	quo = Math.floor(se);
	$("#service i").eq(quo-1).attr("class","fas fa-star").prevUntil("#service span").attr("class","fas fa-star");;
	
	mod = se%quo*10;
	
	if((mod.toFixed(1)*10)>4){
		$("#service i").eq(quo).attr("class","fas fa-star-half-alt");
	} 
});
	
	
	
	 