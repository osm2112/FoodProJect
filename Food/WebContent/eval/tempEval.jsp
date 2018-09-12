<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.rawgit.com/theus/chart.css/v1.0.0/dist/chart.css" />
<link rel="stylesheet" href="/Food/css/evalList.css">
<link rel="stylesheet" href="/Food/css/blogList.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="/Food/js/EvalBlogList.js?ver=1"></script>


<style>


</style>

</head>
<body>
	<div id="evalTotal"></div>
	<div id="evalView"></div>
	<div class="centered">
		<div class="more" id ="more1">more</div>
	</div>
	<div class="centered">
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
	<div class="centered">
		<div class="more" id = "more2">more</div>
	</div>
	<jsp:include page="../footer.html"/>
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
</body>
</html>