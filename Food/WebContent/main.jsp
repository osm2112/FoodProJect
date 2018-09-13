<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="app" ng-id="app">
<head>
<link rel="alternate" media="handheld" href="http://m.diningcode.com" />
<link rel="shortcut icon"
	href="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/favicon.ico"
	type="image/x-icon" />
<meta charset="utf-8">
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<link href="https://fonts.googleapis.com/css?family=Lobster"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Boogaloo"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Caveat Brush"
	rel="stylesheet">	
<link href="https://fonts.googleapis.com/css?family=Playball"
	rel="stylesheet">	
<link href="https://fonts.googleapis.com/css?family=Cherry Swash"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Londrina Outline"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Finger Paint"
	rel="stylesheet">				
	
	   	
<!-- jQuery -->
<script type="text/javascript"
	src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/jquery/1.11.2/jquery.min.js?2018072001"></script>
<script type="text/javascript"
	src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/jqueryui/1.11.4/jquery-ui.min.js?2018072001"></script>
<script type="text/javascript"
	src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/js/jquery.cookie.js?2018072001"></script>
<link type="text/css" rel="stylesheet"
	href="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/jqueryui/1.11.4/jquery-ui.min.css?2018072001" />
<!-- Angular -->
<script type="text/javascript"
	src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/angularjs/1.4.3/angular-animate.min.js?2018072001"></script>
<script type="text/javascript"
	src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/bootstrap/ui-bootstrap-tpls-0.13.0.min.js?2018072001"></script>
<!-- Facebook -->
<script type="text/javascript"
	src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/FB_script.js?2018072001"></script>
<link type="text/css" rel="stylesheet"
	href="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/css/style.css?2018072001" />
<!-- Bootstrap -->
<script type="text/javascript"
	src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/bootstrap/bootstrap.min.js?2018072001"></script>
<link type="text/css" rel="stylesheet"
	href="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/bootstrap/bootstrap.min.css?2018072001" />
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]><script type="text/javascript" src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/bootstrap/html5shiv.js?2018072001"></script><script type="text/javascript" src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/bootstrap/respond.min.js?2018072001"></script><![endif]-->
<!-- font-awesome -->
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css?2018072001">
<!-- Custom -->
<link type="text/css" rel="stylesheet"
	href="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/index.css?2018072001" />
<script type="text/javascript"
	src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/index.js?2018072001"></script>
<script
	src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/notice/noticeApp.js?2018072001"
	type="text/javascript"></script>
<!-- // 2017.12.01 Xeroad : GPS -->
<script Type="Text/JavaScript"
	src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/Xeroad/getAjax.js"></script>


<title>맛집 검색, Tasty House</title>
<!-- Facebook Pixel Code -->
<script>
	!function(f, b, e, v, n, t, s) {
		if (f.fbq)
			return;
		n = f.fbq = function() {
			n.callMethod ? n.callMethod.apply(n, arguments) : n.queue
				.push(arguments)
		};
		if (!f._fbq)
			f._fbq = n;
		n.push = n;
		n.loaded = !0;
		n.version = '2.0';
		n.queue = [];
		t = b.createElement(e);
		t.async = !0;
		t.src = v;
		s = b.getElementsByTagName(e)[0];
		s.parentNode.insertBefore(t, s)
	}(window, document, 'script', '//connect.facebook.net/en_US/fbevents.js');
	fbq('init', '950571798344364');
	fbq('track', "PageView");
	fbq('track', "viewContent");
</script>

<!-- Google Analytics -->
<script>
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script', '//www.google-analytics.com/analytics.js',
		'ga');
	ga('create', 'UA-46679784-1', 'diningcode.com');
	ga('send', 'pageview');
</script>
<!-- End Google Analytics -->
<style>
@import url(//fonts.googleapis.com/earlyaccess/lobster.css);

#menu_nav_list li{
	font-family:'Boogaloo';
	font-weight:800;
	font-size:15px;
}
.dropdown-menu {
	color:black;
}
#active {
	color:black;
}
#active:hover {
	background-color: #FF6347;
	color:white;
}
</style>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		String user_state = (String) session.getAttribute("user_state");
		String cookie = (String) request.getParameter("cc");
		System.out.println(id);
	%>
	<script type=text/javascript>
	$(document).ready(function() {
		
			if(<%=cookie%>==null)
			{
				if(<%=id%>==null){
					location.href="/Food/member/cookieCheck.jsp";	
				}
				
			}
			
	});
