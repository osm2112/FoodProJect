<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>main image upload</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
</head>
<body>
<!-- main image upload -->
	<form method="post" enctype="multipart/form-data"
		action="../PostFileUpload">
		<div class="input-group mb-3">
			<div class="custom-file" style="margin: 5px">
				<input type="file" class="custom-file-input" id="inputGroupFile02"
					name="attach1"
					onchange="javascript:document.getElementById('file_route').value=this.value" />
				<label class="custom-file-label" for="inputGroupFile02"
					aria-describedby="inputGroupFileAddon02">Choose file</label>

			</div>
		</div>
		<div class="input-group mb-3">
				<input type="text" class="form-control"
				placeholder="filename" aria-label="Recipient's username"
				aria-describedby="button-addon2"
				id="file_route" size="30">
		</div>

		<input type="submit" value="파일업로드" / class="btn btn-block btn-light"
			id="inputGroupFileAddon02">

	</form>
</body>
</html>