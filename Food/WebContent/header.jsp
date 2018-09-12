<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/Food/css/header.css">

<link href="https://fonts.googleapis.com/css?family=Boogaloo"
	rel="stylesheet">
<style>
.header {
	background-color: #FF6347;
	font: 40px bold oblique;
	font-weight: 800;
	height: 80px;
	text-align: center;
	padding: 15px 0px 0px 0px;
	text-shadow: 1px 1px grey;
}

a.th {
	padding: 10px;
	color:#FFFAFA;
	font-family: 'Boogaloo';
}
a.th:hover {
	color:#FF6347;
	text-shadow: -1px 0 #D3D7D4, 0 1px #D3D7D4, 1px 0 #D3D7D4, 0 -1px #D3D7D4;
}
#active{
	color:#FFFAFA;
	font-size:20px;
}  

</style>
</head>
<body >
	<script>var reactScriptQueue = [];
	</script>
	<header>
		<div class="header">
			<a href="<%=request.getContextPath()%>/main.mb" class="th">TASTY HOUSE </a>
		</div>
		<nav class="gnb-nav" style="margin-top:5px;">
			<ul class="menu-top">
				<li><a href="<%=request.getContextPath()%>/main.mb" id="active">main</a></li>
				<li><a href="/about" id="active">about</a></li>
				<li><a href="<%=request.getContextPath()%>/postList.po" id="active">post</a></li>
				<li><a href=""><img src="/Food/img/profile.png" style="width:25px;height:23px;vertical-align:center;"></a></li>
			</ul>
			
		</nav>
	</header>
	<!-- 슬라이드 메뉴 만들기 예제  http://cpdev.tistory.com/82 -->
</body>
</html>