</script>
	<div ng-include="'sharedApp/popup/event.php?2018072001'"></div>
	<div ng-include="'report/report_new_popup.php?2018072001'"></div>
	<script
		src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/login_module.js?2018072001"></script>
	<link
		href="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/login_module.css?2018072001"
		rel="stylesheet">
	<link
		href="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/css/loader.css?2018072001"
		rel="stylesheet">
	<script>
		var w_server = "http://www.diningcode.com";
		var dicons = "https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/";
		var http_host = "www.diningcode.com";
	</script>


	<div id="outline_div">
		<div id="back_div">
			<div id="background-div">
				<img
					src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/main/bg/main7.jpg"
					id="background-img-1"> <img
					src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/main/bg/main7.jpg"
					id="background-img-2">
			</div>
			<div id="op_div"></div>
			<!-- 2017.07.10 Xeroad : 화면 변경 -->
			<div id="div_new"
				style="position: absolute; top: 200px; left: 50%; width: 552px; margin-left: -276px; z-index: 1;">
				<div id="tasty" style="margin-bottom: -30px; color: #FF6347; font-size: 80px; font-family:'Boogaloo'; text-shadow: 2px 1px #D3D7D4;">TASTY</div>
				<div id="house" style="margin-bottom: -10px; color: #FF6347; font-size: 130px; font-family:'Boogaloo'; text-shadow: 2px 1px #D3D7D4;"
					width="50">HOUSE</div>
				<link rel="stylesheet"
					href="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/autocomplete.css?2018072001"
					type="text/css" />
				<script
					src='https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/autocomplete.js?2018072001'></script>
				<link type="text/css" rel="stylesheet"
					href="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/search_main.css?2018072001" />


				<div id="search_area">
					<%-- <form id="search_form"
						action="<%=request.getContextPath()%>/blog/blogList.jsp"
						method="post"> --%>
					<form id="search_form"
						action="<%=request.getContextPath()%>/evalList.ev?store_id=store0021";
						method="post">
						<div class="hide" id="hidden_wrapper">
							<input type="hidden" id="title_onoff" name="rn" value="0">
							<input type="hidden" id="page" name="page"> <input
								type="hidden" id="chunk" name="chunk"> <input
								type="hidden" id="lat" name="lat"> <input type="hidden"
								id="lng" name="lng">
						</div>
						<div class="container-fluid" id="search_wrapper">
							<div class="container-fluid" id="search_input_wrapper">
								<!--<input type="text" id="s_input" name="query" autocomplete="off" value="-->
								<?//=$query?>
								<!--" placeholder="예: -->
								<?//=get_ph()?>
								<!--" style="width:500px; height:50px;" />-->
								<input type="text" id="s_input" name="query" autocomplete="off"
									value="" style="width: 500px; height: 50px;" />
								<!-- 2017.07.10 Xeroad : 기존 s_button css을 그대로 두기 위한 처리 -->
								<button type="submit" onClick=""
									style="width: 50px; height: 50px; border: #ffffff solid 1px; background-color: #FF6347; float: left;">
									<img
										src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/ic-search-input.png" />
								</button>
								<button type="submit" id="s_button" style="display: none;"></button>
								<div id="ms_ext_area" class="clear board"
									style="width: 549px; margin-top: 19px;">
									<div id="list_area" class="list_area" style="width: 549px;"></div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div id="main_notice_div" ng-controller="noticeCtrl"
					style="margin: 12px; font-size: 15px;">
					<notice-dir ng-if="notice" ng-model="notice"></notice-dir>
				</div>
				<div id="pop_sub_area"></div>
			</div>
			<div id="menu_div">
				<div id="menu_nav">
					<ul id="menu_nav_list">
						<li><a href=""></a>ABOUT</li>
						<li><a href="./postList.po">POST</a></li>
						<li><a href=""></a></li>
						<li><a href=""></a></li>
						<li><a href=""></a></li>
						<li><a href=""></a></li>
					</ul>
					<script type="text/javascript"
						src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/user_menu.js?2018072001"></script>
					<link
						href="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/user_menu.css?2018072001"
						rel="stylesheet">
					<script>
						var w_server = "http://www.diningcode.com/";
						var dicons = "https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/";
					</script>

					<div class="main-top-user box-row pull-right m-top7">
						<div class="dropdown dropdown-green po-relative">
							<!-- ng-show="!sessionIn" -->
							<%
								if (id != null) {
							%>

							<button id="userLabel" type="button" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">
								<span class="label-name top-user-name color-ff"><%=session.getAttribute("name")%>님</span>
								<span class="label-name top-user-name color-ff"></span>
								<div class="top-user-prof">
									<div class='pic-loading-wrap'>
										<div class='pic-loader'></div>
									</div>
									<img id="user_img"
										src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/login/ic_login_setting_user.png" />
								</div>
							</button>
							<%
								if (("admin").equals(id)) {
							%>
							<ul class="dropdown-menu" role="menu" aria-labelledby="userLabel"
								style="background-color:lightgrey;color:black">
								<li id="active"> <a href="#" 
									onClick="document.location.href='<%=request.getContextPath()%>/applyList.sto'">매장
										등록 신청 확인 </a></li>
								<li id="active"><a href="#"
									onClick="location.href='member/logout.jsp';">로그아웃</a></li>
							</ul>
							<%
								} else {
							%>

							<ul class="dropdown-menu" role="menu" aria-labelledby="userLabel"
								style="background-color:lightgrey;color:black">
								<%
									if (("owner").equals(user_state)) {
								%>
								<li id="active"><a href="#"	onClick="document.location.href='<%=request.getContextPath()%>/manageStore.sto?id=<%=id%>';">매장 관리 </a></li>
								<li id="active"><a href="#" onClick="location.href='./ReservatonStoreList.re'">매장별 예약 현황 확인 </a></li>
										
								<%
									} else {
								%>
								<li id="active"><a href="#"	onClick="'#'">나의 맛집 </a></li>
								<%
									}
								%>
								<li id="active"><a href="#" onClick="location.href='ReservationList.re'">예약
										확인 </a></li>
								<li id="active"><a href="#" 
									onClick="location.href='memberInfo.mb?id=<%=id%>';">나의 정보 </a></li>
								<li  id="active"><a href="#"
									onClick="location.href='member/logout.jsp';">로그아웃</a></li>
							</ul>
							<%
								}
								}
							%>
						</div>

						<div class="dropdown dropdown-green po-relative">
							<!-- ng-show="!sessionOut" -->
							<%
								if (id == null) {
							%>
							<div onClick="location.href='member/login.jsp';"
								style="cursor: pointer;">
								<button type="button">
									<span class="label-name top-user-name color-ff">로그인</span>
								</button>
								<div class="top-user-prof">
									<img id="user_img" />
								</div>
								<%
									}
								%>
							</div>
						</div>
					</div>
					<!--// 오른쪽 메뉴 -->
					<!-- <div class="main-top-user box-row pull-right m-top7" ><div id="logged_out" class="dropdown dropdown-green po-relative" ><button id="userLabel" type="button" data-toggle="modal" data-target="#loginModal"><span class="label-name top-user-name color-ff" id="user_name">회원가입</span></button><button id="userLabel" type="button" data-toggle="modal" data-target="#loginModal"><img class="top-user-img" src="../img/i_user.png"/></button></div></div> -->
					<!--// 오른쪽 메뉴-->
				</div>
			</div>
			<div id="mint_div"
				style="background-color: #FF6347; height: 80px; z-index: 2; cursor: pointer;">
				<%
					if (("owner").equals(user_state)) {
				%>
				<div style="margin: 0 auto; padding: 5px 0; width: 760px;">

					<div id="report_new_rest_button"
						style="font-weight: bold; font-size: 16px;font-family:'맑은고딕"
						onclick="location.href='./store/applyStore.jsp';">맛집 등록 신청하기</div>
					<%
						}
					%>
					<div
						style="padding-top: 12px; color: #ffffff; font-weight: bold; font-size: 16px; float: left;"></div>
					<div style="clear: both;"></div>
				</div>

			</div>
		</div>
		<link type="text/css" rel="stylesheet"
			href="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/footer.css?2018072001" />
		<div id="footer_div" style="background-color: #f6f6f6;">
			<div id="footer_text">COPYRIGHT ⓒ TASTY HOUSE .</div>
		</div>

	</div>


</body>
</html>