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

<title>Đăng nhập</title>
</head>

<body>
	<div class="wrapper">
		<form action="/AZShopFurni/login" method="post">
			<h1>
				ĐĂNG NHẬP
				</h1>
					<h4>${mess}</h4>
					<div class="input-box">
						<input type="text" placeholder="Tên đăng nhập" value="${username}"
							name="username" required> <i class='bx bxs-user'></i>
					</div>
					<div class="input-box">
						<input type="password" placeholder="Mật khẩu" name="password"
							required> <i class='bx bxs-lock-alt'></i>
					</div>
					<div class="remember-forgot">
						<label><input type="checkbox" name="remember" value="on">Nhớ
							mật khẩu</label> <a href="${pageContext.request.contextPath}/forgetpass">Quên
							mật khẩu</a>
					</div>
					<button type="submit" class="btn">Đăng nhập</button>
					<div class="register-link">
						<p>
							Bạn chưa có tài khoản? <a
								href="${pageContext.request.contextPath}/signup">Đăng ký</a>
						</p>
					</div>
		</form>
	</div>
</body> 
</html>