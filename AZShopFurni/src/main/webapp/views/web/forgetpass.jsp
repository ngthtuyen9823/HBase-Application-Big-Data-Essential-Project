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

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/templates/web/vendor/bootstrap/css/bootstrap.min.css"/>">
<!-- Style -->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/templates/web/css/login.css"/>">


<title>Quên mật khẩu</title>
</head>

<body>

	<div class="wrapper">
		<h1>
			QUÊN MẬT KHẨU
			</h1>
				<h4>${exception}</h4>
				<form action="forgetpass" method="post">
					<div class="input-box">
						<input type="text" placeholder="Nhập mail" name="formail"
							value="${formail}" required> <i class='bx bxl-gmail bx-tada' ></i>
					</div>
					<button type="submit" class="btn">Xác nhận</button>
				</form>
	</div>
</body>

</html>