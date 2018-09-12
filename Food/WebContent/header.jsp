<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="icon"
	href="https://asset01.flavr.co.kr/skin/frontend/rwd/flavr/favicon.ico"
	type="image/x-icon" />
<link rel="shortcut icon"
	href="https://asset01.flavr.co.kr/skin/frontend/rwd/flavr/favicon.ico"
	type="image/x-icon" />
<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
<link rel="manifest"
	href="/skin/frontend/rwd/flavr/images/favicon/manifest.json">
<meta name="msapplication-TileImage"
	content="/skin/frontend/rwd/flavr/images/favicon/ms-icon-144x144.png">

<link rel="stylesheet" type="text/css"
	href="https://asset02.flavr.co.kr/media/css_secure/637901f8abadb4061dc6647e4f5ef48d_1533254805.css"
	media="all" />

<meta id="viewport" name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
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
	text-shadow: 1px 1px black;
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
	font-size:25px;
	text-shadow: 1px 1px black;
	font-family: 'Boogaloo';
}  

</style>
</head>
<body class="flavr-body desktop-layout  main-index-index">
	<script>var reactScriptQueue = [];
	</script>
	<header>
		<!--        <div class="chat">-->
		<!--            <a href="javascript: alert('준비중 입니다.');"><i class="icon icon-chat"></i>message</a>-->
		<!--        </div>-->
		<div class="header">
			<a href="<%=request.getContextPath()%>/main.mb" class="th">TASTY HOUSE </a>
		</div>
		<nav class="gnb-nav">
			<ul class="menu-top">
				<li><a href="<%=request.getContextPath()%>/main.mb" id="active">main</a></li>
				<li><a href="/about" id="active">about</a></li>
				<li><a href="<%=request.getContextPath()%>/postList.po" id="active">post</a></li>
				<li><a href="" class="icon icon-my-login"></a></li>
			</ul>
			<ul class="menu-my">
				
				
				<!-- 로그아웃일때 -->
			</ul>
		</nav>
	</header>
	<!-- 슬라이드 메뉴 만들기 예제  http://cpdev.tistory.com/82 -->
</body>
</html>