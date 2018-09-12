<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Lobster"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../se/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script src="/Food/js/PostInputCheckValue.js"></script>
<style>
.size {
	height: 50px;
}


.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
	width: 1000px;
	border: 1px solid lightgrey;
}
.centered2 {
	display: table;
	margin-left: auto;
	margin-right: auto;
	width: 800px;
}

.form {
	width: 800px;
	padding: 15px;
	text-align: center;
}

.button {
	text-align: center;
	padding: 5px;
}

.font {
	text-align: center;
	font: 20px bold;
	font-weight: 800;
	float: right;
	margin-right: 15px;
	margin-bottom:15px;
	color: grey;
}

.mainImg {
	width: 650px;
	float: left;
	margin-left:-5px;
}
</style>
<script>
	$(function() {
		//전역변수선언
		var editor_object = [];

		nhn.husky.EZCreator.createInIFrame({
			oAppRef : editor_object,
			elPlaceHolder : "smarteditor",
			sSkinURI : "../se/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : false,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
			}
		});

		//전송버튼 클릭이벤트
		$("#savebutton").click(
			function() {
				//id가 smarteditor인 textarea에 에디터에서 대입
				editor_object.getById["smarteditor"].exec(
					"UPDATE_CONTENTS_FIELD", []);

				// 이부분에 에디터 validation 검증

				//폼 submit
				$("#frm").submit();
			})
	})
	function file_open() {
		window.open("upload.jsp", "upload",
				"width=450 height=200 left=300 top=30");
	}
	
</script>

</head>

<body>

	<%
		String store_id = (String) request.getParameter("store_id");
		String store_name = (String) request.getParameter("store_name");
	%>
	<jsp:include page="postHeader.jsp" />
	<div class="size"></div>
	<div class="centered">
		<div class="centered2">
		<div class="size"></div>
		<div class="font">WRITE</div>
		<br>
		<div>
		<!-- post 글쓰기 form -->
			<form action="<%=request.getContextPath()%>/postInput.po"
				method="post" id="frm" onSubmit="return PostInputCheckValue()" name="form">
				<input type="hidden" name="write_id" value="${id}"> <input
					type="hidden" name="write_name" value="${name}"> 
				<div class="form">
					<div>
						<div>
							<input type="text" class="form-control" placeholder="title"
								name="title" autofocus>
						</div>
						<div>
							<input type="text" class="form-control" placeholder="subtitle"
								name="subtitle">
						</div>
						<div class="form-control" style="height:50px">
							<input type="text" name="mainImg" class="mainImg" placeholder="메인 사진을 올려주세요." />
							<input type="button" style="background-color: white; border: 1px solid lightgrey" value="파일첨부"
								onclick="file_open()">
						</div>

						<div style="background-color: white">
							<textarea name="content" id="smarteditor" rows="10" cols="60"
								style="width: 766px; height: auto; resize: none"></textarea>
						</div>
						<div class="button">
							&nbsp;&nbsp;
							<input type="submit" class="btn btn-light"  id="savebutton" value="작성">
							<input type="button" class="btn btn-light" onclick="location.href='javascript:history.go(-1)'"
								value="취소">
						</div>
						<div class="size"></div>
					</div>
				</div>
			</form>
		</div>
		</div>
	</div>
	<jsp:include page="../footer.html"></jsp:include>



</body>
</html>