<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Style -->
<link rel="icon" type="image/png" href="https://storage.googleapis.com/web-budget/Image/FE/website-logo.png">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/templates/web/css/login.css"/>">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>


<title>Đổi mật khẩu</title>
</head>
<body>
	<div class="wrapper">
		<form action="changepass" method="post">
			<input type="hidden" name="formail" value="${formail}" />
			<h1>ĐỔI MẬT KHẨU</h1>
			<h2>${mess}</h2>
			<div class="input-box">
				<input type="text" placeholder="Nhập mật khẩu" value="${passchange}"
					name="passchange" required> <i class='bx bxs-lock-alt'></i>
			</div>
			<div class="input-box">
				<input type="password" placeholder="Nhập mật khẩu mới"
					name="passcheck" required> <i class='bx bxs-lock-alt'></i>
			</div>
			<button type="submit" class="btn">Cập nhật</button>
		</form>
	</div>
</body>

</html>