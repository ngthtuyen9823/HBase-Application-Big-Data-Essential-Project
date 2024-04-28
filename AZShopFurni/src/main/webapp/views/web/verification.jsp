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
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap"
	rel="stylesheet">
<link rel="icon" type="image/png" href="https://storage.googleapis.com/web-budget/Image/FE/website-logo.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/templates/web/vendor/bootstrap/css/bootstrap.min.css"/>">
<!-- Style -->

<link rel="stylesheet" type="text/css"
	href="<c:url value="/templates/web/css/login.css"/>">


<title>Xác nhận</title>
</head>

<body>

	<div class="wrapper">
			<h1>
				XÁC NHẬN
				</h1>
					<h4 class="xac-nhan">Mã xác nhận đã được gửi tới email của bạn!</h4>
					<h4>${mess}</h4>
					<form action="verification" method="post">
						<div class="input-box">
							<input type="text" placeholder="Nhập mã xác nhận trên email"
								name="usercode" required>
						</div>
						<button type="submit" class="btn">Đăng nhập</button>
					</form>
					<span class="caption">Nếu sau 5 phút chưa có mã?</span> <a
						href="${pageContext.request.contextPath}/resend">Gửi lại mã</a>
	</div>
</body>

</html>