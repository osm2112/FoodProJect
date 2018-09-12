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
<link rel="stylesheet" href="/Food/css/evalList.css">
<link rel="stylesheet" href="https://cdn.rawgit.com/theus/chart.css/v1.0.0/dist/chart.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="/Food/js/EvalList.js"></script>
<script>
	
	

</script>

</head>
<body>
	<div style="height:20px"></div>
	<%-- <span id="storeId" style="display: none">${edto.store_id}</span> --%>
	<div class="centered2" style="border-top: 1px solid lightgrey;">
		<div class="result">

			<div id="evaluate">
				<img src="/Food/img/edit.png"
					style="width: 40px; height: 40px; margin-top: -10px;display:inline-block"> <span>
					평가 </span>
			</div>

			<div id="totalDiv">
				<div id="total" style="text-align: center">${edto.avr_total}</div>
				<div id="totalFas">
					<i class="far fa-star"></i> <i class="far fa-star"></i> <i
						class="far fa-star"></i> <i class="far fa-star"></i> <i
						class="far fa-star"></i>
				</div>
				<div id="evalCount" style="display:none">${edto.eval_count}</div>
				<div style="font-size: 20px; margin: 5px">총
					${edto.eval_count}명</div>
			</div>

			<div id="chartDiv">
				<div id="starDiv">
					<div>5점</div>
					<div>4점</div>
					<div>3점</div>
					<div>2점</div>
					<div>1점</div>
				</div>
				<div class="charts" style="float: right; width: 380px;">
					<div class="charts__chart chart--blue">${edto.five_count}명</div>
					<div class="charts__chart chart--green">${edto.four_count}명</div>
					<div class="charts__chart chart--red">${edto.three_count}명</div>
					<div class="charts__chart chart--yellow">${edto.two_count}명</div>
					<div class="charts__chart chart--default">${edto.one_count}명</div>
				</div>
			</div>
			<div id="detailDiv">
				<span
					style="display: inline-block; margin-right: -5px; color: grey; font-weight: 800">맛
				</span> <span style="display: inline-block; margin-right: 20px;" id="tasty">
					<span id="hidden">${edto.avr_tasty}</span> <i class="far fa-star"></i>
					<i class="far fa-star"></i> <i class="far fa-star"></i> <i
					class="far fa-star"></i> <i class="far fa-star"></i>
				</span> <span id=""></span> <span
					style="display: inline-block; margin-right: -5px; color: grey; font-weight: 800">가격
				</span> <span style="display: inline-block; margin-right: 20px" id="price">
					<span id="hidden">${edto.avr_price}</span> <i class="far fa-star"></i>
					<i class="far fa-star"></i> <i class="far fa-star"></i> <i
					class="far fa-star"></i> <i class="far fa-star"></i>
				</span> <span
					style="display: inline-block; margin-right: -5px; color: grey; font-weight: 800">서비스
				</span> <span style="margin-right: 20px" id="service"> <span
					id="hidden">${edto.avr_service}</span> <i class="far fa-star"></i>
					<i class="far fa-star"></i> <i class="far fa-star"></i> <i
					class="far fa-star"></i> <i class="far fa-star"></i>
				</span>
				<div style="margin: 10px 5px 10px 0px">※ 홍보 및 비방 등 부적절한 평가는 평점
					산정에 있어 제외될 수 있습니다.</div>
			</div>
		</div>
	</div>
	<span id="listSize">${list.size()}</span>
	<script>
	
	</script>
</body>
</html>